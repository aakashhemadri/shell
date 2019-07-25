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
    ${1} 
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
declare -r SPACE=" "
#
echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"
#
{
run_command "${COMMAND} -c4 ${INPUT}/file" "Cuts character at position 4."
run_command "${COMMAND} -c4,6 ${INPUT}/file" "Cuts characters at position 4 & 6."
run_command "${COMMAND} -c4-7 ${INPUT}/file" "Cuts characters between the range of 4-7."
run_command "${COMMAND} -c-7 ${INPUT}/file" "Cuts characters until position 7."
run_command "${COMMAND} -c10- ${INPUT}/file" "Cuts character after position 10."
run_command "${COMMAND} --delimiter=: -f2 ${INPUT}/file" "Similar to awk, returns second field\nusing the delimeter option -d."
run_command "${COMMAND} -d: -f1 /etc/passwd" "Retrieves first field of file /etc/passwd"
run_command "rev ${INPUT}/filenames | ${COMMAND} --delimiter=. -f1" "Retieves the extension of the filenames."
} |& tee -a ${ERROR}
#End Program
