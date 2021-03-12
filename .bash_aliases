alias cls='clear'
alias open='xdg-open'
alias h='history'

scrun() {
	# speeds up the creation of scripts by running chmod.
	# just call scrun + file name


	file=$1

	# help
	if [[ "$1" == "-h" ]]; then
		echo "speeds up the creation of scripts by running chmod. just call scrun + file name"
		return
	fi

	# check if arg is empty
	if [[ $file == "" ]]; then
		echo "Missing the filename"
		return	
	fi

	# check if file alredy chmod
	in=`ls -l $file`
	if [[ $in == *"-rwxrwxr-x"* ]]; then
		./$file
	else
		chmod +x $file
		./$file
	fi
}