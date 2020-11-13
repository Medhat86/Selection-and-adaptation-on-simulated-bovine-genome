#!/bin/bash
#SBATCH -p medium
#SBATCH -t 23:00:00
#SBATCH -J q_512
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q_512.out
#SBATCH -e q_512.err


module load intel/mkl/64/2017/2.174


module load openmpi/intel/64/1.10.7


#module load conda/4.3.30
#source activate party 
Rscript  q_512.r


