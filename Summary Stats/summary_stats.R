#Summary Stat Toolkit
library(tidyverse)

air <- read_csv("Summary Stats/pm25_daily_average_ct_pp_v3.csv")
                 
head(air)
table(air$eia_id)

#Subset data to only include power plant #383
air2 <- filter(air, eia_id==383)       
          
#Summary stats
mean(air2$pm25ugm3)
sd(air2$pm25ugm3)
summary(air2$pm25ugm3)
                 
#Boxplot of pm2.5 data
ggplot(air2, aes(x=1, y=pm25ugm3)) + geom_boxplot() + scale_y_log10()
                 
#Histogram
ggplot(air2, aes(x=pm25ugm3)) + geom_histogram(binwidth = 1, color = "red") + ylab("Number of observations")


ggplot(air, aes(x=pm25ugm3)) + geom_histogram(binwidth = 1, color = "red") + ylab("Number of observations") +
  facet_wrap(~eia_id) + theme_bw()
