#!/bin/bash
#SBATCH -p medium --qos=long
#SBATCH -t 48:00:00
#SBATCH -J ld_m16k
#SBATCH -n 70
#SBATCH --mem=120G
#SBATCH -o ld_m16k.out
#SBATCH -e ld_m16k.err
module load intel/mkl/64/2017/2.174
module load openmpi/intel/64/1.10.7
#module load conda/4.3.30
#source activate party
Rscript ld_m16k.R

