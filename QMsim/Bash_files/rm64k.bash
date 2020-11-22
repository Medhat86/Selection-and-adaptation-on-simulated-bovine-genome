#!/bin/bash
#SBATCH -p fat
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -C scratch
#SBATCH -t 6-00:00:00
#SBATCH -J m64k
#SBATCH -o m64k.out
#SBATCH -e m64k.err

### Run QMSim
./QMSim9 m64k.txt -o

