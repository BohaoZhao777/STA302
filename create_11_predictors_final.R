# Create CSV with 11 predictors including Wood_Deck_SF
library(AmesHousing)
library(dplyr)

# Load data
ames <- make_ames()

# Check if Wood_Deck_SF exists
cat("Checking for Wood_Deck_SF variable:\n")
if("Wood_Deck_SF" %in% colnames(ames)) {
  cat("✓ Wood_Deck_SF found in dataset\n")
} else {
  cat("✗ Wood_Deck_SF not found in dataset\n")
  cat("Available variables containing 'Wood' or 'Deck':\n")
  wood_vars <- colnames(ames)[grepl("Wood|Deck", colnames(ames), ignore.case = TRUE)]
  if(length(wood_vars) > 0) {
    cat(paste(wood_vars, collapse = ", "), "\n")
  } else {
    cat("No variables containing 'Wood' or 'Deck' found\n")
  }
}

# Define the 11 predictor variables
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

# Check which variables exist
available_vars <- predictor_vars[predictor_vars %in% colnames(ames)]
missing_vars <- predictor_vars[!predictor_vars %in% colnames(ames)]

cat("\nAvailable variables:", length(available_vars), "out of", length(predictor_vars), "\n")
if(length(available_vars) > 0) {
  cat("✓ Available:", paste(available_vars, collapse = ", "), "\n")
}
if(length(missing_vars) > 0) {
  cat("✗ Missing:", paste(missing_vars, collapse = ", "), "\n")
}

# Create dataset with available variables
ames_11_predictors <- ames %>%
  select(all_of(available_vars)) %>%
  na.omit()

# Save CSV
write.csv(ames_11_predictors, "ames_11_predictors.csv", row.names = FALSE)

cat("\nDataset created with", nrow(ames_11_predictors), "rows and", ncol(ames_11_predictors), "columns\n")
cat("File saved as: ames_11_predictors.csv\n")
cat("Variables included:", paste(colnames(ames_11_predictors), collapse = ", "), "\n")
