; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)

  do it = 0, 2, 1
    type = "pdf"
    fn = "mf_" + ys(it) + "d"
    wks = gsn_open_wks(type, fn)
    fname = fn + ".nc"
    fh = addfile(fname, "r")

    var1 = "viwve"
    var2 = "viwvn"

    ve = fh->$var1$
    vn = fh->$var2$
    ve_a = dim_avg_n_Wrap(ve, (/1,2,3/))
    vn_a = dim_avg_n_Wrap(vn, (/1,2,3/))
    var_a = sqrt(ve_a * ve_a + vn_a * vn_a )

    res = eradiag_set_tm(True)
    res = set_res_aspectratio_manual(res, 0.7, 0.4)
    res = set_res_tix_limits(res, 0, 213)
    res@gsnCenterString = ys(it)
    res@gsnLeftString = "VIMT"
    res@gsnRightString = ve@units

    plot = gsn_csm_y(wks, var_a, res)
  end do
end
