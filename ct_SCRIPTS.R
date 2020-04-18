library(tidyverse)
view(mtcars)

heatmap(as.matrix(mtcars)
,scale="column"
,col=heat.colors(256)
,main="Characteristics of Car Models"
,Rowv = NA
,Colv 

library(tidyverse)
BUNYIP_15 <- read_csv("BUNYIP_CT_15.csv")
BUNYIP_15

heatmap(as.matrix(BUNYIP_15)
        ,scale = "column"
        ,main = "Average Canpy Temperature of BUNYIP 2015"
        ,Rowv = NA
        ,Colv = NA
        )

library(readxl)
GES_2019 <- read_excel("GES_HI2019.xlsx")
GES_2019

GES_data2019 <- select(GES_2019, 4, 5, 6, 7)
GES_data2019
GES_data_line <- group_by(GES_data2019,line)
GES_data_line

ggplot(data = GES_data2019)+
        geom_point(mapping = aes(x=line,y=grain_wt,colour=line))


        

