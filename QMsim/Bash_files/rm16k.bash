#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J m16k
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o m16k.out
#SBATCH -e m16k.err

### Run QMSim
./QMSim7 m16k.txt -o

