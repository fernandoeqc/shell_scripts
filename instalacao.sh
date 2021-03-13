#!/bin/bash
log(){
	ret=`echo $?`
	if [[ $ret == 0 ]]; then
		echo "$cmd" >> install_sucess
	else
		echo "$cmd" >> install_fail
	fi
}

touch 

echo "### Instalação gcc ###"
cmd="apt-get install -y build-essential"
sudo apt-get install -y build-essential
log

echo "### Instalação Minicom ###"
cmd="apt install -y minicom"
sudo apt install -y minicom
log

echo "### Instalação Minicom ###"
cmd="apt install -y git-all"
sudo apt install -y git-all
log