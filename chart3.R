# Scatterplot: Acceptance rate vs Graduation (bachelors in four years) rate

#Load libraries 
library("ggplot2")
library("plotly")
library("dplyr")

college_df <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-mandyrwu/main/Data-Table%201.csv", stringsAsFactors = FALSE)

admissions_data <- college_df %>%
  select(Name, Applicants.total, Admissions.total, Graduation.rate...Bachelor.degree.within.4.years..total, Control.of.institution)

admissions_data <- mutate(admissions_data, "Acceptance.rate" = (Admissions.total/Applicants.total) * 100)

scatterplot <- ggplot(data = admissions_data) +
  geom_point(mapping = aes(x = Acceptance.rate, y = Graduation.rate...Bachelor.degree.within.4.years..total, color = Control.of.institution)) +
  labs(title = "Colleges in the US: Accaptance Rate vs Undergrad Graduation Rate",
       x = "Acceptance Rate (%)",
       y = "Graduation Rate with Bachelor Degreen within 4 Years (%)")


