#!/usr/bin/env bash

## SETUP ##

# set -ex
pushd ~

## SCRIPT ##

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

export CMD=$(cat <<-END

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

END

)

echo "$CMD" >> ~/.bashrc

## TEARDOWN ##
popd
set +ex
