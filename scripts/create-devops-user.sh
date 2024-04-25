#!/usr/bin/env bash

# generate password
export USERNAME=devops
export PASSWORD=$(python -c "import secrets; print(secrets.token_urlsafe(32))")

# Create the user
sudo useradd -m -s /bin/bash "$USERNAME"

# Set the user's password
echo "${USERNAME}:${PASSWORD}" | sudo chpasswd

# Update the sudoers config
sudo echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME"
sudo chmod 0440 "/etc/sudoers.d/$USERNAME"
