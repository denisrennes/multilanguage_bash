#!/usr/bin/env bash

cd "$(dirname "$0")"
pwd

TEXTDOMAIN="test.bash_native"

fr_msg_dir='./locale/fr/LC_MESSAGES'
mkdir -p "${fr_msg_dir}"


source_file="${TEXTDOMAIN}.sh"
result_file="${TEXTDOMAIN}.pot"
echo -n "Generate '${result_file}' from '${source_file}'... "
if [ -f "${result_file}" ]; then rm "${result_file}"; fi 

xgettext -L Shell --keyword='$"' -o "${result_file}" "${source_file}"
if [ -f "${result_file}" ]; then echo 'ok'; else echo 'ERROR!'; exit 255; fi 


source_file=${result_file}
result_file="${fr_msg_dir}/${TEXTDOMAIN}.po"
echo -n "Generate '${result_file}' from '${source_file}'... "
if [ -f "${result_file}" ]; then rm "${result_file}"; fi 

msginit -l fr -i "${source_file}" -o "${result_file}"
if [ -f "${result_file}" ]; then echo 'ok'; else echo 'ERROR!'; exit 255; fi 


source_file=${result_file}
echo 'Edit the .po file: put translated strings in msgstr "" lines, then save and close...'
xed "${source_file}"
echo; read -n 1 -p 'Press any key...'

source_file=${result_file}
result_file="${fr_msg_dir}/${TEXTDOMAIN}.mo"
echo -n "Generate '${result_file}' from '${source_file}'... "
if [ -f "${result_file}" ]; then rm "${result_file}"; fi 

msgfmt "${source_file}" -o "${result_file}"
if [ -f "${result_file}" ]; then echo 'ok'; else echo 'ERROR!'; exit 255; fi 


echo
echo "To test in French, just launch this command line: 'LANGUAGE=fr_FR ./${TEXTDOMAIN}.sh'"
echo; read -n 1 -p 'Press any key...'

