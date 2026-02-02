library(tidyverse)
library(readr)
Flights <- read_csv("datasets/StudentData_RegionEx.csv")
View(Flights)

Flights %>%  filter(`Actual arrival time`!='Cancelled' ) %>%  group_by(Airline) %>% summarise(
  count = n()    ,
  mean_delay = mean(as.numeric(`Arrival delay in minutes`)),
  median_delay = median(as.numeric(`Arrival delay in minutes`)),
  delay_90th_percentaile = quantile(as.numeric(`Arrival delay in minutes`),probs = c(.9)),
  stdev_delay =sqrt(var(as.numeric(`Arrival delay in minutes`)))
)



RXFlights<-Flights %>% filter(Airline=="RegionEx")

ggplot(RXFlights, aes(x=as.numeric(`Arrival delay in minutes`) )) + geom_histogram()
