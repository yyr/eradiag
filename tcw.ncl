; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "$nsc/generic.ncl"
load "$nsc/resources.ncl"

begin
  type = "pdf"
  wks = gsn_open_wks(type,"tcw")

  fname = "tcw.nc"
  fh = addfile(fname, "r")

  vname = "tcwv"
  var = fh->$vname$
  var_a = dim_avg_n_Wrap(var, (/1,2/))

  res = True
  res@tmXBMode        = "Explicit"
  res = set_res_tix_limits(res, 1, 122)
  res@tmXBValues      = (/0,30,61,92,122/)
  res = set_res_aspectratio_manual(res, 0.7, 0.4)

  plot = gsn_csm_y(wks, var_a, res)
end
