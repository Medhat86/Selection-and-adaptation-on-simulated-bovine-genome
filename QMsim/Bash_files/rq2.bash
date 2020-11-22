#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q2.out
#SBATCH -e q2.err

### Run QMSim
./QMSim2 q2.txt -o

