#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q256
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q256.out
#SBATCH -e q256.err

### Run QMSim
./QMSim9 q256.txt -o

