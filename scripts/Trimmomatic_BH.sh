#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 06:00:00
#SBATCH -J Trimmomatic_RNAseq_BH
#SBATCH -o %x.out
#SBATCH -e %x.err

module load Trimmomatic/0.39-Java-17

#input file
INPUT_FILE=/home/magi1969/Genome_analysis_2026/raw_data/transcriptomics_data/RNA-Seq_BH/raw
#output file
OUTPUT_FILE=/home/magi1969/Genome_analysis_2026/results/Trimmomatic_BH

#Paired end
for x in {2..4}; do
    name_file="ERR179797${x}"
    java -jar /sw/arch/eb/software/Trimmomatic/0.39-Java-17/trimmomatic-0.39.jar \
    PE \
    ${INPUT_FILE}/${name_file}_1.fastq.gz \
    ${INPUT_FILE}/${name_file}_2.fastq.gz \
    ${OUTPUT_FILE}/${name_file}_trimmed_1_paired.fq.gz \
    ${OUTPUT_FILE}/${name_file}_trimmed_1_unpaired.fq.gz \
    ${OUTPUT_FILE}/${name_file}_trimmed_2_paired.fq.gz \
    ${OUTPUT_FILE}/${name_file}_trimmed_2_unpaired.fq.gz \
    ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 \
    TRAILING:3 \
    SLIDINGWINDOW:4:15 \
    MINLEN:36
done

#PE --> paired end reads
#ILUMINACLIP:path to adapters fasta files --> cut adapter and other Ilumina-specific sequences from the read 
#LEADING:3 --> remove leading low quality or N bases --> below quality 3
#TRAILING:3 --> remove trailing low quality or N bases --> below quality 3
#SLIDINGWINDOW:a:b --> scan the read with a a-base wide sliding window, cutting when the average quality per base drops below b
#MINLEN: drop reads which are less than 36 bases long after these steps
