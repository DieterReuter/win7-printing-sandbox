#!/bin/bash 
basebox=./template/dieter-win7x64sp1
flavour=virtualbox

echo "Building basebox: ${basebox} for ${flavour}"
mkdir -p ${flavour}
(cd ${basebox}; packer build -only=${flavour}-iso template.json)
