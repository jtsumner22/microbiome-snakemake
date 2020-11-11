
rule assemble:
    input:
        r1="../data/concat_trimmed/{sample}.r1.fastq.gz",
        r2="../data/concat_trimmed/{sample}.r2.fastq.gz"
    output:
        "../data/spades_assemblies/{sample}/scaffolds.fa"
    shell:
        """
        module load spades; spades.py -1 {input.r1} -2 {input.r2} -o {output} -t 40 -m 100 --meta 
        """

rule merge_assemblies:
    input:
        "../data/spades_assemblies/{sample}/scaffolds.fa"
    output:
        "all_scaffolds.fa"
    shell:
        "cat {input} > {output}"


#TODO fix unit so that unit column is sequencing id
# TODO add quast, spades, fastqc, and multiqc to yaml file
