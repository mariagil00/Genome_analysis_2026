#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 04:00:00
#SBATCH -J EggNOGmapper
#SBATCH -o %x.out
#SBATCH -e %x.err

module load eggnog-mapper/2.1.13-gfbf-2024a

export EGGNOG_DATA_DIR=/sw/data/eggNOG_data/5.0.0/rackham
export TMPDIR=$SNIC_TMP

INPUT="/home/magi1969/Genome_analysis_2026/results/Prokka/prokka.faa"
OUTPUT_PATH="/home/magi1969/Genome_analysis_2026/results_home/EggNOGmapper"

emapper.py -i ${INPUT} --output EggNOGmapper  --output_dir ${OUTPUT_PATH} --data_dir ${EGGNOG_DATA_DIR} --cpu 4
