#Intro RStudio Toolkit, PHW272A

#Load necessary libraries
library(tidyverse)
library(sf)
library(ggmap)

#Load in the earthquake data

getwd()

dat <- read_csv("Intro/earthquake.csv")
head(dat)

#Select only needed variables
dat <- dat %>% select("time", "latitude", "longitude", "mag")
head(dat)

#Look at distribution of earthquake magnitudes
#base R
hist(dat$mag)

#ggplot
ggplot(data = dat) + geom_histogram(aes(x = mag)) +
  xlab("Earthquake Magnitude") +
  ylab("Count") +
  theme_minimal(base_size = 14)

#Basic map
map <- ggplot(dat, aes(x = longitude, y = latitude)) + geom_point() +
  theme_minimal()
map

#Add world map background
#Set your API Key
ggmap::register_google(key = "INSERT KEY HERE")
worldmap <- ggmap(get_stamenmap(bbox = c(left = -180, bottom = -80, right = 179.9999, top = 85), zoom = 3))
worldmap
worldmap + geom_point(data = dat, aes(x = longitude, y = latitude))
