#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -n 1
#SBATCH -t 00:01:00
#SBATCH -J Quast
#SBATCH -o %x.out
#SBATCH -e %x.err

module load QUAST/5.3.0-gfbf-2024a

quast.py -o /home/magi1969/Genome_analysis_2026/results \
            --est-ref-size 3200000 \
            /home/magi1969/Genome_analysis_2026/results/e.faecium.contigs.fasta
      