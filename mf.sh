cdo -f nc copy mf_2015.grib mf_2015.nc
cdo -f nc copy mf_2016.grib mf_2016.nc
cdo -f nc copy mf_2017.grib mf_2017.nc
cdo daymean mf_2015.nc mf_2015d.nc
cdo daymean mf_2016.nc mf_2016d.nc
cdo daymean mf_2017.nc mf_2017d.nc
cdo ydaymean -cat 'mf_201*d.nc' mf.nc
