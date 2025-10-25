# Ames Housing Residual Analysis Summary

## Analysis Overview
This analysis uses the Ames Housing dataset to perform residual analysis on a linear regression model with 10 predictors and 1 interaction term (11 total model terms).

## Dataset Information
- **Source**: AmesHousing R package
- **File**: `ames_housing_model.csv`
- **Sample Size**: 2,930 observations
- **Variables**: 11 total (1 response + 10 predictors + 1 interaction term)

## Variables Used

### Response Variable
- **Sale_Price**: House sale price in dollars

### Categorical Predictors (2)
- **Street**: Type of street access (Pave/Grvl)
- **Utilities**: Type of utilities available

### Numerical Predictors (8)
- **Total_Bsmt_SF**: Total basement square feet
- **Bedroom_AbvGr**: Number of bedrooms above grade
- **Garage_Cars**: Size of garage in car capacity
- **Pool_Area**: Pool area in square feet
- **Gr_Liv_Area**: Above grade living area square feet
- **Fireplaces**: Number of fireplaces
- **Lot_Area**: Lot size in square feet
- **TotRms_AbvGrd**: Total rooms above ground

### Interaction Term (1)
- **Street:Garage_Cars**: Interaction between street type and garage capacity

**Total Model Terms: 11 (10 predictors + 1 interaction term)**

## Model Specification
```
Sale_Price ~ Total_Bsmt_SF + Bedroom_AbvGr + Garage_Cars + Pool_Area + 
             Gr_Liv_Area + Fireplaces + Lot_Area + TotRms_AbvGrd + 
             Street + Utilities + Street:Garage_Cars
```

## Analysis Components

### 1. Model Fitting
- Linear regression with 10 predictors + 1 interaction term (11 total terms)
- Includes interaction term between Street and Garage_Cars
- Model performance metrics (R-squared, F-statistic, etc.)

### 2. Residual Analysis
- **Residuals vs Fitted Values**: Check linearity assumption
- **Residuals vs Each Predictor**: Individual predictor relationships
- **Q-Q Plot**: Check normality assumption
- **Scale-Location Plot**: Check homoscedasticity assumption

### 3. Diagnostic Plots
- 12 total plots generated:
  - 1 fitted values plot
  - 8 numerical predictor plots
  - 2 categorical predictor plots
  - 1 interaction effect plot

### 4. Model Diagnostics
- Coefficient significance testing
- Interaction term significance
- Outlier detection
- Influence point identification

## Output Files
- **Analysis Report**: `simple_residual_analysis.Rmd`
- **Residual Plots**: `residual_plots_11_terms.png`
- **Data File**: `ames_housing_model.csv`

## Key Features
- Comprehensive residual analysis for all predictors
- Interaction term analysis between Street and Garage_Cars
- Model assumption testing
- High-quality diagnostic plots
- Statistical significance testing
- **Total Model Terms: 11 (10 predictors + 1 interaction term)**

## Note
The original request included `Wood_Deck_SF` as a predictor, but this variable is not available in the current dataset. The analysis uses the 10 available predictors plus 1 interaction term (11 total model terms).
