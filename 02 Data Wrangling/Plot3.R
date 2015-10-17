require(tidyr)
require(dplyr)
require(ggplot2)
require(plyr)

Table3_df <- dplyr::full_join(YL, PG, by= c("TIME_PERIOD", "REFERENCE_AREA")) 

Plot3_df <- Table3_df %>% filter(TIME_PERIOD  >= 2000 & TIME_PERIOD <= 2012, SEX.x == "All genders" )

ggplot() +
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_wrap(~TIME_PERIOD) +
  labs(title="Literacy Rate Growth Over Time vs Education Spending") +
  labs(x="Percent of GDP Spent on Education", y="Youth Literacy rate", color="Country") +
  theme_stata()+
  layer(data=Plot3_df , 
        mapping=aes(x=as.numeric(OBSERVATION_VALUE.y), y=as.numeric(OBSERVATION_VALUE.x), color = as.character(REFERENCE_AREA)), 
        stat="identity",
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.0, height=0)
  )
