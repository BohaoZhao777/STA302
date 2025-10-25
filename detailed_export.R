# 导出 AmesHousing 数据为 CSV
library(AmesHousing)
library(dplyr)

# 加载数据
ames <- make_ames()

# 显示数据信息
cat("AmesHousing 数据信息:\n")
cat("总行数:", nrow(ames), "\n")
cat("总列数:", ncol(ames), "\n")
cat("销售价格范围: $", min(ames$Sale_Price), " - $", max(ames$Sale_Price), "\n")
cat("平均价格: $", round(mean(ames$Sale_Price), 2), "\n")

# 1. 导出完整数据
cat("\n1. 导出完整数据...\n")
write.csv(ames, "ames_housing_complete.csv", row.names = FALSE)
cat("✓ 完整数据已保存: ames_housing_complete.csv (", nrow(ames), "行 x", ncol(ames), "列)\n")

# 2. 导出模型变量（9个预测变量）
cat("\n2. 导出模型变量...\n")
model_vars <- c("Sale_Price", "Street", "Utilities", "Total_Bsmt_SF", 
                "Garage_Cars", "Pool_Area", "Gr_Liv_Area", 
                "Fireplaces", "Lot_Area")

# 查找卧室变量
bedroom_cols <- colnames(ames)[grepl("bedroom|Bedroom", colnames(ames), ignore.case = TRUE)]
if(length(bedroom_cols) > 0) {
  model_vars <- c(model_vars, bedroom_cols[1])
  cat("找到卧室变量:", bedroom_cols[1], "\n")
}

# 查找房间总变量
room_cols <- colnames(ames)[grepl("TotRms|Total.*Room|Room.*Total", colnames(ames), ignore.case = TRUE)]
if(length(room_cols) > 0) {
  model_vars <- c(model_vars, room_cols[1])
  cat("找到房间总变量:", room_cols[1], "\n")
}

# 创建模型数据
ames_model <- ames %>%
  select(all_of(model_vars)) %>%
  na.omit()

write.csv(ames_model, "ames_housing_model.csv", row.names = FALSE)
cat("✓ 模型变量已保存: ames_housing_model.csv (", nrow(ames_model), "行 x", ncol(ames_model), "列)\n")

# 显示所有文件
cat("\n" + "="*50 + "\n")
cat("CSV 文件导出完成!\n")
cat("="*50 + "\n")
cat("生成的文件:\n")
cat("1. ames_housing_complete.csv - 完整数据 (", nrow(ames), "行 x", ncol(ames), "列)\n")
cat("2. ames_housing_model.csv - 模型变量 (", nrow(ames_model), "行 x", ncol(ames_model), "列)\n")

# 显示模型数据的前几行
cat("\n模型数据预览:\n")
print(head(ames_model, 3))

cat("\n所有 CSV 文件已保存到当前目录!\n")
