# ==================================================
# script to connect github using ssh
# only works in new ssh keys
# ==================================================


# generate new SSH key
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# add a new SSH key to github
### sudo apt-get update

sudo apt-get install xclip	
xclip -selection clipboard < ~/.ssh/id_ed25519.pub


echo "====== ssh id was copied to your clipboard ======"
