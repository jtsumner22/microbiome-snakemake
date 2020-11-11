
rule first_fastp:
    input:
         r1="../../data/reads/{first_sample}_R1_001.fastq.gz",
         r2="../../data/reads/{first_sample}_R2_001.fastq.gz"
    output:
          r1="../../data/trimmed/{first_sample}_R1_001.fastq.gz",
          r2="../../data/trimmed/{first_sample}_R2_001.fastq.gz"
    conda:
         "../envs/seq_processing.yml"
    shell:
         """
         fastp -i {input.r1} -I {input.r2} --out1 ${output.r1} --out2 {output.r2} \
         --detect_adapter_for_pe --thread 16 --length_required 50
         """


rule second_fastp:
    input:
         r1="../../data/reads/{second_sample}_R1_001.fastq.gz",
         r2="../../data/reads/{second_sample}_R2_001.fastq.gz"
    output:
        r1="../../data/trimmed/{second_sample}_R1_001.fastq.gz",
        r2="../../data/trimmed/{second_sample}_R2_001.fastq.gz"
    conda:
         "../envs/seq_processing.yml"
    shell:
         """
         fastp -i {input.r1} -I {input.r2} --out1 ${output.r1} --out2 {output.r2} \
         --detect_adapter_for_pe --thread 16 --length_required 50
         """
