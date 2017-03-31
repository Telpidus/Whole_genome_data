#!/bin/bash

_novoalign=/Users/telma/Desktop/novoalign #novoalign path

basepath="/Users/telma/Desktop/NID_supernova_TGL" #directory path where the pairs and genome files are 

_genome="${basepath}/NID_supernova.ndx" #genome path

for R1 in $(ls $basepath |grep \.R1\.) #for all the files containing R1 (one per indiv) iterate and do the following 
do
 R2=$(echo ${R1} |sed 's/\.R1\./\.R2\./') #the second file is defined as the same as the one containing R1, except having R2 
 echo ${R2} 
 outfile=$(echo ${R1} |sed 's/\.R1\..*/.sam/') #the outfile should have the same name as infiles (GaXXXX), except for R1/R2
 echo ${R1} # to visualize if he is pulling the right file
 ${_novoalign} -d ${_genome} -f ${basepath}/${R1} ${basepath}/${R2} -F STDFQ -t 540 -g 40 -x 12 -o SAM -o FullNW --3Prime -r N -e 200 -i PE 200,250 > ${basepath}/${outfile}
done

