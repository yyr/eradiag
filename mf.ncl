; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

begin
  fname = "mf.nc"
  fh = addfile(fname, "r")

  ; list_filevars(fh)

  vname = "viwvd"
  mf = short2flt(fh->$vname$)
  printVarSummary(mf)

  mf_a = dim_avg_n_Wrap(mf, (/1,2,3/))
  printVarSummary(mf_a)
  printMinMax(mf_a,True)

  type = "pdf"
  wks = gsn_open_wks(type,"mf")
  plot = gsn_csm_y(wks, mf_a, True)
end
