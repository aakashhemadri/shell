#!/usr/bin/bash
# @author Aakash Hemadri
# @email aakashhemadri123@gmail.com
#
# A menu driven shell script to perform various myriad tasks.
## ----------------------------------------------------------------
# Variables
## ----------------------------------------------------------------

declare -r EDITOR=vim
declare -r RED='\\033[0;41;30m'
declare -r STD='\\033[0;0;39m'

## ----------------------------------------------------------------
# Functions
## ----------------------------------------------------------------

function show_menu {
  clear
	cat <<- _EOF_
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|                   M A I N - M E N U                   |
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|    Welcome! You may perform one of the tasks below!   |
	---------------------------------------------------------
	1] Truncate file based on character limit.
	2] List only files starting with 't'.
	3] Print filename and size of two smallest files.
	4] 
	5]
	6]
	7]
	8]
	9]
	10] Exit.
	_EOF_
}

function read_option {
  local CHOICE
  read -p "Enter choice [1 - 10]: " CHOICE
	case ${CHOICE} in
		1) truncate_file ;;
		2) list_files ;;
		3) smallest_files ;;
		4) ;;
		5) ;;
		6) ;;
		7) ;;
		8) ;;
		9) ;;
		10) exit_program ;;
		*) clear; read -p "Bad option! Press [Enter] to try again..." stubKey
	esac
}

function pause {
  read -p "Press [Enter] key to continue..." stubKey
}

function exit_program {
  clear
  local CHOICE
  read -p "Are you sure that you'd like to quit? [y/N]: " CHOICE
  if [ $CHOICE == 'y' ]; then
    clear
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "                  Have a great day!!                     "
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "Exiting...";
    exit 0;
  else
    show_menu
  fi
}

function truncate_file {
  clear
  cat <<- _EOF_
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|                     TRUNCATE FILE                     |
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|    Welcome! You may perform one of the tasks below!   |
	---------------------------------------------------------
	_EOF_
  pause
}

function list_files {
	clear
  cat <<- _EOF_
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|                      LIST FILES                       |
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|           List only files starting with 't'           |
	---------------------------------------------------------
	_EOF_
	ls -al | grep "^[^d]"
  pause
}

function smallest_files {
	clear
	  cat <<- _EOF_
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|                    SMALLEST FILES                     |
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|    Print filename and size of two smallest files.     |
	---------------------------------------------------------
	_EOF_
	pause
}
## ----------------------------------------------------------------
#   Traps
## ----------------------------------------------------------------
trap exit_program SIGINT SIGTERM

## ----------------------------------------------------------------
# Main Loop
## ----------------------------------------------------------------

while true 
do
show_menu
read_option
done