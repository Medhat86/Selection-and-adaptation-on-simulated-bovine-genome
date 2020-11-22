#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s800
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s800.out
#SBATCH -e s800.err

### Run QMSim
./QMSim5 s800.txt -o

