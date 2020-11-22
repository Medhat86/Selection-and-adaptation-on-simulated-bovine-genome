#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s25600
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s25600.out
#SBATCH -e s25600.err

### Run QMSim
./QMSim10 s25600.txt -o

