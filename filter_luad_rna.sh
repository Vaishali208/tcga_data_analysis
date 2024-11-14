#!/bin/bash

# Define paths to the manifest and sample sheet files
manifest_file="gdc_manifest.tsv"
sample_sheet="gdc_sample_sheet.tsv"
output_file="luad_rna.txt"

# Extract header from the manifest file
header=$(head -1 "$manifest_file")

# Create or overwrite the output file with the header from the manifest file
echo "$header" > "$output_file"

# Search for lines in the sample sheet that contain 'augmented_star_gene_counts.tsv' and append them to the output file
grep "augmented_star_gene_counts.tsv" "$sample_sheet" >> "$output_file"

echo "Filtered data saved to $output_file"

