#!/bin/sh

wget https://my-netdata.io/kickstart.sh

bash < kickstart.sh

service netdata start

service netdata enable

tail -f