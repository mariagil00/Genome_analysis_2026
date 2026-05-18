#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -J Htseq_RNAseq_Serum
#SBATCH -o %x.out
#SBATCH -e %x.err

module load HTSeq/2.1.2-gfbf-2024a

BAM="/home/magi1969/Genome_analysis_2026/results/SAM_RNAseq_Serum/ERR17979"
OUTPUT="/home/magi1969/Genome_analysis_2026/results/Htseq_RNAseq_Serum"
ANOTATION="/home/magi1969/Genome_analysis_2026/results/Prokka/prokka_clean.gff"
PREFIX="ERR17979"

for x in {69..71}; do
htseq-count -f bam -r name -t CDS -i ID ${BAM}${x}_sorted_name.bam ${ANOTATION} > ${OUTPUT}/reads_RNAseq_Serum_${PREFIX}${x}.txt
done