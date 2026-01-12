#!/usr/bin/env bash
. gettext.sh

export TEXTDOMAIN=test.bash_gettext
echo "TEXTDOMAIN='${TEXTDOMAIN}'"
export TEXTDOMAINDIR="$(cd "$(dirname "$0")" && pwd)/locale"
echo "TEXTDOMAINDIR='${TEXTDOMAINDIR}'"

echo "$(gettext "Hello, world!")"

value1="$(gettext "Value 1")"
msg="$(gettext "This is the test message 1: value='\${value1}'")"
echo "msg='${msg}'"
eval "printf \"'%s'\n\" \"$msg\""

count=1
msg=$(ngettext \
  '$count file found' \
  '$count files found' \
  "$count")
echo "msg='${msg}'"
eval "printf \"'%s'\n\" \"$msg\""


count=3
msg=$(ngettext \
  '$count file found' \
  '$count files found' \
  "$count")
echo "msg='${msg}'"
eval "printf \"'%s'\n\" \"$msg\""
  
