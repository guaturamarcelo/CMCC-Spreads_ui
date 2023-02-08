#!/bin/ksh

echo -e "\n1) List servers running"
echo "2) Replace path "
echo "3) Clone suite experiments"
echo -e "4) Exit\n"

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


case ${opt} in

    1)
        echo -e "\nServers running on Zeus:"
        echo -e "\nUsername, Start date, port"
        ps -ef | grep ecflow_server | grep 'port=' | awk '{print $1, $5, $9}' ;;

    2)
    #     # CLONE SPREADS UI SUITE
    #     echo -e "\nStarting to clone spreads_ui..."
    #     HOMECLONE='/work/csp/mg20022/github/CMCC-Suite'
    #     rsync -azh --info=progress2 --exclude 'd4osystem*' --human-readable --exclude 'clone' --exclude 'login1.*' --exclude 'cookbook' --exclude 'TMPD4OSYSTEM*' --exclude '*.job*' ${HOMECLONE}/ .

        echo -e "\nReplacing information to the new path...\n"    
        old_path='/work/csp/mg20022/github/CMCC-Suite'
        new_path=$(pwd)
        grep -RiIl ${old_path} | xargs sed -i "s@$old_path@$new_path@g" 
        grep -RiIl "/work/csp/mg20022/github/CMCC-Suite" | xargs sed -i "s@"/work/csp/mg20022/github/CMCC-Suite"@$old_path@g" 

        echo -e "\nClone Spreads_ui finished.\n" ;;
    
    4)

        echo "Goodbye ${USER}."
        exit ;;
esac