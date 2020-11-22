#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m8k
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m8k.out
#SBATCH -e m8k.err

### Run QMSim
./QMSim5 m8k.txt -o

