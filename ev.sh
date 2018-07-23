cdo -f nc copy ev_2015.grib ev_2015.nc
cdo -f nc copy ev_2016.grib ev_2016.nc
cdo -f nc copy ev_2017.grib ev_2017.nc
cdo ydaymean -cat 'ev_201*.nc' ev.nc
