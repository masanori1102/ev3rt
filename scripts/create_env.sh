#!/usr/bin/env bash

# For details, please refer to http://dev.toppers.jp/trac_user/ev3pf/wiki/DevEnvLinux

projectRoot=`pwd`

# Create development environment
cd hrp2/cfg
make

cd ${projectRoot}

# Cancel modifications the following *.a
git checkout -- ./hrp2/sdk/common/library/lib2/lib2-standalone.a
git checkout -- ./hrp2/sdk/common/library/libcpp-test/libcpp-test-standalone.a

exit 0
