library(tidyverse)
textM <- read.csv("TextMessages.csv")
#Create stratified bar charts of text messages by Time
#Transform to long data to combine times (Baseline and six_months)
long_data <- textM %>% pivot_longer(cols = c(Baseline, Six_months),
               names_to = "Time",
               values_to = "Texts")

head(long_data)

# Create stratified bar chart
ggplot(long_data, aes(x = Time, y = Texts)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(
    title = "Average Number of Text Messages by Time",
    x = "Time",
    y = "Average Texts",
  ) 
  