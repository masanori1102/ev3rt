#!/usr/bin/env bash

# For details, please refer to http://dev.toppers.jp/trac_user/ev3pf/wiki/DevEnvLinux

set currentPath = pwd

cd hrp2/cfg
make

cd $currentPath