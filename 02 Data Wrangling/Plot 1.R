require(tidyr)
require(dplyr)
require(ggplot2)
require(plyr)

# Move data into new data frame for Plot 1

Plot1_df <- dplyr::inner_join(YL, PG, by= c("TIME_PERIOD", "REFERENCE_AREA")) 

# # Need to relabel the data in the Education column
# Plot1_df$RESTAURANT <- factor(Plot1_df$RESTAURANT, levels=c("m", "b", "p", "t","w", "j", "h", "c", "i", "k"), labels = c("McDonald's", "Burger King", "Pizza Hut", "Taco Bell", "Wendy's", "Jack In The Box", "Hardee's", "Carl's Jr.", "In-N-Out", "KFC")) 

 Plot1_df <- Plot1_df %>% filter(TIME_PERIOD  <= 1995, SEX.x == "All genders" )
# 
# test_df <- ddply(Plot1_df,~ZIP, summarise,Total_Restaurants=length(RESTAURANT))
# Plot1_df <- dplyr::left_join(Plot1_df,test_df, by="ZIP")
# Plot1_df <- Plot1_df %>% select(ZIP, MEDIAN, Total_Restaurants)

ggplot() +
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~RESTAURANT) +
  labs(title="PLOT 1") +
  labs(x="X", y="Y", color="REFERENCE_AREA") +
  layer(data=Plot1_df , 
        mapping=aes(x=as.numeric(OBSERVATION_VALUE.y), y=as.numeric(OBSERVATION_VALUE.x), color = as.character(REFERENCE_AREA)), 
        stat="identity",
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.0, height=0)
  )
