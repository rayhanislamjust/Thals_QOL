# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)
library(broom.helpers)
# import data
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# impact of gender on quality f life
# y (QOL) = mx(Gender) + c
# y (QOL) = mx1(Gender) + mx2 (Age) + mx3(level_of_education) + c

# Building models and interpretation
lin_model <- lm(QOL_score ~ Gender, data = data)
summary(lin_model)
report(lin_model)

# tbl_uvregression

data |> 
  select(1:17, QOL_score) |> 
  tbl_uvregression(
    method = lm,
    y = QOL_score) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table6_UV_LinReg.docx")
