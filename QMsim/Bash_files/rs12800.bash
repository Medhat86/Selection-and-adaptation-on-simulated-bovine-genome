#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s12800
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s12800.out
#SBATCH -e s12800.err

### Run QMSim
./QMSim9 s12800.txt -o

