#!/usr/bin/env bash

# generate password
export USERNAME=devops
export PASSWORD=$(python3 -c "import secrets; print(secrets.token_urlsafe(32))")

# Create the user
sudo useradd -m -s /bin/bash "$USERNAME"

# Set the user's password
echo "${USERNAME}:${PASSWORD}" | sudo chpasswd

set -ex

# Update the sudoers config
sudo echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME"
sudo chmod 0440 "/etc/sudoers.d/$USERNAME"

set +ex
