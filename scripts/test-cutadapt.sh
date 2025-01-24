#!/bin/bash

#SBATCH --job-name=cutadapt # you can give your job a name
#SBATCH --nodes 1 # the number of processors or tasks
#SBATCH --cpus-per-task=2
#SBATCH --account=itcga # our account
#SBATCH --reservation=ITCGA2025 # this gives us special access during the workshop
#SBATCH --time=1:00:00 # the maximum time for the job
#SBATCH --mem=4gb # the amount of RAM
#SBATCH --partition=itcga # the specific server in chimera we are using
#SBATCH --error=%x-%A.err   # a filename to save error messages into
#SBATCH --output=%x-%A.out  # a filename to save any printed output into

# Usage: sbatch cutadapt.sh path/to/input_dir path/to/output_dir
# Works for paired end reads where both end in the same *_001_downsampled.fastq

# Module load
module load py-dnaio-0.4.2-gcc-10.2.0-gaqzhv4
module load py-xopen-1.1.0-gcc-10.2.0-5kpnvqq
module load py-cutadapt-2.10-gcc-10.2.0-2x2ytr5

#cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --trim-n -m 25 -o /itcgastorage/share_home/amilsa.ferreira001/1_project/results//C1_S4_L001_R1_001_R1_001_ds_trim.fastq -p /itcgastorage/share_home/amilsa.ferreira001/1_project/results/R2_001_ds_trim.fastq \
 /itcgastorage/share_home/amilsa.ferreira001/1_project/C1_S4_L001_R1_001_downsampled.fastq
 /itcgastorage/share_home/amilsa.ferreira001/1_project/C1_S4_L001_R2_001_downsampled.fastq
