library(maps)
library(ggplot2)
setwd("C:/Users/sweta/OneDrive - Emory University/Nadimpalli Lab")

Country<-c("Argentina","Australia","Austria","Denmark","Ecuador","Ethiopia","India","Iran","Madagascar","New Zealand","Nigeria","UK","USA","Vietnam")
Studies<-c("1","3-4","1","1","1","2","3-4","1","1","3-4","2","1",">20","1")
ses<-data.frame(Country,Studies)
world_map<-map_data("world")
world_map<-subset(world_map,region!="Antarctica")
ses$Studies<-factor(ses$Studies,levels=c("1","2","3-4",">20"))

splot<-ggplot(ses)+
  geom_map(
    dat = world_map, map= world_map, aes(map_id = region),
    fill = "white",color = "#7f7f7f",size = 0.25) +
  geom_map(map=world_map, aes(map_id = Country, fill = Studies), size = 0.25)+
  expand_limits(x=world_map$long, y = world_map$lat)+
  scale_fill_manual(values=c("#ffb3c6","#e18ca1","#c3657c","#863a4d"))+
  geom_label(
    label= c("USA","Ecuador","Argentina","Madagascar","Ethiopia","Iran","India","Denmark","Vietnam","Australia","New Zealand","Austria","Nigeria","United Kingdom"),
    x= c(-100,-94,-49,50,58,54.5,79,0,137,133,167,-17,-4,-25), y=c(38,-7,-43,-30,2,33,23,70,20,-25,-52,47,0,60), color = "black", fill=NA)+
  geom_segment(aes(x=-7, y=47.5, xend=10, yend=47.5), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  geom_segment(aes(x=0, y=67, xend=8, yend=57), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  geom_segment(aes(x=-10, y=57, xend=-5, yend=55), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  geom_segment(aes(x=126, y=20, xend=110, yend=17), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  theme(
    legend.position = c(.95, .67),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(5,5,5,5),
  )+
  theme_void()

splot