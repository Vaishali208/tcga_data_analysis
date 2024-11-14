SAMPLES_SHEET = "gdc_sample_sheet.tsv"
DATA_DIR = "/home/bec51320.iitr/~workplace/tcga_data_analysis/tcga_data/"

OUTPUT_DIR = "output"
BOXPLOT_OUTPUT = f"{OUTPUT_DIR}/nkx2_1_expression_boxplot.png"

CONDITIONS = ["Solid_Tissue_Normal", "Primary_Tumor"]

def get_sample_files(condition):
    sample_ids = []
    with open(SAMPLES_SHEET) as f:
        header = f.readline()
        for line in f:
            columns = line.strip().split('\t')
            if condition in columns:
                sample_id = columns[0]
                sample_ids.append(f"{DATA_DIR}/{sample_id}/{sample_id}.rna_seq.augmented_star_gene_counts.tsv")
    return sample_ids

rule all:
    input:
        BOXPLOT_OUTPUT,
        expand(f"{OUTPUT_DIR}/filtered_{{condition}}.txt", condition=CONDITIONS)

rule filter_nkx2_1:
    input:
        lambda wildcards: get_sample_files(wildcards.condition)
    output:
        f"{OUTPUT_DIR}/filtered_{{wildcards.condition}}.txt"
    run:
        import pandas as pd

        dataframes = [pd.read_csv(file, sep='\t') for file in input]
        combined_df = pd.concat(dataframes)
        nkx2_1_data = combined_df[combined_df['gene_id'] == 'NKX2-1'] 

        nkx2_1_data.iloc[:, 6].to_csv(output[0], index=False, header=False) 

rule log_transform_and_boxplot:
    input:
         expand(f"{OUTPUT_DIR}/filtered_{{condition}}.txt", condition=CONDITIONS)  # Input files from the filter rule
    output:
        BOXPLOT_OUTPUT
    script:
        "plot_expression.R"

