
log(){
	last_cmd=`echo $?`
	if [[ $last_cmd == 0 ]]; then
		echo "$cmd" >> $log_install
	else
		echo "$cmd" >> $log_fail
	fi
}

run(){	
	#verifica se o programa ja esta instalado
	if [[ $verify != 0 ]]; then
		$verify 1>/dev/null 
		last_cmd=`echo $?`
		verify=0
	
		if [[ $last_cmd != 0 ]]; then
			install=1
		else
			echo "$cmd already install" >> $log_install	
		fi
	fi
	
	if [[ install == 1 ]]; then
		echo "vai instalar..............................."
		#sudo $cmd
		#log
	fi
	#clear

}

brave(){
	sudo apt install apt-transport-https curl

	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

	sudo apt update

	sudo apt install brave-browser
}

run_programs(){
	echo "### Instalação gedit ###"
	cmd="sudo apt  install gedit"
	verify="gedit --help"
	run

	echo "### Instalação gcc ###"
	cmd="apt-get install -y build-essential"
	verify="gcc --help"
	run

	echo "### Instalação Minicom ###"
	cmd="apt install -y minicom"
	verify="minicom -v"
	run

	echo "### Instalação Git ###"
	cmd="apt install -y git-all"
	verify="git --help"
	run

	echo "### Instalação VS Code ###"
	cmd="snap install --classic code"
	verify="code -v --user-data-dir"
	run


	echo "### Instalação Brave ###"
	#brave
	#log
}
