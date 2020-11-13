#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J s_12800k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o s_12800.out
#SBATCH -e s_12800.err

#source activate party
Rscript  s_12800.r


