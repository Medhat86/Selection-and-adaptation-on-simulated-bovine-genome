#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s100
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s100.out
#SBATCH -e s100.err

### Run QMSim
./QMSim2 s100.txt -o

