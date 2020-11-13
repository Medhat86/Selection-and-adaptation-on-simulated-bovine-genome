#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J s_3200k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o s_3200.out
#SBATCH -e s_3200.err

#source activate party
Rscript  s_3200.r