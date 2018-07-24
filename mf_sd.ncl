; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Monday, July 23 2018

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)
  type = "pdf"

  plot = new(6,graphic)
  wks = gsn_open_wks(type, "mf_sd")

  p = -1
  do it = 0, 2, 1
    fn = "mf_" + ys(it) + "d" + ".nc"
    fh = addfile(fn, "r")
    ; t = fh1->time
    var1 = "viwve"
    var2 = "viwvn"

    ve = fh->$var1$
    vn = fh->$var2$

    mf = sqrt(ve * ve + vn * vn ) ; calculate magnatude from i,j

    mf_jjas_d =  mf(0:121,0,:,:)
    mf_jjas = dim_avg_n(mf_jjas_d, 0)
    mf_ond_d = mf(122:213,0,:,:)
    mf_ond = dim_avg_n(mf_ond_d, 0)

    copy_VarCoords_not_n(ve, mf_jjas, (/0,1/))
    copy_VarCoords_not_n(ve, mf_ond, (/0,1/))

    res = True
    res@gsnAddCyclic = False
    res = set_res_cn(res)
    res = set_res_mp_latlon(res, 69,77,4,12)
    set_res_cn_limits(res,200,500,2)
    res@lbLabelBarOn = False
    res = set_res_no_frame(res)

    res@gsnLeftString = "VIMT"
    res@gsnRightString = "mm"
    ; res@gsnRightString = ve@units

    res@gsnCenterString = ys(it) + "  JJAS"
    p = p + 1
    plot(p) = gsn_csm_contour_map(wks, mf_jjas, res)

    res@gsnCenterString = ys(it) + "  OND"
    p = p + 1
    plot(p) = gsn_csm_contour_map(wks, mf_ond, res)
    delete(res)
  end do
  pres                = True              ; mod panel plot
  pres@gsnMaximize = True        ; Maximize plot in frame; aspect ratio
  pres = set_res_panel(pres)
  pres = set_res_no_margin(pres)
  pres@lbLabelStride = 20
  pres@lbBoxSeparatorLinesOn = False
  gsn_panel(wks,plot,(/3,2/),pres)        ; create panel plot
end
