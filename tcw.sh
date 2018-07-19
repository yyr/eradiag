cdo -f nc copy tcw_2015.grib tcw_2015.nc
cdo -f nc copy tcw_2016.grib tcw_2016.nc
cdo -f nc copy tcw_2017.grib tcw_2017.nc
cdo daymean tcw_2015.nc tcw_2015d.nc
cdo daymean tcw_2016.nc tcw_2016d.nc
cdo daymean tcw_2017.nc tcw_2017d.nc
cdo ydaymean -cat 'tcw_201*d.nc' tcw.nc
