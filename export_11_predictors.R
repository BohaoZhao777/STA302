# Export AmesHousing data with 11 specific predictors including Wood_Deck_SF
library(AmesHousing)
library(dplyr)

# Load data
ames <- make_ames()

# Display data information
cat("AmesHousing data information:\n")
cat("Total rows:", nrow(ames), "\n")
cat("Total columns:", ncol(ames), "\n")

# Define the 11 predictor variables as requested
cat("\n=== 11 Predictor Variables ===\n")
cat("Categorical variables (2):\n")
cat("- Street\n")
cat("- Utilities\n")
cat("\nNumerical variables (9):\n")
cat("- Total_Bsmt_SF (Total Basement SF)\n")
cat("- Bedroom_AbvGr (Bedrooms above grade)\n")
cat("- Garage_Cars (Size of garage in car capacity)\n")
cat("- Pool_Area (Pool area in square feet)\n")
cat("- Gr_Liv_Area (Above grade living area square feet)\n")
cat("- Wood_Deck_SF (Wood deck area in square feet)\n")
cat("- Fireplaces (Number of fireplaces)\n")
cat("- Lot_Area (Lot area)\n")
cat("- TotRms_AbvGrd (Total rooms above ground)\n")

# Create the 11 predictor variables list
predictor_vars <- c(
  "Sale_Price",      # Response variable
  "Street",          # Categorical
  "Utilities",       # Categorical
  "Total_Bsmt_SF",   # Numerical
  "Bedroom_AbvGr",   # Numerical
  "Garage_Cars",     # Numerical
  "Pool_Area",       # Numerical
  "Gr_Liv_Area",     # Numerical
  "Wood_Deck_SF",    # Numerical
  "Fireplaces",      # Numerical
  "Lot_Area",        # Numerical
  "TotRms_AbvGrd"    # Numerical
)

# Check which variables exist in the dataset
cat("\n=== Variable Availability Check ===\n")
available_vars <- predictor_vars[predictor_vars %in% colnames(ames)]
missing_vars <- predictor_vars[!predictor_vars %in% colnames(ames)]

cat("Available variables:", length(available_vars), "out of", length(predictor_vars), "\n")
if(length(available_vars) > 0) {
  cat("✓ Available:", paste(available_vars, collapse = ", "), "\n")
}
if(length(missing_vars) > 0) {
  cat("✗ Missing:", paste(missing_vars, collapse = ", "), "\n")
}

# Create dataset with available variables
cat("\n=== Creating Dataset ===\n")
ames_11_predictors <- ames %>%
  select(all_of(available_vars)) %>%
  na.omit()

cat("Dataset created with", nrow(ames_11_predictors), "rows and", ncol(ames_11_predictors), "columns\n")

# Display data summary
cat("\n=== Data Summary ===\n")
cat("Response variable (Sale_Price):\n")
cat("- Mean: $", round(mean(ames_11_predictors$Sale_Price), 2), "\n")
cat("- Median: $", round(median(ames_11_predictors$Sale_Price), 2), "\n")
cat("- Range: $", min(ames_11_predictors$Sale_Price), " - $", max(ames_11_predictors$Sale_Price), "\n")

# Categorical variables summary
cat("\nCategorical variables:\n")
if("Street" %in% colnames(ames_11_predictors)) {
  cat("- Street levels:", length(unique(ames_11_predictors$Street)), "(", paste(unique(ames_11_predictors$Street), collapse = ", "), ")\n")
}
if("Utilities" %in% colnames(ames_11_predictors)) {
  cat("- Utilities levels:", length(unique(ames_11_predictors$Utilities)), "(", paste(unique(ames_11_predictors$Utilities), collapse = ", "), ")\n")
}

# Numerical variables summary
cat("\nNumerical variables summary:\n")
numerical_vars <- c("Total_Bsmt_SF", "Bedroom_AbvGr", "Garage_Cars", "Pool_Area", 
                   "Gr_Liv_Area", "Wood_Deck_SF", "Fireplaces", "Lot_Area", "TotRms_AbvGrd")
for(var in numerical_vars) {
  if(var %in% colnames(ames_11_predictors)) {
    cat("-", var, ": mean =", round(mean(ames_11_predictors[[var]], na.rm = TRUE), 2), 
        ", range =", round(min(ames_11_predictors[[var]], na.rm = TRUE), 2), "-", 
        round(max(ames_11_predictors[[var]], na.rm = TRUE), 2), "\n")
  }
}

# Save the dataset
cat("\n=== Saving Dataset ===\n")
write.csv(ames_11_predictors, "ames_11_predictors.csv", row.names = FALSE)
cat("✓ Dataset saved as: ames_11_predictors.csv\n")
cat("✓ File contains", nrow(ames_11_predictors), "rows and", ncol(ames_11_predictors), "columns\n")

# Display first few rows
cat("\n=== Data Preview (First 3 rows) ===\n")
print(head(ames_11_predictors, 3))

cat("\n=== Export Complete ===\n")
cat("The new CSV file 'ames_11_predictors.csv' has been created with the requested 11 predictor variables!\n")
