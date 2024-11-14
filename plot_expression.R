
library(ggplot2)

normal_data <- read.table("output/filtered_Solid_Tissue_Normal.txt", header = FALSE)
tumor_data <- read.table("output/filtered_Primary_Tumor.txt", header = FALSE)

data <- data.frame(
    expression = c(normal_data$V1, tumor_data$V1), 
    condition = factor(rep(c("Normal", "Tumor"), c(nrow(normal_data), nrow(tumor_data))))
)

# Create the boxplot
ggplot(data, aes(x = condition, y = expression)) +
    geom_boxplot() +
    labs(title = "NKX2-1 Expression Levels", x = "Condition", y = "Expression Level") +
    theme_minimal()

# Save the plot
ggsave("output/nkx2_1_expression_boxplot.png")

