#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s200
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s200.out
#SBATCH -e s200.err

### Run QMSim
./QMSim3 s200.txt -o

