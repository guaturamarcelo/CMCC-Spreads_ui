#!/bin/ksh

echo -e "\n1) Replace path "
echo "2) List servers running"
echo "3) Starting Server"
echo "4) Stop Server"
echo "5) List experiments available"
echo -e "6) Exit\n"

if [[ $@ -eq "" ]];
then

    while true
    do
        case $opt in
            1|2|3|4)
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
        old_path='/work/csp/mg20022/github/CMCC-Suite'
        new_path=$(pwd)
        grep -RiIl ${old_path} | xargs sed -i "s@$old_path@$new_path@g" 
        grep -RiIl "/work/csp/mg20022/github/CMCC-Suite" | xargs sed -i "s@"/work/csp/mg20022/github/CMCC-Suite"@$old_path@g" 

        echo -e "\nClone Spreads_ui finished.\n" ;;
    2)
        echo -e "\nServers running on Zeus:"
        echo -e "\nUsername, Start date, port"
        ps -ef | grep ecflow_server | grep 'port=' | awk '{print $1, $5, $9}' ;;


    3)
        ./eclogs/start.ksh ;;

    4)
        ./eclogs/stop.ksh ;;
    5)
        ls experiments/*.def | sed 's/experiments\///g' | sed 's/.def//g'

        exit ;;
    

    6)

        echo "Goodbye ${USER}."
        exit ;;
esac
