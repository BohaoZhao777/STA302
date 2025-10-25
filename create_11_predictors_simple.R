# Create CSV with 11 predictors
library(AmesHousing)
library(dplyr)

# Load data
ames <- make_ames()

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

# Check available variables
available_vars <- predictor_vars[predictor_vars %in% colnames(ames)]
cat("Available variables:", length(available_vars), "out of", length(predictor_vars), "\n")

# Create dataset
ames_11_predictors <- ames %>%
  select(all_of(available_vars)) %>%
  na.omit()

# Save CSV
write.csv(ames_11_predictors, "ames_11_predictors.csv", row.names = FALSE)

cat("Dataset created with", nrow(ames_11_predictors), "rows and", ncol(ames_11_predictors), "columns\n")
cat("File saved as: ames_11_predictors.csv\n")
cat("Variables included:", paste(colnames(ames_11_predictors), collapse = ", "), "\n")
