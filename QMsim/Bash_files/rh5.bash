#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J h5
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o h5.out
#SBATCH -e h5.err

### Run QMSim
./QMSim5 h5.txt -o

