#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH -J Prokka
#SBATCH -o %x.out
#SBATCH -e %x.err

module load prokka/1.14.5-gompi-2024a

prokka --outdir /home/magi1969/Genome_analysis_2026/results/Prokka \
--force \
--prefix prokka \
--genus Enterococcus \
--species faecium \
--strain E745 \
--kingdom Bacteria \
/home/magi1969/Genome_analysis_2026/results/Canu/e.faecium.contigs.fasta