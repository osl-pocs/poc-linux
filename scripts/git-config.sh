#!/usr/bin/env bash
#
# refs:
#   https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#   https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## FUNCTIONS ##

# Function to ask for confirmation
confirm() {
    while true; do
        # Ask the user
        read -r -p "Are you sure you want to continue? [y/n] " response

        # Normalize the response to lower case
        response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

        # Check the response
        case "$response" in
            y|yes) return 0 ;;  # User wants to continue
            n|no) return 1 ;;   # User does not want to continue
            *) echo "Please respond with 'yes' or 'no' (or 'y' or 'n')." ;;
        esac
    done
}

## INPUT ##

echo -n "Please enter your full name (as used on GitHub): "
read GITHUB_USER_FULL_NAME

echo -n "Please enter your email (as used on GitHub): "
read GITHUB_USER_EMAIL

# Output the entered name
echo ""
echo "You entered the github user full name: $GITHUB_USER_FULL_NAME"
echo "You entered the github user email: $GITHUB_USER_EMAIL"
echo ""

# Call the confirm function
if confirm; then
    echo "Proceeding with the operation ..."
else
    echo "Operation aborted."
    exit 1
fi

## SETUP ##

set -ex

## PROCESS ##

git config --global pull.rebase true

echo "Configure the git user and email:"
git config --global user.name "$GITHUB_USER_FULL_NAME"
git config --global user.email "$GITHUB_USER_EMAIL"

echo "Configure a ssh key"
ssh-keygen -t ed25519 -C "$GITHUB_USER_EMAIL"

eval "$(ssh-agent -s)"

## TEARDOWN ##

set +ex

## OUTPUT ##
cat ~/.ssh/id_ed25519.pub
