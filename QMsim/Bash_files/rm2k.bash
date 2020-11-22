#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m2k
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m2k.out
#SBATCH -e m2k.err

### Run QMSim
./QMSim3 m2k.txt -o

