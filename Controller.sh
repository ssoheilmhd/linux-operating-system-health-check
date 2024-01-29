#!/bin/bash
bash requirements.sh
Help() {
echo "
1- Ram check
2- CPU check
3- Disk Check
4- Network Check
5- All components
6- Help
7- Exit
"
}
helpstr="help"
Help
while true; do
    read -p "Enter the option to check health state (or enter help to find manual): " opt_input
    if [[ $opt_input == "1" ]]; then
        bash ram-checker.sh
    elif [[ $opt_input == "2" ]]; then
        bash CPU-checker.sh
    elif [[ $opt_input == "3" ]]; then
        echo "use Disk func"
    elif [[ $opt_input == "4" ]]; then
        echo "use Network func"
    elif [[ $opt_input == "5" ]]; then
        echo "use all of Ram,CPU,Disk,Network func"
    
    elif [[ $opt_input == "6" ]] || [[ $opt_input == "h" ]] || [[ ${opt_input,,} = "${helpstr,,}"  ]] ; then
        Help
    elif [[ $opt_input == "7" ]] || [[ $opt_input == "exit" ]]; then
        exit 0
    fi
done
