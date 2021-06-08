#!/bin/bash
/app/gcc &
/gotty &
./ttyd -p $PORT bash &
./DynoKeepAlive
