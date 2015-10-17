require(tidyr)
require(dplyr)
require(ggplot2)
require(plyr)


Table1_df <- dplyr::inner_join(YL, PG, by= c("TIME_PERIOD", "REFERENCE_AREA")) 

Plot1_df <- Table1_df %>% filter(TIME_PERIOD  <= 2010, SEX.x != "All genders" )

ggplot() +
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title="All Countries pre-2010") +
  labs(x="Percent of GDP Spent on Education", y="Youth Literacy rate", color="Sex") +
  theme_stata() +
  layer(data=Plot1_df , 
        mapping=aes(x=as.numeric(OBSERVATION_VALUE.y), y=as.numeric(OBSERVATION_VALUE.x), color = as.character(SEX.x)), 
        stat="identity",
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.0, height=0.0)
  )
