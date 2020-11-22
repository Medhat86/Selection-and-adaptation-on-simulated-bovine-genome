#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q16
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q16.out
#SBATCH -e q16.err

### Run QMSim
./QMSim5 q16.txt -o

