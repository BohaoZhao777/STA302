# Export AmesHousing data to CSV
library(AmesHousing)
library(dplyr)

# Load data
ames <- make_ames()

# Display data information
cat("AmesHousing data information:\n")
cat("Total rows:", nrow(ames), "\n")
cat("Total columns:", ncol(ames), "\n")
cat("Sale price range: $", min(ames$Sale_Price), " - $", max(ames$Sale_Price), "\n")
cat("Average price: $", round(mean(ames$Sale_Price), 2), "\n")

# 1. Export complete data
cat("\n1. Exporting complete data...\n")
write.csv(ames, "ames_housing_complete.csv", row.names = FALSE)
cat("✓ Complete data saved: ames_housing_complete.csv (", nrow(ames), "rows x", ncol(ames), "columns)\n")

# 2. Export model variables (9 predictor variables)
cat("\n2. Exporting model variables...\n")
model_vars <- c("Sale_Price", "Street", "Utilities", "Total_Bsmt_SF", 
                "Garage_Cars", "Pool_Area", "Gr_Liv_Area", 
                "Fireplaces", "Lot_Area")

# Find bedroom variable
bedroom_cols <- colnames(ames)[grepl("bedroom|Bedroom", colnames(ames), ignore.case = TRUE)]
if(length(bedroom_cols) > 0) {
  model_vars <- c(model_vars, bedroom_cols[1])
  cat("Found bedroom variable:", bedroom_cols[1], "\n")
}

# Find total rooms variable
room_cols <- colnames(ames)[grepl("TotRms|Total.*Room|Room.*Total", colnames(ames), ignore.case = TRUE)]
if(length(room_cols) > 0) {
  model_vars <- c(model_vars, room_cols[1])
  cat("Found total rooms variable:", room_cols[1], "\n")
}

# Create model data
ames_model <- ames %>%
  select(all_of(model_vars)) %>%
  na.omit()

write.csv(ames_model, "ames_housing_model.csv", row.names = FALSE)
cat("✓ Model variables saved: ames_housing_model.csv (", nrow(ames_model), "rows x", ncol(ames_model), "columns)\n")

# Display all files
cat("\n" + "="*50 + "\n")
cat("CSV file export completed!\n")
cat("="*50 + "\n")
cat("Generated files:\n")
cat("1. ames_housing_complete.csv - Complete data (", nrow(ames), "rows x", ncol(ames), "columns)\n")
cat("2. ames_housing_model.csv - Model variables (", nrow(ames_model), "rows x", ncol(ames_model), "columns)\n")

# Display first few rows of model data
cat("\nModel data preview:\n")
print(head(ames_model, 3))

cat("\nAll CSV files have been saved to the current directory!\n")
