#!/bin/bash

# ==================================================
# script to connect github using ssh
# only works in new ssh keys
# ==================================================

echo "Enter your username:"
# read username

echo "Enter your email:"
# read email

echo "Hello $username, your e-mail is $email"


# generate new SSH key
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# add a new SSH key to github
### sudo apt-get update
cmd="xclip -h"
if [[  $cmd == 127 ]]; then
	sudo apt-get install xclip	
else
	### xclip -h
fi
xclip -selection clipboard < ~/.ssh/id_ed25519.pub


echo "
	====== ssh id was copied to your clipboard ======
	"
