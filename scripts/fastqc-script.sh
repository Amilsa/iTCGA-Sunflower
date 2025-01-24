#!/bin/bash

#SBATCH --job-name=fastqc_amilsa # you can give your job a name
#SBATCH --nodes 1 # the number of processors or tasks
#SBATCH --cpus-per-task=2
#SBATCH --account=itcga # our account
#SBATCH --time=1:00:00 # the maximum time for the job
#SBATCH --mem=4gb # the amount of RAM
#SBATCH --partition=itcga # the specific server in chimera we are using
#SBATCH --reservation=ITCGA2025
#SBATCH --error=logs/%x-%A_%a.err   # a filename to save error messages into
#SBATCH --output=logs/%x-%A_%a.out  # a filename to save any printed output into

#i am telling chimera load module
module load fastqc-0.11.9-gcc-10.2.0-osi6pqc

fastqc -o /itcgastorage/share_home/amilsa.ferreira001/sunflower/results/fastqc/ \
/itcgastorage/share_home/amilsa.ferreira001/sunflower/data/raw_fastq/*.fq



#mv /itcgastorage/share_home/amilsa.ferreira001/1_project/data/*fastqc*  /itcgastorage/share_home/amilsa.ferreira001/1_project/results


echo "Script finished :)"




