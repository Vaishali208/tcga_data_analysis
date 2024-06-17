# Cloning This Repository

If you are seeing this, then you already have created a Github account and I
have added you as a collaborator in this project! 

The next step is to clone this repository on PARAMGANGA. 

Github has changed the way you clone repository. First you need to generate a token for cloning and other operations. I have created a gif and shared on Discord. 

Once you generated the token, then you can do the following:

```
git clone https://github.com/satyanarayan-rao/tcga_data_analysis.git 
```

Input your username and for **password** paste your **token** that you have generated.

# Processing TCGA Data for Preliminary Data Analysis

Goal of this workshop is to understand step by step process for processed
RNA-seq data exploration. 

More importantly this workshop is targeted to groom the simple thinking process
that goes around processing any publicly available data. 


## TCGA data download

We will be first downloading the data. Visit [TCGA](https://portal.gdc.cancer.gov/) and select **Explore Our Cancer Datasets**

1. In the program, select `TCGA` (you will find this when you click on `16 more`)

2. Select `TCGA-LUAD` (this is Lung Adenocarcinoma)

3. On the right hand side, you will see **585 Cases**, click on that! 

4. Here you will see `31,867 Files`, `Custom Filters`, `Biospecimen`, and `Clinical`

5. Click on Files menu, and click `Download Manifest` 

6. Click on Files menu again, and click `Download Sample Sheet`

Once these two files are downloaded, then do the following:


search for `augmented_star_gene_counts.tsv` in the sample sheet. For each of those hits, find the line the manifest file, and save it in a file called `luad_rna.txt` 

Make sure `luad_rna.txt` has the header same as the manifest file.

To this point, you have created a metadata with the information to download RNA-seq processed data for TCGA-LUAD. 

## Download tool for TCGA data transfer

Create a directory called `scripts` in the Project root directory
Visit https://gdc.cancer.gov/access-data/gdc-data-transfer-tool. 

Scroll down and go for Ubuntu and `GDC Data Transfer Tool Client`. Right click on the link and copy link. 
Download that using `curl` program in the script directory.

