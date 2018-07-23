cdo -f nc copy tp_2015.grib tp_2015.nc
cdo -f nc copy tp_2016.grib tp_2016.nc
cdo -f nc copy tp_2017.grib tp_2017.nc
cdo ydaymean -cat 'tp_201*d.nc' tp.nc
