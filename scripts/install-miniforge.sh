#!/usr/bin/env bash

set -ex

mkdir -p ~/downloads
pushd ~/downloads

export TARGET_DIR=/opt/miniforge3
export FILENAME=Miniforge3-$(uname)-$(uname -m).sh

sudo mkdir -p "${TARGET_DIR}"
sudo chown xmn:xmn "${TARGET_DIR}"

rm -f ${FILENAME}
wget -c "https://github.com/conda-forge/miniforge/releases/latest/download/${FILENAME}"
bash ${FILENAME} -b -f -p "${TARGET_DIR}"

source "${TARGET_DIR}/etc/profile.d/conda.sh"
source "${TARGET_DIR}/etc/profile.d/mamba.sh"

conda init

set +ex

source ~/.bashrc

popd
