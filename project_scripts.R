library(tidyverse)
library(readr)
anthesis_biomass <- read_csv("data/anthesis_biomass.csv")
View(anthesis_biomass)

yield_2019 <- read_csv("data/yield_2019.csv")

combined_data <- left_join(yield_2019,anthesis_biomass)

clean_combined_data <- select(combined_data,1,2,3,4,5,6,7,8)


ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=anthesis_biomass,y=plot_yield))


ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=line,y=plot_yield, colour=rep))

ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=plant_ht,y=anthesis_biomass), colour="blue")

clean_combined_data <- write_csv(clean_combined_data,"data/clean_combined_data.csv")

ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=oct_av_canopy_score,y=anthesis_biomass), colour="red")

ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=oct_av_canopy_score,y=anthesis_biomass,colour=rep))

ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=oct_av_canopy_score,y=plot_yield,colour=rep))


yield_2019 <- read_csv("data/yield_2019.csv", 
                       col_types = cols(flowering_das = col_integer(), 
                                        rep = col_integer()))
clean_combined_data %>% 
  filter(oct_av_canopy_score<=2,peduncle_length>=18)
 
ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=flowering_das,y=anthesis_biomass,colour="red"))

ggplot(data = clean_combined_data)+
  geom_point(mapping = aes(x=flowering_das,y=plot_yield,colour="red"))

summarise(clean_combined_data,
         mean_plant_ht=mean(plant_ht),
         max_yield=max(plot_yield),
         sd_plant_ht=sd(plant_ht),
         min_yield=min(plot_yield),
         mean_yield=mean(plot_yield)
          )
data_by_line <- group_by(clean_combined_data,line)

data_by_yield <- group_by(clean_combined_data,plot_yield)

arrange(clean_combined_data,flowering_das)

arrange(clean_combined_data,desc(flowering_das))

summarise(clean_combined_data, se_yield = sd(plot_yield) / sqrt(n()))

filter(clean_combined_data,plot_yield>=641)

glimpse(clean_combined_data)             

summary(clean_combined_data)
