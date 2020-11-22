#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h9
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h9.out
#SBATCH -e h9.err

### Run QMSim
./QMSim9 h9.txt -o

