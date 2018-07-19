; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

begin
  fname = "tt.nc"
  fh = addfile(fname, "r")

  ; list_filevars(fh)

  vname = "t"
  tt = short2flt(fh->$vname$)

  tt_a = dim_avg_n_Wrap(tt, (/1,2,3/))
  printVarSummary(tt_a)
  printMinMax(tt_a,True)


  type = "pdf"
  wks = gsn_open_wks(type,"tt")
  plot = gsn_csm_y(wks, tt_a, True)
end
