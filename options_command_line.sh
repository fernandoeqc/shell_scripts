#!/bin/bash
#using options on script


while [ -n "$1" ]; do
	echo $1
	case "$1" in
		-a) echo "Opcao a";;
		-b) echo "Opcao b";;
		-c) echo "Opcao c";;
		-*) echo "Opcao incorreta";;
	esac
	shift
done
