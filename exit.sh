#!/bin/bash



ret=`echo $?`
if [[ $ret == 0 ]]; then
	echo "ret $cmd" > txt
else
	echo "erro no cmd anterior"
fi

