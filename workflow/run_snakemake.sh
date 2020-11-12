#! /bin/bash
#SBATCH -A p31288
#SBATCH --job-name="scheduler"
#SBATCH -t 40:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -p normal
#SBATCH --mem=2gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jacksumner2026@u.northwestern.edu

cd $SLURM_SUBMIT_DIR

mkdir -p logs_slurm
snakemake -s Snakefile --cluster-config cluster.yaml --cluster 'sbatch -t {cluster.time} --mem-per-cpu={cluster.mem} -n {cluster.cpus} -o {cluster.output} -e {cluster.output} --mail-type {cluster.email_type} --mail-user {cluster.email}' -j 10