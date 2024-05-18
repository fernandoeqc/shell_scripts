
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
		$verify 1>/dev/null 2>&1
		last_cmd=`echo $?`
		### echo $last_cmd
		verify=0

		if [[ $last_cmd == 127 ]]; then
			run_install=1
		else
			echo "$cmd already install" >> $log_install
		fi
	fi

	if [[ $run_install == 1 ]]; then
		echo $cmd
		sudo $cmd
		log
		run_install=0
	fi

	#clear

}

brave(){
	echo "
	sudo apt install apt-transport-https curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser
	"
}

run_programs(){
	echo "### Instalação gedit ###"
	cmd="sudo apt  install -y gedit"
	verify="gedit --help"
	run

	echo "### Instalação gcc ###"
	cmd="apt-get install -y build-essential"
	verify="gcc --help"
	run

	echo "### Instalação Minicom ###"
	cmd="apt install -y minicom"
	verify="minicom --help"
	run

	echo "### Instalação Git ###"
	cmd="apt install -y git-all"
	verify="git --help"
	run

	# must install from .deb 
	# echo "### Instalação VS Code ###"
	# cmd="snap install --classic code "
	# verify="code --help"
	# run

	echo "### Instalação Brave ###"
	cmd=brave
	verify="brave"
	run

	echo "### install tmux###"
	cmd="sudo apt  install -y tmux"
	verify="tmux --help"
	run

	echo "### install hexedit###"
	cmd="sudo apt install -y hexedit"
	verify="hexedit --help"
	run

	echo "### install nmap###"
	cmd="sudo apt  install -y nmap"
	verify="nmap --help"
	run

	echo "### install socat###"
	cmd="sudo apt install socat -y"
	verify="socat --help"
	run

	echo "### install net-tools###"
	cmd="sudo apt install net-tools -y"
	verify="ifconfig -h"
	run

	echo "### install filelight###"
	cmd="sudo apt install filelight -y"
	verify="filelight -h"
	run

	echo "### install sublime ###"
	cmd="sudo snap install --classic sublime-text"
	verify="subl -h"
	run
	
	echo "### install cmake ###"
	cmd="sudo apt  install cmake"
	verify="cmake --version"
	run
}
