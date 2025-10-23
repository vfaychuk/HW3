# Installing the packages i need.
install.packages("installr")
library(installr)
install.packages("tidyverse")
library(tidyverse)

#Using Vlads long_data
textM <- read.csv("TextMessages.csv")
long_data <- textM %>% pivot_longer(cols = c(Baseline, Six_months),
                                    names_to = "Time",
                                    values_to = "Texts")

#Creating summary Tables

# Summary table by Group
group_summary <- long_data |>
  group_by(Group) |>
  summarise(
    mean_texts = mean(Texts, na.rm = TRUE),
    median_texts = median(Texts, na.rm = TRUE),
    sd_texts = sd(Texts, na.rm = TRUE),
    min_texts = min(Texts, na.rm = TRUE),
    max_texts = max(Texts, na.rm = TRUE),
    n_participants = n_distinct(Participant),
    n_rows = n(),
    .groups = "drop"
  )

#summary table by Time
time_summary <- long_data |>
  group_by(Time) |>
  summarise(
    mean_texts = mean(Texts, na.rm = TRUE),
    sd_texts = sd(Texts, na.rm = TRUE),
    n = n(),
    se_texts = sd_texts / sqrt(n),
    .groups = "drop"
  )

# 3) By Group and Time
group_time_summary <- long_data |>
  group_by(Group, Time) |>
  summarise(
    mean_texts = mean(Texts, na.rm = TRUE),
    sd_texts = sd(Texts, na.rm = TRUE),
    n = n(),
    se_texts = sd_texts / sqrt(n),
    .groups = "drop"
  )



