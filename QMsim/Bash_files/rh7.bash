#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h7
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h7.out
#SBATCH -e h7.err

### Run QMSim
./QMSim7 h7.txt -o

