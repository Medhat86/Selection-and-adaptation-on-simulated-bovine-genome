#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J m_16k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o m_16k.out
#SBATCH -e m_16k.err

#source activate party 
Rscript  m_16k.r



