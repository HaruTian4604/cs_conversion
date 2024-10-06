#! /usr/bin/env bash

set -euo pipefail

if [ ! -f"$1.c" ]; then
	echo "File $1.c does not exist"
	exit 1
fi

gcc -Wall -std=c11 "$1.c" -o "$1"
