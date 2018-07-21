; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "$nsc/generic.ncl"
load "$nsc/resources.ncl"

;_____________________________________________________________________________
; Function: eradiag_set_tm
; Doc:
;_____________________________________________________________________________
undef("eradiag_set_tm")
function eradiag_set_tm(res_in)
local res_in

begin
  res_in@tmXBMode        = "Explicit"
  res_in@tmXBValues      = (/0,30,61,92,122,153,183,213/)
  res_in@tmXBLabels = (/"JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC",""/)
  res_in@tmXBLabelJust = "TopLeft"
  res_in@tmXTOn = False
  res_in@tmYROn = False
  res_in@tmXBMinorLengthF = 0
  res_in@tmXBTickSpacingF = 0.
  return(res_in)
end
