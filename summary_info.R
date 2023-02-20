library(dplyr)

options(width = 1000, digits = 2, scipen = 999)

college_admission <- read.csv("Data-Table\ 1.csv")

col_num <- ncol(college_admission)

row_num <- nrow(college_admission)

enrollment_distribution <- summary(college_admission$Enrolled.total,scipen = 999)

state_num <- n_distinct(college_admission$State.abbreviation)

total_enrollment <- sum(college_admission$Enrolled.total, na.rm = TRUE)
