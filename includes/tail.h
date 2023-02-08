echo ""
echo "----- END TASK ---"
echo ""
ecflow_client --label=Info "OK... %ECF_DATE%  %ECF_TIME%"
wait                      # wait for background process to stop
ecflow_client --complete  # Notify ecFlow of a normal end
trap 0                    # Remove all traps
exit 0  
