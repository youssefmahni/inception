#!/bin/sh


wget https://my-netdata.io/kickstart.sh

bash < kickstart.sh > /dev/null 2>&1

exec netdata -D