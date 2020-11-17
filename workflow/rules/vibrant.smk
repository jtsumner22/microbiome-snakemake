
#### Run Vibrant on parsed assemblies (i.e., contigs > 1kb ) to predict viral contigs ####
rule vibrant_parsed :
    input:
        "../data/parsed_assemblies/{sample}_greater1kb_scaffolds.fasta"
    output:
        direc="../data/vibrant_output/VIBRANT_{sample}_greater1kb_scaffolds",
        phages="../data/vibrant_output/VIBRANT_{sample}_greater1kb_scaffolds/VIBRANT_phages_{sample}_greater1kb_scaffolds/{sample}_greater1kb_scaffolds.phages_combined.ffn"
    threads: 20
    conda:
        "../envs/vibrant.yml"
    shell:
         "python3 ../../../VIBRANT/VIBRANT_run.py -i {input} -d ../../../VIBRANT/databases -folder ../data/vibrant_output/ -t {threads}"

#### Prepare Vibrant output for VContact2 ####

#rule concat_vibrant_phageAA:


#rule simplify_vibrant_AA:


#rule generate_gene2genome:


#### Prepare GFF files from VIBRANT ####

#rule parse_genbank:


#rule convert_genbank2gff:


#rule multigff_by_sample:


#rule multigff_by_cluster: