# Initially written by Puhup Agarwal

from fatshell.modules import color_print

class _BAT_SHUT:
    def __init__(self, dataflash) -> None:
        self.analysis = dataflash
        event = self.analysis.data.GetEvents()
        arm_time = event[(event.Event == "ARMED") | (event.Event == "AUTO_ARMED")]["DateTime"].to_list()[0]
        try:
            self.Curr = self.analysis.extract_interval_column('BAT', 'Curr', arm_time, self.analysis.last_timestep)
            self.SAlt = self.analysis.extract_interval_column('CTUN', 'SAlt', arm_time, self.analysis.last_timestep)
        except KeyError:
            self.Curr = []
            self.SAlt = []
    
    def Curr_SAlt_Check(self):
      Curr_firstvalue = self.Curr.iloc[0]
      Curr_lastvalue = self.Curr.iloc[-1]
      SAlt_firstvalue = self.SAlt.iloc[0]
      SAlt_lastvalue = self.SAlt.iloc[-1]

      if Curr_lastvalue > (Curr_firstvalue * 1.3):
        if SAlt_lastvalue > (SAlt_firstvalue * 1.3):
          flag = 'fail'
          message = f"Battery shutdown"
          return (message , flag)    
        else:
          flag = 'warn'
          message = f"Battery shutdown possible"
          return(message , flag)
      else:
        message = f"No Battery shuts down"
        return (message , None)
                      
def check_BAT_SHUT(dataflash):
    check = _BAT_SHUT(dataflash)
    if len(check.Curr) == 0 or len(check.SAlt) == 0:
        flag = 'warn'
        color_print(f"▪ BAT or CTUN is not logged/empty", flag=flag)
        return

    message, flag = check.Curr_SAlt_Check()
    color_print(f"▪ {message}", flag=flag)