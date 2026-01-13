# multilanguage_bash
Example Bash scripts showing two ways for internationalizing Bash scripts:  

- native bash feature $"..." string.   
This is deprecated, but still works. Does not include plural management feature.
- gettext explicit syntax.  
Includes plural management feature.

Native bash feature is reported to have compatibility and security issues.

Tested only on Linux Mint 22.2 en\_US and fr\_FR but should work on other Linux distros and other languages.

## Requirements
- Bash
- gettext  (even for the native bash way)

## Installation:
Clone the GitHub repository.

## Uninstallation:
Delete the directory where you cloned the GitHub repository.

## How to test
##### On a non-French system 
- launch this command: "LANGUAGE=fr ./test.bash\_native.sh"
- launch this command: "LANGUAGE=fr ./test.bash\_gettext.sh"
##### On a French system 
- launch this command: "LANGUAGE=en ./test.bash\_native.sh"
- launch this command: "LANGUAGE=en ./test.bash\_gettext.sh"

If you wish to modify the test scripts, you will have to launch ./gen\_po.bash\_native.sh or ./gen\_po.bash\_gettext.sh to re-generate the French traduction .mo files.

By slightly modify gen\_po.bash\_native.sh or gen\_po.bash\_gettext.sh (replacing 'fr' with ), you can generate traduction .mo files for other languages.
