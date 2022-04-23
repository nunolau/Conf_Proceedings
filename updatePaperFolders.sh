#!/bin/bash

## create a temporary directory (stackoverflow 4632028)
# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d -p "$DIR"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

## temporary directory created and trap to cleanup established

cd $WORK_DIR
for z in ../../papers/*.zip
do
    echo unzipping $z
    unzip $z > /dev/null
done

for i in $(ls) 
do 
    # get paper number in form 0NN, this will be the paper folder name
    f=${i##*_} 
    f=$(printf "%03d" ${f%%.*}) 

    #move paper
    echo updating $i to $f
    mv    $i ../$f 

done
