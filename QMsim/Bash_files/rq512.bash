#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q512
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q512.out
#SBATCH -e q512.err

### Run QMSim
./QMSim10 q512.txt -o

