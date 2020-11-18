
def vcontact_inputs(wildcards):
    files = expand("../data/vibrant_output/VIBRANT_{sample}_greater1kb_scaffolds/VIBRANT_phages_{sample}_greater1kb_scaffolds/{sample}_greater1kb_scaffolds.phages_combined.faa", sample=samples["sample"])
    return files

#### Run Vibrant on parsed assemblies (i.e., contigs > 1kb ) to predict viral contigs ####
rule vibrant_parsed :
    input:
        "../data/parsed_assemblies/{sample}_greater1kb_scaffolds.fasta"
    output:
        direc=directory("../data/vibrant_output/VIBRANT_{sample}_greater1kb_scaffolds"),
        phages="../data/vibrant_output/VIBRANT_{sample}_greater1kb_scaffolds/VIBRANT_phages_{sample}_greater1kb_scaffolds/{sample}_greater1kb_scaffolds.phages_combined.faa"
    threads: 20
    conda:
        "../envs/vibrant.yml"
    shell:
         "python3 ../../../VIBRANT/VIBRANT_run.py -i {input} -d ../../../VIBRANT/databases -folder ../data/vibrant_output/ -t {threads}"

#### Prepare Vibrant output for VContact2 ####

rule concat_vibrant_phageAA:
    input:
        files = vcontact_inputs
    output:
        temp("../data/vcontact2_data/concat_phages_combined.faa")
    shell:
        "cat {input.files} > {output}"

rule simplify_vibrant_AA:
    input:
        "../data/vcontact2_data/concat_phages_combined.faa"
    output:
        "../data/vcontact2_data/concat_phages_combined.simple.faa"
    conda:
        "../envs/vibrant.yml"
    shell:
        "python3 ../../../VIBRANT/scripts/simplify_faa-ffn.py {input}"


rule generate_gene2genome:
    input:
        "../data/vcontact2_data/concat_phages_combined.simple.faa"
    output:
        "../data/vcontact2_data/g2g_concat_phages_combined.simple.csv"
    conda:
        "../envs/vcontact2.yml"
    shell:
        "vcontact2_gene2genome -p {input} -o {output} -s 'Prodigal-FAA'"


#### Prepare GFF files from VIBRANT ####

#rule parse_genbank:


#rule convert_genbank2gff:


#rule multigff_by_sample:


#rule multigff_by_cluster: