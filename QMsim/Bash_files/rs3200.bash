#!/bin/bash
#SBATCH -p medium
#SBATCH -t 5-00:00:00
#SBATCH -J s3200
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH -o s3200.out
#SBATCH -e s3200.err

### Run QMSim
./QMSim7 s3200.txt -o

