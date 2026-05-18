#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J BWA_SAMBAM_Illumina.sh
#SBATCH -o %x.out
#SBATCH -e %x.err

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

REFERENCE="/home/magi1969/Genome_analysis_2026/results/Canu/e.faecium.contigs.fasta"
READS="/home/magi1969/Genome_analysis_2026/results/Trimmomatic_Illumina/E745-1.L500_SZAXPI015146-56_trimmed" 

bwa index $REFERENCE 
bwa mem $REFERENCE ${READS}_1_paired.fq.gz ${READS}_2_paired.fq.gz > E745-1.L500_SZAXPI015146-56_trimmed.sam

samtools view -bS E745-1.L500_SZAXPI015146-56_trimmed.sam > E745-1.L500_SZAXPI015146-56_trimmed.bam
samtools sort E745-1.L500_SZAXPI015146-56_trimmed.bam -o /home/magi1969/Genome_analysis_2026/results/BWA_SAM_Illumina/E745-1.L500_SZAXPI015146-56_trimmed_sorted.bam
samtools index /home/magi1969/Genome_analysis_2026/results/BWA_SAM_Illumina/E745-1.L500_SZAXPI015146-56_trimmed_sorted.bam

