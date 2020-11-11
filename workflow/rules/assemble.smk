
rule assemble:
    input:
        r1="data/concat_trimmed/{sample}.r1.fastq.gz",
        r2="data/concat_trimmed/{sample}.r2.fastq.gz"
    output:
        directory("../../data/spades_assemblies/{sample}")
    shell:
        """
        module load spades; spades.py -1 {input.r1} -2 {input.r2} -o {output} -t 40 -m 100 --meta 
        """




#TODO fix unit so that unit column is sequencing id
# TODO add quast, spades, fastqc, and multiqc to yaml file