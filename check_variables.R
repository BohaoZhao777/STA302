# Check available variables in AmesHousing dataset
library(AmesHousing)

# Load data
ames <- make_ames()

# Check for Wood_Deck_SF
cat("Checking for Wood_Deck_SF variable:\n")
if("Wood_Deck_SF" %in% colnames(ames)) {
  cat("✓ Wood_Deck_SF found in dataset\n")
  cat("Summary of Wood_Deck_SF:\n")
  print(summary(ames$Wood_Deck_SF))
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

# List all available variables
cat("\nAll available variables:\n")
cat(paste(colnames(ames), collapse = ", "), "\n")
