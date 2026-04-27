#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J Canu
#SBATCH -o %x.out
#SBATCH -e %x.err

module load canu/2.3-GCCcore-13.3.0-Java-17 
module load SAMtools/1.22.1-GCC-13.3.0
canu -p e.faecium -d /home/magi1969/Genome_analysis_2026/results genomeSize=3.2m useGrid=false -raw -pacbio /home/magi1969/Genome_analysis_2026/raw_data/genomics_data/PacBio/*.gz
