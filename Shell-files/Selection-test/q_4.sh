#!/bin/bash
#SBATCH -p medium
#SBATCH -t 23:00:00
#SBATCH -J q_4
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q_4.out
#SBATCH -e q_4.err


module load intel/mkl/64/2017/2.174


module load openmpi/intel/64/1.10.7


#module load conda/4.3.30
#source activate party 
Rscript  q_4.r


