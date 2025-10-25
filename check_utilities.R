# Check Utilities categories
library(AmesHousing)

# Load data
ames <- make_ames()

# Check Utilities categories
cat("Utilities变量分析:\n")
cat("总类别数:", length(unique(ames$Utilities)), "\n")
cat("类别名称:", paste(unique(ames$Utilities), collapse = ", "), "\n\n")

# Frequency table
cat("各类别频数:\n")
print(table(ames$Utilities))

# Check for missing values
cat("\n缺失值数量:", sum(is.na(ames$Utilities)), "\n")
