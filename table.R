library(dplyr)
library(tidyr)

df <- read.csv("Data-Table 1.csv")

enrollment_by_state <- df %>%
  group_by(State.abbreviation) %>%
  summarise(
    total_enrollment = sum(Enrolled.total, na.rm = TRUE),
    avg_tuition = mean(Tuition.and.fees..2013.14, na.rm = TRUE)
  ) %>%
  arrange(desc(total_enrollment))
