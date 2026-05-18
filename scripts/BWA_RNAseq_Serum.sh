#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -J BWA_RNAseq_Serum
#SBATCH -o %x.out
#SBATCH -e %x.err

module load BWA/0.7.19-GCCcore-13.3.0

REFERENCE="/home/magi1969/Genome_analysis_2026/results/Canu/e.faecium.contigs.fasta"
READS="/home/magi1969/Genome_analysis_2026/raw_data/transcriptomics_data/RNA-Seq_Serum/trimmed/trim_paired_ERR17979" 

bwa index $REFERENCE 
for x in {69..71}; do
bwa mem $REFERENCE $READS${x}_pass_1.fastq.gz $READS${x}_pass_2.fastq.gz > ERR17979${x}.sam

done