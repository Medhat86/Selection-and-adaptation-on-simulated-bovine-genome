#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q1
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q1.out
#SBATCH -e q1.err

### Run QMSim
./QMSim1 q1.txt -o

