; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Thursday, July 19 2018

; Downloaded files fire virtical integrated eastward moisture flux and
; virtical integrated northward moisture flux. So calculate vertical
; integrated moisture flux/transport for the domian(VIMT). (1/g ∫ QVdp) (where
; V is vector wind)

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)

  ao = "mf.txt"
  system("rm " + ao)

  do it = 0, 2, 1
    type = "pdf"
    fn = "mf_" + ys(it) + "d"
    wks = gsn_open_wks(type, fn)

    fname = fn + ".nc"
    fh = addfile(fname, "r")

    t = fh->time

    var1 = "viwve"
    var2 = "viwvn"

    ve = fh->$var1$
    vn = fh->$var2$
    ve_a = dim_avg_n_Wrap(ve, (/1,2,3/))
    vn_a = dim_avg_n_Wrap(vn, (/1,2,3/))

    var_a = sqrt(ve_a * ve_a + vn_a * vn_a ) ; calculate magnatude from i,j
                                             ; components.

    res = True
    res@gsnFrame = False
    res@gsnMaximize = True        ; Maximize plot in frame; aspect ratio
    res@gsnPaperOrientation = "portrait"

    res = set_res_aspectratio_manual(res, 0.7, 0.4)
    res = set_res_tix_limits(res, 0, 213)
    res = set_res_tiy_limits(res, 0, 800)
    res = set_res_tmtr_off(res)

    res@gsnLeftString = "VIMT"
    res@gsnCenterString = ys(it)
    res@gsnRightString = ve@units

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
    write_table(ao, "a", [/cd_calendar(t, -2), var_a/], "%8d%10.2f")
    delete(res)
  end do
end
