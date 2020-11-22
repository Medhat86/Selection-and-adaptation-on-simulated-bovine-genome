#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m10
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m10.out
#SBATCH -e m10.err

### Run QMSim
./QMSim6 m10.txt -o

