#!/bin/ksh

echo -e "\n1) Replace path "
echo "2) List servers running"
echo "3) Starting Server"
echo "4) Stop Server"
echo "5) Load spreads_ui"
echo "6) List experiments available"
echo -e "7) Exit\n"

if [[ $@ -eq "" ]];
then

    while true
    do
        case $opt in
            1|2|3|4|5|6)
                break ;;
            *)
                printf "Plase select between: [1|2|3|4] : "
                read -r opt ;;
        esac
    done

else

    opt=$1
fi
case ${opt} in

    1)
        echo -e "\nReplacing information to the new path...\n"    
        old_path='/work/csp/mg20022/github/CMCC-Spreads_ui'
        new_path=$(pwd)
        grep -RiIl ${old_path} | xargs sed -i "s@$old_path@$new_path@g" 
        # grep -RiIl "/work/csp/mg20022/github/CMCC-Spreads_ui/new_d4o" | xargs sed -i "s@"/work/csp/mg20022/github/CMCC-Spreads_ui/new_d4o"@$old_path@g" 

        echo -e "\nClone Spreads_ui finished.\n" ;;
    2)
        echo -e "\nServers running on Zeus:"
        echo -e "\nUsername, Start date, port"
        ps -ef | grep ecflow_server | grep 'port=' | awk '{print $1, $5, $9}' ;;


    3)
        ./eclogs/start.ksh ;;

    4)
        ./eclogs/stop.ksh ;;

    5)  ecflow_client --load=spreads_ui.def
        ecflow_client --begin=spreads_ui ;;
    6)
        ls experiments/*.def | sed 's/experiments\///g' | sed 's/.def//g'

        exit ;;
    

    7)

        echo "Goodbye ${USER}."
        exit ;;
esac
