#!/usr/bin/env python
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
        "levtype": "pl",
        "levelist": "200/225/250/300/350/400/450/500/550/600/650",
        "param": "130.128",
        "step": "0",
        # "3/6/9/12",
        "stream": "oper",
        "time": "00:00:00/06:00:00/12:00:00/18:00:00",
        "area": "11/70/5/76",
        "type": "an",
        "target": "tt_{y}.grib".format(y=d),
        # "format": "netcdf",
    })
