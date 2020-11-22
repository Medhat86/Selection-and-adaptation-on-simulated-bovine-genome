#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h6
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h6.out
#SBATCH -e h6.err

### Run QMSim
./QMSim6 h6.txt -o

