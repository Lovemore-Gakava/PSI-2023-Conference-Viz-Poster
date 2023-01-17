library(readr)
library(tidyverse)
set.seed(12345)
dat <- read.csv("data-raw/PSI_WW_psychometric.csv")
dat$rand <- sample(1:100, nrow(dat), replace = TRUE)
dat <- dat |>
  mutate(TRT = ifelse(rand < 50, "Treatment A", "Treatment B")) |>
  select(-c("rand"))

write_rds(dat, "data/PSI_WW_psychometric.rds")
