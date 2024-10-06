#! /usr/bin/env bash

set -euo pipefail

cat file.txt | grep "Hello" | sort
