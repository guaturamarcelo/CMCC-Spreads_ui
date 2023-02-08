#!/bin/ksh

ECF_HOME=$(pwd)
export ECF_HOME=$(echo ${ECF_HOME} | sed 's/\/eclogs//g')

echo -e "\nEnter with the ECF_PORT to stop the server: "
read -r ECF_PORT
export ECF_PORT=${ECF_PORT}
cd ..

ecflow_client --group="halt=yes; check_pt; terminate=yes"