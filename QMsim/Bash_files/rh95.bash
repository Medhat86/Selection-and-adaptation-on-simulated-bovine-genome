#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h95
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h95.out
#SBATCH -e h95.err

### Run QMSim
./QMSim10 h95.txt -o

