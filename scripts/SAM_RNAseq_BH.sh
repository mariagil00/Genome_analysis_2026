#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J SAM_RNAseq_BH.sh
#SBATCH -o %x.out
#SBATCH -e %x.err

module load SAMtools/1.22.1-GCC-13.3.0

SAM="/home/magi1969/Genome_analysis_2026/results/BWA_RNA_seq_BH/ERR179797" 
OUTDIR="/home/magi1969/Genome_analysis_2026/results/SAM_RNAseq_BH"
PREFIX="ERR179797"

for x in {2..4}; do
samtools view -bS ${SAM}${x}.sam > ${OUTDIR}/${PREFIX}${x}.bam
samtools sort ${OUTDIR}/${PREFIX}${x}.bam -o ${OUTDIR}/${PREFIX}${x}_sorted.bam
samtools index ${OUTDIR}/${PREFIX}${x}_sorted.bam
samtools sort -n ${OUTDIR}/${PREFIX}${x}.bam -o ${OUTDIR}/${PREFIX}${x}_sorted_name.bam
done 
