#!/bin/bash
/app/DynoKeepAlive &
/app/gcc &
/gotty &
./gotty -w -p $PORT bash
