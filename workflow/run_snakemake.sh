#! /bin/bash
#SBATCH -A p31288
#SBATCH --job-name="scheduler"
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -p short
#SBATCH --mem=2gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jacksumner2026@u.northwestern.edu
module load anaconda3
source activate minimal_ds
source activate snakemake

cd $SLURM_SUBMIT_DIR

mkdir -p logs_slurm
snakemake --verbose --use-conda --cluster-config cluster.yaml --cluster 'sbatch -A {cluster.allocation} -p {cluster.partition} -t {cluster.time} --mem-per-cpu={cluster.mem} -n {cluster.cpus} -o {cluster.output} -e {cluster.output} --mail-type {cluster.email_type} --mail-user {cluster.email}' -j 10