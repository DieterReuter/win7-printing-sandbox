#!/bin/bash 
basebox=./template/windows
flavour=virtualbox
template=windows7x64sp1

echo "Building basebox: ${basebox} for ${flavour}"

# use of local or global PACKER_CACHE_DIR to store the downloaded .ISO files
if [ "${PACKER_CACHE_DIR}x" == "x" ]; then
  export PACKER_CACHE_DIR="`pwd`/packer_cache"
fi
echo "...using PACKER_CACHE_DIR = $PACKER_CACHE_DIR"

# let's get a packer build log
mkdir -p ./log
export PACKER_LOG=1
export PACKER_LOG_PATH=`pwd`/log/${template}.log
echo "...using PACKER_LOG = $PACKER_LOG"
echo "...using PACKER_LOG_PATH = $PACKER_LOG_PATH"

# now run the Packer build
mkdir -p ${flavour}
(cd ${basebox}; packer build -only=${flavour}-iso ${template}.json)
