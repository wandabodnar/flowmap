### CODE FOR FLOWMAP>BLUE ####

library(dplyr)
setwd("~/Flowmap/Tube")

stations <- read.csv("Stations.csv")
from <- read.csv("From.csv")

merged <- merge(stations, from, by = "Station")
write.csv(merged, "from_data.csv")

from_data <- read.csv("from_data.csv")

from_data2 <- from_data %>% 
  group_by(From, To) %>% 
  summarise(x = sum(Count))

stations <- read.csv("Stations.csv")
from_data <- read.csv("from_data.csv")

merged <- merge(stations, from_data, by = "Station")
write.csv(merged, "to_data.csv")

to_data <- read.csv("to_data.csv")

to_data2 <- to_data %>% 
  group_by(From, To) %>% 
  summarise(x = sum(Count))

write.csv(to_data2, "to_data2.csv")

-------------------------------------------------

### CODE FOR R ###

#devtools::install_github("FlowmapBlue/flowmapblue.R")
library(flowmapblue)

locations <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/data/locations.csv')
flows <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/data/flows.csv')
mapboxAccessToken <- 'token'
flowmapblue(locations, flows, mapboxAccessToken, clustering = FALSE, darkMode = TRUE, animation = TRUE)
