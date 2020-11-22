#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q64
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q64.out
#SBATCH -e q64.err

### Run QMSim
./QMSim7 q64.txt -o

