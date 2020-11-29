from snakemake.utils import min_version
min_version("5.3.0")

configfile: "config.yml"

rule fetch_nxml:
    output:
        expand("output/{id}", id = config["pmc_ids"])
    shell:
        """
        python fetch_nxml.py --pmcids {output}
        """
        