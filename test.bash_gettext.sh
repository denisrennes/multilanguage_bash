#!/usr/bin/env bash
. gettext.sh

export TEXTDOMAIN=test.bash_gettext
echo "TEXTDOMAIN='${TEXTDOMAIN}'"
export TEXTDOMAINDIR="$(cd "$(dirname "$0")" && pwd)/locale"
echo "TEXTDOMAINDIR='${TEXTDOMAINDIR}'"

echo "$(gettext "Hello, world!")"

value1="$(gettext "Value 1")"
# ${value1} must not be replaced by its value (expanded) when provided as argument to gettext, so here we use single quotes: '...=${value1}'.
# The key to retrieve the translated text ends literaly with '=${value1}' (msgid in the .po and .mo files)
msg="$( eval_gettext 'This is the test message 1: value="${value1}"' )"
echo "msg='${msg}'"

value2="$(gettext "Value 2")"
# ${value2} must not be replaced by its value (expanded) when provided as argument to eval_gettext, so here we use '\$'' inside double quotes to prevent the variable expansion.
msg="$( eval_gettext "This is the test message 2: value=\"\${value2}\"" )"
echo "msg='${msg}'"

count=1
msg=$( eval_ngettext \
  '$count horse, $count mouse' \
  '$count horses, $count mice' \
  "$count" )
echo "msg='${msg}'"

count=3
msg=$( eval_ngettext \
  '$count horse, $count mouse' \
  '$count horses, $count mice' \
  "$count" )
echo "msg='${msg}'"
  
