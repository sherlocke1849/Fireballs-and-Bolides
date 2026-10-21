#2. Latitude grouped into 6 categories
##in order to practice working with geographic/spatial data, I sorted the data into six 
#arbitary categories of equal latitudinal range. 
#Then I summarized the data, which supports existing data that suggests that 
#fireballs are more commonly recorded near the equator (more on this in the full report). 


#Division of latitude 
##RANGE: 86.7N - 75.45S
#Group 1: 86.7N-59.67N
#Group 2: 59.68N - 32.65N
#Group 3: 32.66N - 5.64N
#Group 4: 5.64 - 21.39S
#Group 5: 21.4S - 48.43S
#Group 6: 48.44S - 75.47

library(dplyr)
fireballs %>% 
  mutate(lat_level = cut(
    `Latitude (Deg)`, 
    breaks = c(-76, -48.44, -21.4, 5.64, 32.66, 59.68, 86.7),
    labels = c("zone 1", "zone 2", "zone 3", "zone 4", "zone 5", "zone 6")
  )
  )
fireballs <- fireballs %>% mutate(lat_level = cut(
  `Latitude (Deg)`, 
  breaks = c(-76, -48.44, -21.4, 5.64, 32.66, 59.68, 86.7),
  labels = c("zone 1", "zone 2", "zone 3", "zone 4", "zone 5", "zone 6")
)
)
#3. Latitude groups ranked by number of incidents 

summary(fireballs$lat_level)
#zone 1 zone 2 zone 3 zone 4 zone 5 zone 6 
#11     22     29     11     13      6 

##a visualization of the above operations :) 

world <- map_data("world")

ggplot() +
  geom_polygon(data = world, aes(x = long, y = lat, group = group),
               fill = "grey90", colour = "black") + geom_hline(yintercept = c(-76, -48.44, -21.4, 5.64, 32.66, 59.68, 86.7), linetype = "dashed") + geom_point(data = fireballs,
                                                                                                                                                               aes(x = `Longitude (Deg)`, y = `Latitude (Deg)`, colour = lat_level)) + coord_fixed() 
