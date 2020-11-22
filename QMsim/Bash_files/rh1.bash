#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h1
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h1.out
#SBATCH -e h1.err

### Run QMSim
./QMSim1 h1.txt -o

