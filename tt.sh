cdo -f nc copy tt_2015.grib tt_2015.nc
cdo -f nc copy tt_2016.grib tt_2016.nc
cdo -f nc copy tt_2017.grib tt_2017.nc
cdo daymean tt_2015.nc tt_2015d.nc
cdo daymean tt_2016.nc tt_2016d.nc
cdo daymean tt_2017.nc tt_2017d.nc
cdo ydaymean -cat 'tt_201*d.nc' tt.nc
