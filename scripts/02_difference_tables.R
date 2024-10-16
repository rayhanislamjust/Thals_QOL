# load packages
library(tidyverse)
library(gtsummary)
library(gt)
# import data
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

mean(data$QOL_score)

data |> 
  select(18:28, Gender) |> 
  tbl_summary(by = Gender,
              statistic = list(
                all_continuous() ~ "{mean}±{sd}"
              ), type = c(Role_Physical, Role_Emotional) ~ "continuous") |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table3.docx")


data |> 
  select(18:28, Economic_Class) |> 
  tbl_summary(by = Economic_Class,
              statistic = list(
                all_continuous() ~ "{mean}±{sd}"
              ), type = c(Role_Physical, Role_Emotional) ~ "continuous") |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table4.docx")
