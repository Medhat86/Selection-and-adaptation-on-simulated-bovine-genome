#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m1
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m1.out
#SBATCH -e m1.err

### Run QMSim
./QMSim1 m1.txt -o

