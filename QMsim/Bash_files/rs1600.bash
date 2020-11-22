#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s1600
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s1600.out
#SBATCH -e s1600.err

### Run QMSim
./QMSim6 s1600.txt -o

