# 패키지 설치
# install.packages("bigrquery")

library(DBI)
library(bigrquery)
library(dplyr)

billing <- "bigquerytutorial-274406"

con <- dbConnect(
  bigrquery::bigquery(),
  project = "publicdata",
  dataset = "samples",
  billing = billing
)

sql <- "SELECT year, month, day, weight_pounds FROM `publicdata.samples.natality`"

tb <- bq_project_query(billing, sql)
bq_table_download(tb, max_results = 10)


sql_house <- "SELECT * FROM `bigquerytutorial-274406.house_price.train`"
house_tb <- bq_project_query(billing, sql_house)

train <- bq_table_download(house_tb)

glimpse(train)
