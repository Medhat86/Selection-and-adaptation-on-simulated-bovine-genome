#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h4
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h4.out
#SBATCH -e h4.err

### Run QMSim
./QMSim4 h4.txt -o

