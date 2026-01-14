#!/usr/bin/env bash

cd "$(dirname "$0")"
pwd

./gen_po.sh ./test.bash_gettext.sh fr

echo; read -n 1 -p 'Press any key...'
