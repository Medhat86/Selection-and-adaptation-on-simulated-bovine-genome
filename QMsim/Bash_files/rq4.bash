#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q4
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q4.out
#SBATCH -e q4.err

### Run QMSim
./QMSim3 q4.txt -o

