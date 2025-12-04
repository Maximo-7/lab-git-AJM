#!/bin/bash
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno14
#SBATCH --job-name=lab3_cut_alumno14
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1

echo "Máquina: $(hostname)"
echo "Usuario: $USER"
echo "Directorio: $(pwd)"
echo

echo "Cortando ficheros FASTQ..."
echo

# 4 cortes en paralelo, uno por Sample
for file in Sample*.fastq; do
    bash file_cut.sh "$file" &
done

wait

echo
echo "Acabado bien"
