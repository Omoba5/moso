#!/usr/bin/env bash

# any future command that fails will exit the script
set -e

# Lets write the public key of our instance
eval $(ssh-agent -s)
chmod 400 $SSH_KEY
echo "$SSH_KEY" | tr -d '\r' | xargs ssh-add

# disable the host key checking.
mkdir -p ~/.ssh
touch ~/.ssh/config
chmod -R 400 ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config

echo "deploying to $IPADDRESS"
ssh $USER@$IPADDRESS 'bash' < ./deployscript.sh
