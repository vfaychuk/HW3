setwd("/cloud/project")

read.csv("TextMessages.csv")

TMData <- read.csv("TextMessages.csv")

is.factor(TMData$Group)

is.factor(TMData$Participant)

TMData$Group <- as.factor(TMData$Group)

TMData$Participant <- as.factor(TMData$Participant)

#install.packages("ggplot2")

library(ggplot2)

boxplot_BaselinebyGroup <- ggplot(TMData, aes(Group, Baseline))

boxplot_BaselinebyGroup

boxplot_BaselinebyGroup + geom_boxplot()

boxplot_BaselinebyGroup + geom_boxplot() + labs(x="Group", y="Baseline")

min(TMData$Baseline)

max(TMData$Baseline)

boxplot_BaselinebyGroup + geom_boxplot() + labs(x="Group", y="Baseline") + 
  scale_y_continuous(limits = c(40, 100))

boxplot_BaselinebyGroup + geom_boxplot() + labs(x="Group", y="Baseline") + 
  scale_y_continuous(limits = c(40, 100), breaks = seq(from =40, to = 100, by = 5))


