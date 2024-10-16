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


# check data structure
  glimpse(data)

data |> 
  select(Gender, Physical_Health_status, Mental_Health_status, QOL_status) |> 
  tbl_summary(
    type = c(Physical_Health_status, Mental_Health_status, QOL_status) ~ "categorical",
    by = Gender
  ) |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
as_gt() |> 
  gtsave("tables/Table5.docx")

  
  
  