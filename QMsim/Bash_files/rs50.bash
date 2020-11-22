#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s50
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s50.out
#SBATCH -e s50.err

### Run QMSim
./QMSim1 s50.txt -o

