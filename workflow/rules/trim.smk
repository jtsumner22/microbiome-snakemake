
def get_fq_f_r1(wildcards):
    print(wildcards.sample)
    return samples2.loc[wildcards.sample, ["f_fq1", "f_fq2", "s_fq1", "s_fq2"]].dropna()["f_fq1"]


def get_fq_f_r2(wildcards):
    print(wildcards.sample)
    return samples2.loc[wildcards.sample, ["f_fq1", "f_fq2", "s_fq1", "s_fq2"]].dropna()#["f_fq2"]


def get_fq_s_r1(wildcards):
    print(wildcards.sample)
    return samples2.loc[wildcards.sample, ["f_fq1", "f_fq2", "s_fq1", "s_fq2"]].dropna()#["s_fq1"]


def get_fq_s_r2(wildcards):
    print(wildcards.sample)
    return samples2.loc[wildcards.sample, ["f_fq1", "f_fq2", "s_fq1", "s_fq2"]].dropna()#["s_fq2"]

def get_sample(wildcards):
    print(wildcards.sample)
    return samples2.loc[wildcards.sample, ["sample", "f_fq1", "f_fq2", "s_fq1", "s_fq2"]].dropna()["sample"]

rule first_fastp:
    input:
         f_r1=get_fq_f_r1,
         f_r2=get_fq_f_r2,
         s_r1=get_fq_s_r1,
         s_r2=get_fq_s_r1

    output:
          tf_r1="../data/trimmed/first/{sample}.f.r1.fastq.gz",
          tf_r2="../data/trimmed/first/{sample}.f.r2.fastq.gz",
          ts_r1="../data/trimmed/second/{sample}.s.r1.fastq.gz",
          ts_r2="../data/trimmed/second/{sample}.s.r2.fastq.gz"
    conda:
         "../envs/seq_processing.yml"
    shell:
         """
         fastp -i ../data/reads{input.f_r1} -I ../data/reads/{input.f_r2} --out1 ${output.tf_r1} --out2 {output.tf_r2} \
         --detect_adapter_for_pe --thread 16 --length_required 50;
         fastp -i ../data/reads{input.s_r1} -I ../data/reads/{input.s_r2} --out1 ${output.ts_r1} --out2 {output.ts_r2} \
         --detect_adapter_for_pe --thread 16 --length_required 50
         """
