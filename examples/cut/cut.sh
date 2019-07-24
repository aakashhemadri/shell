#!/bin/bash
# @author: Aakash Hemadri
# @email: aakashhemadri123@gmail.com
#
# Function definitions
function run_command {
    echo "Executing command: $1"
	#Prints description if it exists
	if [ "${2}" ]; then
		echo "**************"
		echo ${2}
		echo "**************"
	fi
    ${1} |& tee -a "${ERROR}" | tee echo "ERROR ENCOUNTERED CHECK LOG"
#	if [ "${}" ]; then
#		
#	fi
	echo "#######################################"
}
#
# Program Entry
declare -r COMMAND="cut"
declare -r INPUT="data/input"
declare -r OUTPUT="data/output"
declare -r ERROR="data/error.log"
#
echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"
#
{
run_command "${COMMAND} -c4 ${INPUT}/file" "Cuts character at position 4"
run_command "${COMMAND} -c4,6 ${INPUT}/file" "Cuts characters at position 4 & 6"
run_command "${COMMAND} -c4-7 ${INPUT}/file"
run_command "${COMMAND} -c-7 ${INPUT}/file"
run_command "${COMMAND} ${INPUT}/file"
run_command "${COMMAND} ${INPUT}/file"
run_command "${COMMAND} ${INPUT}/file"
} |& tee -a ${ERROR}
#End Program
