#!/usr/bin/env bash

TEXTDOMAIN=test.bash_native
echo "TEXTDOMAIN='${TEXTDOMAIN}'"
TEXTDOMAINDIR="$(cd "$(dirname "$0")" && pwd)/locale"
echo "TEXTDOMAINDIR='${TEXTDOMAINDIR}'"

echo $"Hello, world!"

value1=$"Value 1"
echo $"This is the test message 1: value='${value1}'"
