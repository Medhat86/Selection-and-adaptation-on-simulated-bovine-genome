#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q8
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q8.out
#SBATCH -e q8.err

### Run QMSim
./QMSim4 q8.txt -o

