; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "$nsc/generic.ncl"
load "$nsc/resources.ncl"

begin
  type = "pdf"
  wks = gsn_open_wks(type,"tt")

  fname = "tt.nc"
  fh = addfile(fname, "r")

  vname = "t"
  var = fh->$vname$
  var_a = dim_avg_n_Wrap(var, (/1,2,3/))

  res = True
  res = set_res_tix_limits(res, 1, 122)
  res@tmXBMode        = "Explicit"
  res@tmXBValues      = (/0,30,61,92,122/)
  res = set_res_aspectratio_manual(res, 0.7, 0.4)

  plot = gsn_csm_y(wks, var_a, res)
end
