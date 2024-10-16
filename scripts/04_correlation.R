# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)
# import data
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# calculate co-relations
cor(data$General_Health, data$QOL_score)

# correlation matrix
data |> 
  select(18:28) |> 
  correlation() |> 
  summary(redundant = T) |> 
  plot()
