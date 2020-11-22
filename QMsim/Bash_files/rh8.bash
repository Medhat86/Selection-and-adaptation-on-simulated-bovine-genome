#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h8
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h8.out
#SBATCH -e h8.err

### Run QMSim
./QMSim8 h8.txt -o

