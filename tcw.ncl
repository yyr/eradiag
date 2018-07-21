; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)

  do it = 0, 2, 1    ; doc
    type = "pdf"
    fn = "tcw_" + ys(it) + "d"
    wks = gsn_open_wks(type, fn)

    fname = fn + ".nc"
    fh = addfile(fname, "r")

    vname = "tcwv"
    var = fh->$vname$
    var_a = dim_avg_n_Wrap(var, (/1,2/))

    res = eradiag_set_tm(True)
    res = set_res_aspectratio_manual(res, 0.7, 0.4)
    res = set_res_tix_limits(res, 0, 213)
    res@gsnCenterString = ys(it)
    res@gsnRightString = var@units

    plot = gsn_csm_y(wks, var_a, res)
  end do
end
