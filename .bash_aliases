alias 'aliases'='nano .bash_aliases'

alias cls='clear'
alias open='xdg-open'
alias h='history'


#### PORT COMUNICATION ###
alias 'pty'='socat -d -d pty,echo=0,raw pty,echo=0,raw'


scrun() {
	# speeds up the creation of scripts by running chmod.
	# just call scrun + file name
	
	file=$1
	script="./\$file"

	# help
	if [[ "$1" == "-h" ]]; then
		echo "speeds up the run of scripts by running chmod. just call scrun + file name"
		return
	fi

	# check if arg is empty
	if [[ $file == "" ]]; then
		echo "Missing the filename"
		return	
	fi

	#copy if there are options
	while [ -n "$1" ]; do
		script="$script $1"
		shift
	done

	# check if file alredy chmod
	in=`ls -l $file`
	if [[ $in == *"-rwxrwxr-x"* ]]; then
		eval $script
	else
		chmod +x $file
		eval $script
	fi
}
