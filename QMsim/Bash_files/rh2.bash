#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h2.out
#SBATCH -e h2.err

### Run QMSim
./QMSim2 h2.txt -o

