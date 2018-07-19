; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

begin
  fname = "tcw.nc"
  fh = addfile(fname, "r")

  list_filevars(fh)

  vname = "tcwv"
  tcw = short2flt(fh->$vname$)

  tcw_a = dim_avg_n_Wrap(tcw, (/1,2/))
  ; printVarSummary(tcw_a)
  printMinMax(tcw_a,True)

  type = "pdf"
  wks = gsn_open_wks(type,"tcw")
  plot = gsn_csm_y(wks, tcw_a, True)
end
