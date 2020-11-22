#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m4k
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m4k.out
#SBATCH -e m4k.err

### Run QMSim
./QMSim4 m4k.txt -o

