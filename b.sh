#! /usr/bin/env bash

set -euo pipefail

#check parametert
if [[ $# -lt 2 ]]; then
	echo "Usage: $0 <command> <filename>"
	exit 1
fi

command=$1
filename="$2"

#check and edit filename
if [[ "$filename" == *.c ]]; then
	file_to_compile="$filename"
else
	file_to_compile="$filename.c"
fi

if [[ "$command" == "compile" ]]; then
	#check file exit
	if [ ! -f "$file_to_compile" ]; then
		echo "File "$file_to_compile" does not exist"
		exit 1
	fi
	#compile file
	gcc -Wall -std=c11 "$file_to_compile" -o "${file_to_compile%.c}"

elif [[ "$command" == "run" ]]; then
	#run excutable file
	if [ -f "./${file_to_compile%.c}" ]; then
		./"${file_to_compile%.c}"
	else
		echo "Executable ${file_to_compile%.c}" does not exist
		exit 1;
	fi
elif [[ "$command" == "build" ]]; then
	#compile file then excute the excutable file
	if [ ! -f "$file_to_compile" ]; then
		echo "File $file_to_compile does not exist"
		exit 1
	fi
	gcc -Wall -std=c11 "$file_to_compile" -o "${file_to_compile%.c}"
	./"${file_to_compile%.c}"
else
	echo "Invalid command. Use 'compile', 'run', or ''build'."
	exit 1
fi


