#!/bin/bash

# Update system and upgrade remove unused dependencies
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get autoremove && sudo apt-get autoclean


# To generate the public/private key pair with no prompts
echo "Creating public/private keypair for $1"
ssh-keygen -q -t rsa -b 4096 -C $1 -N "" <<< ""$'\n'"y" 2>&1 >/dev/null 
eval "$(ssh-agent -s)" 2>&1 >/dev/null 
ssh-add -q ~/.ssh/id_rsa 2>/dev/null
echo "Keypair created and added to ssh agent"