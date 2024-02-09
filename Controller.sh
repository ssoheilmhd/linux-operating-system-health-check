#!/bin/bash
source requirements.sh
Help() {
echo "
1- Ram check
2- CPU check
3- Disk Check
4- Network Check
5- Help
6- Exit
"
}
helpstr="help"
Help
while true; do
    read -p "Enter the option to check health state (or enter help to find manual): " opt_input
    if [[ $opt_input == "1" ]]; then
        bash RAM-checker.sh
    elif [[ $opt_input == "2" ]]; then
        Checker "iostat"
        bash CPU-checker.sh
    elif [[ $opt_input == "3" ]]; then
        bash Disk-checker.sh
    elif [[ $opt_input == "4" ]]; then
        Checker "bmon"
        bash Network-checker.sh
    elif [[ $opt_input == "5" ]] || [[ $opt_input == "h" ]] || [[ ${opt_input,,} = "${helpstr,,}"  ]] ; then
        Help
    elif [[ $opt_input == "6" ]] || [[ $opt_input == "exit" ]]; then
        exit 0
    fi
done
