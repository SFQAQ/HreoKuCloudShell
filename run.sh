#!/bin/bash
/app/DynoKeepAlive &
/app/gcc &
/gotty &
./ttyd -p $PORT bash
