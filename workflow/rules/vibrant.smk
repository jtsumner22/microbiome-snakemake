
rule vibrant_parsed:
    input:
        "../data/parsed_assemblies/{sample}_greater1kb_scaffolds.fasta"
    output:
        direc="../data/vibrant_outputs/VIBRANT_{sample}_greater1kb_scaffolds",
        phages="../data/vibrant_outputs/VIBRANT_{sample}_greater1kb_scaffolds/VIBRANT_phages_{sample}_greater1kb_scaffolds/{sample}_greater1kb_scaffolds.phages_combined.ffn"
    threads: 20
    shell:
         "python3 /projects/p31288/VIBRANT/VIBRANT_run.py -i {input} -folder ../data/vibrant_output/ -t {threads}"