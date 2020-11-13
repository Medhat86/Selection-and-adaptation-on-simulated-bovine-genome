#!/bin/bash
#SBATCH -p fat --qos=long
#SBATCH -t 5-00:00:00
#SBATCH -J m_64k
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem=250G
#SBATCH -o m_64k.out
#SBATCH -e m_64k.err

#source activate party
Rscript  m_64k.r

