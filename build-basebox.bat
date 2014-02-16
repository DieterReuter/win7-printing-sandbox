@echo off
setlocal

set pwd=%~dp0
set basebox=./template/windows
set flavour=virtualbox
set template=windows7x64sp1

echo "Building basebox: %basebox% for %flavour%"

rem use of local or global PACKER_CACHE_DIR to store the downloaded .ISO files
if "%PACKER_CACHE_DIR%x" == "x" set "PACKER_CACHE_DIR=%pwd%packer_cache"
echo "...using PACKER_CACHE_DIR = %PACKER_CACHE_DIR%"

rem let's get a packer build log
if not exist %pwd%log mkdir %pwd%log
set PACKER_LOG=1
set PACKER_LOG_PATH=%pwd%log\%template%.log
echo "...using PACKER_LOG = %PACKER_LOG%"
echo "...using PACKER_LOG_PATH = %PACKER_LOG_PATH%"

rem now run the Packer build
if not exist %pwd%%flavour% mkdir %pwd%%flavour%
cd /D %basebox%
packer build -only=%flavour%-iso %template%.json

rem jump back
cd /D %pwd%