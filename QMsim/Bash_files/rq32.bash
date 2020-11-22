#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q32
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q32.out
#SBATCH -e q32.err

### Run QMSim
./QMSim6 q32.txt -o

