
rule merge_r1_reads:
    input:
        f_r1="data/trimmed/{first_sample}_R1_001.fastq.gz",
        s_r1="data/trimmed/{second_sample}_R1_001.fastq.gz"
    output:
        r1="data/concat_trimmed/{sample}_R1.fastq.gz"
    shell:
        "cat {input.f_r1} {input.s_r1} > {output.r1}"


rule merge_r2_reads:
    input:
        f_r2="data/trimmed/{first_sample}_R2_001.fastq.gz",
        s_r2="data/trimmed/{second_sample}_R2_001.fastq.gz"
    output:
        r2="data/concat_trimmed/{sample}_R2.fastq.gz"
    shell:
        "cat {input.f_r2} {input.s_r2} > {output.r2}"

