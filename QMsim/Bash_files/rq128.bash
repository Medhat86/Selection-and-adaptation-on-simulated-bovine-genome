#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J q128
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o q128.out
#SBATCH -e q128.err

### Run QMSim
./QMSim8 q128.txt -o

