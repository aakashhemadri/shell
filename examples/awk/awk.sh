#!/bin/bash
# @author: Aakash Hemadri
# @email: aakashhemadri123@gmail.com
#
# Example awk commands
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

declare -r COMMAND="awk"
declare -r INPUT="data/input"
declare -r OUTPUT="data/output"
declare -r SCRIPT="data/awk_scripts"
declare -r ERROR="data/error.log"
declare -r SPACE=" "

## --------------------------------------------------------
# Exports
## --------------------------------------------------------
export PAGER='/usr/bin/less'

## ------------------------------------ ##
# Clean Logs & Build directory structure #
## ------------------------------------ ##
mkdir -p data/input
mkdir -p data/output
rm "data/error.log"

## --------------------------------------------------------
# Program
## --------------------------------------------------------

echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"
{
run_command "${COMMAND} --help" ""
} | tee "${OUTPUT}/output" 
echo -e "Output logged at ${OUTPUT}/output"
if [ -s ${ERROR} ]; then
	echo "Check error log at ${ERROR}"
fi

## --------------------------------------------------------
# End Program
## --------------------------------------------------------