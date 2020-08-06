#!/bin/bash

# Update system and cleanup
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get autoremove && sudo apt-get autoclean

# Generate a public/private keypair from cmd line arguement
if [ "$1" ]; then
	echo "Creating public/private keypair for $1"
	ssh-keygen -q -t rsa -b 4096 -C $1 -N "" <<< ""$'\n'"y" 2>&1 >/dev/null
	eval "$(ssh-agent -s)" 2>&1 >/dev/null 
	ssh-add -q ~/.ssh/id_rsa 2>/dev/null
	
	# Output the public key to terminal if it exists
	if [ "~/.ssh/id_rsa.pub" ]; then
		cat ~/.ssh/id_rsa.pub
	fi
fi

