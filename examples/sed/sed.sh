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
		echo -e "Description: ${2}"
		echo "**************"
	fi
    ${1} 2> ${ERROR}
	echo "#######################################"
}
#
# Program Entry
declare -r COMMAND="sed"
declare -r INPUT="data/input"
declare -r OUTPUT="data/output"
declare -r ERROR="data/error.log"
declare -r SPACE=" "
# Exports
export PAGER='/usr/bin/less'
#
# Begin program:
echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"
# Clean
rm "data/error.log"
#
{
run_command "${COMMAND} --help" ""
} | tee "${OUTPUT}/output" 
echo -e "Output logged at ${OUTPUT}/output"
if [ -s ${ERROR} ]; then
	echo "Check error log at ${ERROR}"
fi

#End Program
