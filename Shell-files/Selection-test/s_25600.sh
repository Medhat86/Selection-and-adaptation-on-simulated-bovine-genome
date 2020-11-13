#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J s_25600k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o s_25600.out
#SBATCH -e s_25600.err

#source activate party
Rscript  s_25600.r

