#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J s_6400k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o s_6400.out
#SBATCH -e s_6400.err

#source activate party
Rscript  s_6400.r

