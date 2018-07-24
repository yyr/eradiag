; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
; Created: Monday, July 23 2018

; E-P Budget, spacial distribution.

load "./eradiag.ncl"

begin
  ys = (/2015, 2016, 2017/)
  type = "pdf"

  plot = new(6,graphic)
  wks = gsn_open_wks(type, "ep_sd")

  p = -1
  do it = 0, 2, 1
    fn1 = "ev_" + ys(it) + ".nc"
    fn2 = "tp_" + ys(it) + ".nc"
    fh1 = addfile(fn1, "r")
    fh2 = addfile(fn2, "r")

    ; t = fh1->time
    E = fh1->e
    P = fh2->tp

    ep = E - P

    ; 0-121, 122-213
    ep_jjas_d =  ep(0:121,:,:)
    ep_jjas = dim_avg_n_Wrap(ep_jjas_d, 0) * 1000.
    ep_ond_d = ep(122:213,:,:)
    ep_ond = dim_avg_n_Wrap(ep_ond_d, 0)  * 1000.

    copy_VarCoords_not_n(E, ep_jjas, 0)
    copy_VarCoords_not_n(E, ep_ond, 0)

    res = True
    res@gsnAddCyclic = False
    res = set_res_cn(res)

    res = set_res_mp_latlon(res, 69,77,4,12)
    set_res_cn_limits(res,-10,-1,.2)
    res = set_res_no_frame(res)
    res@lbLabelBarOn = False

    res@gsnLeftString = "E-P"
    res@gsnRightString = "mm"

    res@gsnCenterString = ys(it) + "  JJAS"
    p = p + 1
    plot(p) = gsn_csm_contour_map(wks, ep_jjas, res)

    res@gsnCenterString = ys(it) + "  OND"
    p = p + 1
    plot(p) = gsn_csm_contour_map(wks, ep_ond, res)

    delete(res)
  end do
  pres                = True              ; mod panel plot
  pres@gsnMaximize = True        ; Maximize plot in frame; aspect ratio
  pres = set_res_panel(pres)
  pres = set_res_no_margin(pres)
  gsn_panel(wks,plot,(/3,2/),pres)        ; create panel plot
end
