# Processing TCGA Data for Preliminary Data Analysis

Goal of this workshop is to understand step by step process for processed
RNA-seq data exploration. 

More importantly this workshop is targeted to groom the simple thinking process
that goes around processing any publicly available data. 


## Project Directory Structure Layout

Each of you, first clone this repository using `git clone https://github.com/satyanarayan-rao/tcga_data_analysis.git` in appropriate workplace.

Then, follow the instructions below. 

## TCGA data download

We will be first downloading the data. Visit [TCGA](https://portal.gdc.cancer.gov/) and select **Explore Our Cancer Datasets**

1. Click on **Cohort Builder**

2. In the program, select `TCGA` (you will find this when you click on `16 more`)

3. Select `TCGA-LUAD` (this is Lung Adenocarcinoma)

4. On the right hand side, you will see **585 Cases**, click on that! 

5. Here you will see `31,867 Files`, `Custom Filters`, `Biospecimen`, and `Clinical`

6. Click on Files menu, and click `Download Manifest` 

7. Click on Files menu again, and click `Download Sample Sheet`

Once these two files are downloaded, then do the following:


search for `augmented_star_gene_counts.tsv` in the sample sheet and save those lines in a separate file called `luad_rna.txt`.  

Make sure `luad_rna.txt` has the header same as the manifest file.

To this point, you have created a metadata with the information to download RNA-seq processed data for TCGA-LUAD. 

## Download tool for TCGA data transfer


Create a directory called `scripts` in the Project root directory.

Visit https://gdc.cancer.gov/access-data/gdc-data-transfer-tool. 

Scroll down and go for Ubuntu and `GDC Data Transfer Tool Client`. Right click on the link and copy link. 
Download that using `curl` program in the script directory.
