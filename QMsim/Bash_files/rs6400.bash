#!/bin/bash
#SBATCH -p medium
#SBATCH -t 48:00:00
#SBATCH -J s6400
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s6400.out
#SBATCH -e s6400.err

### Run QMSim
./QMSim8 s6400.txt -o

