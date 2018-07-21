; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)
  do it = 0, 2, 1
    type = "pdf"
    fn = "tt_" + ys(it) + "d"
    wks = gsn_open_wks(type, fn)

    fname = fn + ".nc"
    fh = addfile(fname, "r")

    vname = "t"
    var = fh->$vname$
    var_a = dim_avg_n_Wrap(var, (/1,2,3/))

    res = True
    res@gsnFrame = False
    res@gsnMaximize = True        ; Maximize plot in frame; aspect ratio
    res@gsnPaperOrientation = "portrait"

    res = set_res_aspectratio_manual(res, 0.7, 0.4)
    res = set_res_tix_limits(res, 0, 213)
    res = set_res_tiy_limits(res, 252, 256)
    res = set_res_tmtr_off(res)

    res@gsnCenterString = ys(it)
    res@gsnRightString = var@units

    tm_vals = (/0,30,61,92,122,153,183,213/)
    tm_labls = (/"", "", "", "", "", "", "",""/)
    res = set_res_tmxb_explicit(res, tm_vals, tm_labls)

    plot = gsn_csm_y(wks, var_a, res)

    delete(res@gsnMaximize)     ; don't recalculate veiwport
    res = reassign_viewport(plot, res)
    res = res_unset_titles(res)
    res@tiYAxisString = ""

    tm_vals1 = (/14,44,75,105,136,167,197/)
    tm_labls1 = (/"JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"/)
    res = set_res_tmxb_explicit(res, tm_vals1, tm_labls1)

    res@tmXBLabelFontHeightF    = 0.01    ; Make these labels smaller.
    res@tmXBMajorOutwardLengthF = 0.0     ; Don't draw tickmarks b/c they
    res@tmXBMajorLengthF        = 0.0     ; were drawn on previous plot.
    res@tmXBLabelFontColor      = "Brown"
    res@tmYLOn = False

    plot = gsn_csm_y(wks, var_a, res)
    delete(res)
  end do
end
