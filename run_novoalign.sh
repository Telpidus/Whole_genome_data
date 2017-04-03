#!/bin/bash
# Copyright 2017 Telma G. Laurentino (Telpidus) <telma.laurentino@gmail.com> co-author Francisco Pina-Martins(StuntsPT)
# this script allows you to run novoalign in batch, instead of runing your alignments manually one individual at a time. 
# Usage: bash run_novoalign.sh
# You should have received a copy of the GNU General Public License V3
# along with run_novoalign.sh If not, see <http://www.gnu.org/licenses/>.

_novoalign=/Users/telpidus/Desktop/novoalign #novoalign path

basepath="/Users/telpidus/Desktop/data_folder" #directory path where the pairs and genome files are 

_genome="${basepath}/genome.ndx" #genome path

for R1 in $(ls $basepath |grep \.R1\.) #for all the files containing R1 (one per indiv) iterate and do the following 
do
 R2=$(echo ${R1} |sed 's/\.R1\./\.R2\./') #the second file is defined as the same as the one containing R1, except having R2 
 echo ${R2} 
 outfile=$(echo ${R1} |sed 's/\.R1\..*/.sam/') #the outfile should have the same name as infiles (GaXXXX), except for R1/R2
 echo ${R1} # to visualize if he is pulling the right file
 ${_novoalign} -d ${_genome} -f ${basepath}/${R1} ${basepath}/${R2} -F STDFQ -t 540 -g 40 -x 12 -o SAM -o FullNW --3Prime -r N -e 200 -i PE 200,250 > ${basepath}/${outfile}
done

