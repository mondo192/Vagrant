#!/bin/bash

# Update system and cleanup
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get autoremove && sudo apt-get autoclean

# Install developer tools make gcc etc.
sudo apt-get -y install build-essential

# Generate a public/private keypair from cmd line argument
if [ "$1" ]; then
	echo "Creating public/private keypair"
	ssh-keygen -q -t rsa -b 4096 -N "" <<< ""$'\n'"y" 2>&1 >/dev/null
	eval "$(ssh-agent -s)" 2>&1 >/dev/null 
	ssh-add -q ~/.ssh/id_rsa 2>/dev/null
	
	# Upload the generated ssh public key to github account
	curl \
		-s \
        -X POST \
        -H "Authorization: token $1" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/keys \
        -d '{"title": "Vagrant", "key": "'"$(cat ~/.ssh/id_rsa.pub)"'"}'
fi

