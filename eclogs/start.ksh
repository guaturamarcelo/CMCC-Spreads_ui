#!/bin/ksh

ECF_HOME=$(pwd)
export ECF_HOME=$(echo ${ECF_HOME} | sed 's/\/eclogs//g')

echo -e "\nEnter with the ECF_PORT to start the server: "
read -r ECF_PORT
export ECF_PORT=${ECF_PORT}
export ECF_PORT=${ECF_PORT}
export ECF_SCRIPT=${ECF_HOME}

PID=$(ps -ef | grep ecflow_server | grep "port=${ECF_PORT}")
if [ ${#PID} -eq 0 ];then
    ecflow_server --port=${ECF_PORT} &
    echo -e "\n Server started with successful on port ${ECF_PORT}"

    echo -e "\n Export this enveriment before use ecflow_cliente:"
    echo -e "export ECF_PORT=${ECF_PORT}"
    # ecflow_client --delete yes /spreads_ui
    # ecflow_client --load=spreads_ui.def force
    # ecflow_client --begin=spreads_uis
    # ecflow_client --restart
else
    echo -e "\nERROR!!! This ECF_PORT have been used on Zeus:"
    echo "Username, Date, Port"
    ps -ef | grep ecflow_server | grep 'port=' | awk '{print $1, $5, $9}'
fi