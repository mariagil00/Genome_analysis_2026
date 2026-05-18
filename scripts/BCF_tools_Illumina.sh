#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:01:00
#SBATCH -J BCF_tools_Illumina
#SBATCH -o %x.out
#SBATCH -e %x.err

module load BCFtools/1.22.1-GCC-13.3.0

REFERENCE="/home/magi1969/Genome_analysis_2026/results/Canu/e.faecium.contigs.fasta"
BAM="/home/magi1969/Genome_analysis_2026/results/BWA_SAM_Illumina/E745-1.L500_SZAXPI015146-56_trimmed_sorted.bam"
PREFIX="E745-1.L500_SZAXPI015146-56"
OUTPUT_PATH="/home/magi1969/Genome_analysis_2026/results/BCF_tools_Illumina/"

bcftools mpileup -f ${REFERENCE} ${BAM} | \
bcftools call -mv -Ob -o ${OUTPUT_PATH}${PREFIX}.bcf

bcftools view ${OUTPUT_PATH}${PREFIX}.bcf -o ${OUTPUT_PATH}${PREFIX}.vcf