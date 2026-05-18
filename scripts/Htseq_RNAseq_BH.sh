#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -J Htseq_RNAseq_BH
#SBATCH -o %x.out
#SBATCH -e %x.err

module load HTSeq/2.1.2-gfbf-2024a

BAM="/home/magi1969/Genome_analysis_2026/results/SAM_RNAseq_BH/ERR179797"
OUTPUT="/home/magi1969/Genome_analysis_2026/results/Htseq_RNAseq_BH"
ANOTATION="/home/magi1969/Genome_analysis_2026/results/Prokka/prokka_clean.gff"
PREFIX="ERR179797"

for x in {2..4}; do
htseq-count -f bam -r name -t CDS -i ID ${BAM}${x}_sorted_name.bam ${ANOTATION} > ${OUTPUT}/reads_RNAseq_BH_${PREFIX}${x}.txt
done