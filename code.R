### CODE FOR FLOWMAP>BLUE ####

library(dplyr)

loc <- read.csv("port_info.csv")
data <- read.csv("data_1.csv")

merged <- merge(loc, data, by = "From")
#write.csv(merged, "from_data.csv")

from_data <- read.csv("from_data.csv")

from_data2 <- from_data %>% 
  group_by(From, From_ID, Long, Lat, Place_ID, To, Year) %>% 
  summarise(x = sum(Count))

merged <- merge(loc, from_data2, by = "To")
#write.csv(merged, "to_data.csv")

-------------------------------------------------

### CODE FOR R ###

#devtools::install_github("FlowmapBlue/flowmapblue.R")
library(flowmapblue)

locations <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/data/locations.csv')
flows <- read.csv('https://raw.githubusercontent.com/wandabodnar/flowmap/master/data/flows.csv')
mapboxAccessToken <- 'pk.eyJ1Ijoid2FuZGFib2RuYXIiLCJhIjoiY2tjbG4xd3p0MjRwcDJycGZ0YWpqcjVobCJ9.3U_AmR38W__wuBjUjqWC3Q'
flowmapblue(locations, flows, mapboxAccessToken, clustering = FALSE, darkMode = TRUE, animation = TRUE)
