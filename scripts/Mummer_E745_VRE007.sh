#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:01:00
#SBATCH -J Mummer_E745_VRE007
#SBATCH -o %x.out
#SBATCH -e %x.err

module load MUMmer/4.0.1-GCCcore-13.3.0
E745="/home/magi1969/Genome_analysis_2026/results/Canu/e.faecium.contigs.fasta"
VRE007="/home/magi1969/Genome_analysis_2026/results/Blast/e.faecium_VRE007.fasta"
alignment_output="/home/magi1969/Genome_analysis_2026/results/Blast/alignment_E745_VRE007"

nucmer -p ${alignment_output} ${E745} ${VRE007}
delta-filter -1 ${alignment_output}.delta > ${alignment_output}_filtered.delta

mummerplot --png --layout -p ${alignment_output}_plot ${alignment_output}_filtered.delta