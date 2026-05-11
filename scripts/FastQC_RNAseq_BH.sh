#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:15:00
#SBATCH -J FastQC_RNAseq_BH
#SBATCH -o %x.out
#SBATCH -e %x.err

module load FastQC/0.12.1-Java-17 

fastqc /home/magi1969/Genome_analysis_2026/raw_data/transcriptomics_data/RNA-Seq_BH/raw/*.gz* \
    -o /home/magi1969/Genome_analysis_2026/results/FastQC_RNA_seq_BH