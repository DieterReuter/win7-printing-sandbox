#!/bin/bash 
basebox=./template/dieter-win7x64sp1
flavour=virtualbox

echo "Building basebox: ${basebox} for ${flavour}"

# use of local or global PACKER_CACHE_DIR to store the downloaded .ISO files
if [ "${PACKER_CACHE_DIR}x" == "x" ]; then
  export PACKER_CACHE_DIR="`pwd`/packer_cache"
fi
echo "...using PACKER_CACHE_DIR = $PACKER_CACHE_DIR"

# now run the Packer build
mkdir -p ${flavour}
(cd ${basebox}; packer build -only=${flavour}-iso template.json)
