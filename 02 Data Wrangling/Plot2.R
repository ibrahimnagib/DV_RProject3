require(tidyr)
require(dplyr)
require(ggplot2)
require(plyr)

Table2_df <- plyr::outer_join(YL, PG, by= c("TIME_PERIOD", "REFERENCE_AREA")) 

Plot2_df <- Table2_df %>% filter(SEX.x != "All genders",REFERENCE_AREA %in% c("Burkina Faso", "Mali", "Guinea", "Bangladesh", "Egypt", "Senegal", "Central African Republic", "Rwanda", "Burundi", "Cameroon", "Morocco", "Togo"))
#filter(REFERENCE_AREA == "Chad", "Niger", SEX.x == "All genders" )

ggplot() +
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_wrap(~REFERENCE_AREA) +
  #facet_grid(~TIME_PERIOD)+
  labs(title="Underdeveloped and Developing African Countries") +
  labs(x="Percent GDP Spent on Education", y="Youth Literacy Rate", color="Sex") +
  theme_stata() +
  layer(data=Plot2_df , 
        mapping=aes(x=as.numeric(OBSERVATION_VALUE.y), y=as.numeric(OBSERVATION_VALUE.x), color = as.character(SEX.x)), 
        stat="identity",
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.0, height=0)
  )
