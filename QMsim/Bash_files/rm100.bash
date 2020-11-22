#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m100
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m100.out
#SBATCH -e m100.err

### Run QMSim
./QMSim10 m100.txt -o

