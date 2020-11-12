
rule merge_r1_reads:
    input:
        tf_r1="../data/trimmed/first/{sample}.f.r1.fastq.gz",
        ts_r1="../data/trimmed/second/{sample}.s.r1.fastq.gz",
    output:
        r1="../data/concat_trimmed/{sample}.r1.fastq.gz"
    shell:
        "cat {input.tf_r1} {input.ts_r1} > {output.r1}"


rule merge_r2_reads:
    input:
        tf_r2="../data/trimmed/first/{sample}.f.r2.fastq.gz",
        ts_r2="../data/trimmed/second/{sample}.s.r2.fastq.gz",
    output:
        r2="../data/concat_trimmed/{sample}.r2.fastq.gz"
    shell:
        "cat {input.tf_r2} {input.ts_r2} > {output.r2}"

# To run fastqc on
rule fastqc_trimmed:
    input:
        r1="../data/concat_trimmed/{sample}.r1.fastq.gz",
        r2="../data/concat_trimmed/{sample}.r2.fastq.gz"

    output:
        "../data/concat_trimmed/{sample}.r1_fastqc.html",
        "../data/concat_trimmed/{sample}.r2_fastqc.html"
    threads: 12
    shell:
         "fastqc -t {threads} {input} --outdir '../data/concat_trimmed/'"

rule multiqc_trimmed:
    input:
        expand("../data/concat_trimmed/{sample}.r1_fastqc.html", sample=samples2["sample"]),
        expand("../data/concat_trimmed/{sample}.r2_fastqc.html", sample=samples2["sample"])
    output:
        "../data/concat_trimmed/multiqc_report.html"
    shell:
        "multiqc ../data/concat_trimmed/multiqc_report.html"
