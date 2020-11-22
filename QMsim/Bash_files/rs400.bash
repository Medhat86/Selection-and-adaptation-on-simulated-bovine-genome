#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s400
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s400.out
#SBATCH -e s400.err

### Run QMSim
./QMSim4 s400.txt -o

