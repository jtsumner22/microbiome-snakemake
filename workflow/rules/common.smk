from snakemake.utils import validate
import pandas as pd

# this container defines the underlying OS for each job when using the workflow
# with --use-conda --use-singularity

##### load config and sample sheets #####

configfile: "../config/config.yaml"
validate(config, schema="../schemas/config.schema.yaml")

samples = pd.read_csv(config["samples"], sep="\t").set_index("sample", drop=False)
samples.index.names = ["sample_id"]
#validate(samples, schema="../schemas/samples.schema.yaml")

first_samples = pd.read_csv(config["first_samples"], sep="\t").set_index("first_sample", drop=False)
samples.index.names = ["first_sample_id"]
#validate(first_samples, schema="../schemas/samples.schema.yaml")

second_samples = pd.read_csv(config["second_samples"], sep="\t").set_index("second_sample", drop=False)
second_samples.index.names = ["second_sample_id"]
#validate(second_samples, schema="../schemas/samples.schema.yaml")