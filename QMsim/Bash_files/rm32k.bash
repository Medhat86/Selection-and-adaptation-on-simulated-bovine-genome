#!/bin/bash
#SBATCH -p medium --qos=long
#SBATCH -t 48:00:00
#SBATCH -J m32k
#SBATCH -n 70
#SBATCH --mem=120G
#SBATCH -o m32k.out
#SBATCH -e m32k.err


### Run QMSim
./QMSim8 m32k.txt -o

