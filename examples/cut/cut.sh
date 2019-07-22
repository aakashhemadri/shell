#!/bin/bash
# @author: Aakash Hemadri
# @email: aakashhemadri123@gmail.com
#
# Function definitions
function run_command {
    echo "Executing command: $1"
    ${1}
}
#
# Program Entry
declare -r COMMAND="cut"
echo -e "Hello!\nThis is the set of commands that are related to ${COMMAND}!"
#
run_command "${COMMAND}"
# End Program