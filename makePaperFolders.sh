#!/bin/bash

for i in $(ls paper_*.pdf) 
do 
   # get paper number in form 0NN
   f=${i##*_} 
   f=$(printf "%03d" ${f%%.*}) 

   #make paper folder
   mkdir $f 

   #move paper
   mv    $i $f 

done
