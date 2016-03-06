#!/bin/sh

echo "Issue #$1"
echo "Update to $2"

# Validate value
if [ $# -ne 2 ]
then
  echo "The specified number of arguments are $#."
  echo "To do so you must have 2 argument(s)."
  exit 1
fi

arg1=${1}
expect_empty=`echo -n ${arg1} | sed 's/[0-9]//g'`

if [ "x" = "x${arg1}" ] || [ "x" != "x${expect_empty}" ]
then
  echo "Set issue as number"
  exit 1
fi

# Remove old files and directories
rm -rf ../$2/
rm -rf EV3RT_C*_API_Reference/
rm -rf hrp2/
rm -rf sdcard/
rm ngki_spec*.pdf
rm *.zip*

# Download package
wget http://www.toppers.jp/download.cgi/$2.zip
if [ "$?" -ne 0 ]
then
  # Reset the updates
  git reset --hard HEAD^
  exit 2
fi

# Update package
unzip $2.zip -d ..
rm $2.zip
cp -r ../$2/* .
xz -dv hrp2.tar.xz
tar -xvf hrp2.tar
rm hrp2.tar
rm -rf ../$2/
rm .zip*
rm *.*~

# Commit to repository
git add *
git commit -am "#$1 Update package to $2.zip"

exit 0

