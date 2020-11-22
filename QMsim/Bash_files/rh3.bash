#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h3
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h3.out
#SBATCH -e h3.err

### Run QMSim
./QMSim3 h3.txt -o

