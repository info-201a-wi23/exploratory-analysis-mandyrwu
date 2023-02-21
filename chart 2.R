install.packages("scales")
install.packages("tidyverse")
library("scales")
library("dplyr")
library("ggplot2")

#Chart2.R Pie chart: Undergrad Enrollment Percentage by Geography Location

college_df <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-mandyrwu/main/Data-Table%201.csv", stringsAsFactors = FALSE)

college_df <- college_df %>%
  group_by(location = college_df$Degree.of.urbanization..Urban.centric.locale) %>%
  summarize(enrollment = sum(Undergraduate.enrollment))

total_undergrade_enrollment = sum(college_df$enrollment, na.rm = TRUE)

college_df <- college_df %>%
  mutate(percentage_enrollment = (enrollment / total_undergrade_enrollment))

piechart <- ggplot(data = college_df, aes(x = "", y = percentage_enrollment, fill = location)) +
        labs(title = "Undergrad Enrollment Percentage by Geographic Location", fill = "Geographic Location") +
        geom_col(color = "black") +
        coord_polar(theta = "y") +
        theme(axis.title.x = element_blank(),
              axis.title.y = element_blank())
