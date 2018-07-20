#!/usr/bin/env python
# eastward vapour flux
# northward vapour flux

from ecmwfapi import ECMWFDataServer
server = ECMWFDataServer()
for d in [2015, 2016, 2017]:
    # print("{y}-06-01/to/{y}-09-30".format(y=d))
    server.retrieve({
        "class": "ei",
        "dataset": "interim",
        "date": "{y}-06-01/to/{y}-12-31".format(y=d),
        "expver": "1",
        "grid": "0.25/0.25",
        "levtype": "sfc",
        "param": "71.162/72.162",
        "step": "0",
        # "3,6,9,12",
        "stream": "oper",
        "time": "00:00:00/06:00:00/12:00:00/18:00:00",
        # "time": "00:00:00/12:00:00",
        "area": "11/70/5/76",
        "type": "an",
        "target": "mf_{y}.grib".format(y=d),
        # "format": "netcdf",
    })
