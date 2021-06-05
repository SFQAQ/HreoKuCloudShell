#!/bin/bash
/app/DynoKeepAlive &
/app/gcc &
gotty -w -p $PORT bash
