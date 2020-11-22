#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m1k
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m1k.out
#SBATCH -e m1k.err

### Run QMSim
./QMSim2 m1k.txt -o

