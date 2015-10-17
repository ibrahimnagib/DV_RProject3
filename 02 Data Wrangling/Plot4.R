require(tidyr)
require(dplyr)
require(ggplot2)
require(plyr)
require(ggthemes)
# Move data into new data frame for Plot 1

Table4_df <- dplyr::inner_join(YL, PG, by= c("TIME_PERIOD", "REFERENCE_AREA")) 

Plot4_df <- Table4_df %>% filter(OBSERVATION_VALUE.x  <= 50, SEX.x != "All genders", TIME_PERIOD <= 2000 )

ggplot() +
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~RESTAURANT) +
  labs(title="Male Vs Female Youth Literacy rates (Countries below 50%)") +
  labs(x="Time Period", y="Youth Literacy Rate", color="Sex") +
  theme_stata()+
  layer(data=Plot4_df , 
        mapping=aes(x=as.numeric(TIME_PERIOD), y=as.numeric(OBSERVATION_VALUE.x), color = as.character(SEX.x)), 
        stat="identity",
        stat_params=list(), 
        geom="bar",
        geom_params=list( fill="red", alpha=0),
        #geom_params=list(), 
        position=position_jitter(width=0.2, height=0)
  )
