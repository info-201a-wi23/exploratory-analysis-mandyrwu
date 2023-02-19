install.packages("ggplot2")
library("ggplot2")
install.packages("maps")
install.packages("mapproj")
library("dplyr")
library("scales")

np_data <- read.csv("/Users/anyuchen/Desktop/INFO201/Data-Table-1.csv", stringsAsFactors=FALSE)

state_enrollment_data <- np_data %>% select(FIPS.state.code, Undergraduate.enrollment)
state_enrollment_data$FIPS.state.code <- tolower(state_enrollment_data$FIPS.state.code)

state_enrollment <- state_enrollment_data %>%  
  group_by(FIPS.state.code) %>% 
  summarize(state_total = sum(Undergraduate.enrollment, na.rm = TRUE))

stat_enrollment_polygon <- left_join(state_shape, state_enrollment, by = c("region" = "FIPS.state.code"))

ggplot(stat_enrollment_polygon) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group, 
                             fill = state_total)) +
  scale_fill_continuous(low = 'blue',
                        high ='red', 
                        labels = label_number_si()) +
  coord_map() +
  labs(title = 'Undergraduate enrollment', fill = 'Students')
