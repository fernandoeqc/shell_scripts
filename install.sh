#!/bin/bash
#fernando carneiro

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

source programs.sh

log_install="$parent_path/success_install"
log_fail="$parent_path/fail_install"

rm $log_install
touch $log_install
rm $log_fail
touch $log_fail

#sudo apt update
sudo cp .bash_aliases /$USER
cd ~
source .bash_aliases 


#programs.sh
run_programs


#printa resultados e falhas
echo "

"
cd $parent_path
echo "######## SUCESS ########"
cat $log_install
echo "

"
echo "######## FAIL ########"
cat $log_fail



	
