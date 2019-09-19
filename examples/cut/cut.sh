#!/bin/bash
# @author: Aakash Hemadri
# @email: aakashhemadri123@gmail.com
#
# Example cut commands
## --------------------------------------------------------
# Function definitions
## --------------------------------------------------------

function run_command {
    echo "Executing command: $1"

	## ----------------------------- ##
	# Prints description if it exists #
	## ----------------------------- ##
	if [ "${2}" ]; then
		echo "**************"
		echo -e "Description: ${2}"
		echo "**************"
	fi
    ${1} 2> ${ERROR}
	echo "#######################################"
}

## --------------------------------------------------------
# Constants & Variables
## --------------------------------------------------------

declare -r COMMAND="cut"
declare -r INPUT="data/input"
declare -r OUTPUT="data/output"
declare -r ERROR="data/error.log"
declare -r SPACE=" "

## --------------------------------------------------------
# Exports
## --------------------------------------------------------

export PAGER='/usr/bin/less'

## --------------------------------------------------------
# Program
## --------------------------------------------------------

echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"

## -------- ##
# Clean Logs #
## -------- ##
rm "data/error.log"

{
run_command "${COMMAND} -c4 ${INPUT}/file" "Cuts character at position 4."
run_command "${COMMAND} -c4,6 ${INPUT}/file" "Cuts characters at position 4 & 6."
run_command "${COMMAND} -c4-7 ${INPUT}/file" "Cuts characters between the range of 4-7."
run_command "${COMMAND} -c-7 ${INPUT}/file" "Cuts characters until position 7."
run_command "${COMMAND} -c10- ${INPUT}/file" "Cuts character after position 10."
run_command "${COMMAND} --delimiter=: -f2 ${INPUT}/file" "Similar to awk, returns second field\nusing the delimeter option -d."
run_command "${COMMAND} -d: -f1 /etc/passwd" "Retrieves first field of file /etc/passwd"
run_command "${COMMAND} --delimiter=. -f2 ${INPUT}/filenames" "Retieves the extension of the filenames."
run_command "${COMMAND} -f 1-2,4- ${INPUT}/data.txt" "Returns range of fields"
run_command "${COMMAND} -c 3-12 $INPUT/data.txt" "Cuts specific number of characters"
} | tee "${OUTPUT}/output" 
echo -e "Output logged at ${OUTPUT}/output"
if [ -s ${ERROR} ]; then
	echo "Check error log at ${ERROR}"
fi

## --------------------------------------------------------
# End Program
## --------------------------------------------------------
