#!/bin/bash

for f in ???/paper_*.pdf
do
    npages=$(pdfinfo $f | grep Pages | awk '{print $2}')
    echo $f $npages
done


