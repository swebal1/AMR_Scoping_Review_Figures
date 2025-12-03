library(maps)
library(ggplot2)
setwd("C:/Users/sweta/OneDrive - Emory University/Nadimpalli Lab")

Country<-c("Australia","Brazil","Israel","New Zealand","USA")
Studies<-c("3","1","4-7","4-7",">45")
race<-data.frame(Country,Studies)
world_map<-map_data("world")
world_map<-subset(world_map,region!="Antarctica")
race$Studies<-factor(race$Studies,levels=c("1","3","4-7",">45"))
  
rplot<-ggplot(race)+
  geom_map(
    dat = world_map, map= world_map, aes(map_id = region),
    fill = "white",color = "#7f7f7f",size = 0.25
  ) +
  geom_map(map=world_map, aes(map_id = Country, fill = Studies), size = 0.25)+
  expand_limits(x=world_map$long, y = world_map$lat)+
  scale_fill_manual(values=c("#ffb3c6","#e18ca1","#c3657c","#863a4d"))+
  geom_label(
    label= c("United States","Brazil", "Israel","Australia","New Zealand"),
    x= c(-100,-50,63,133,175), y=c(38,-10,10,-25,-50), color = "black", fill=NA, size=5.5)+
  geom_segment(aes(x=63, y=13, xend=35, yend=32), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  theme_void()+
  theme(
  legend.position = c(.95, .67),
  legend.justification = c("right", "top"),
  legend.box.just = "right",
  legend.margin = margin(5,5,5,5),
  legend.title = element_text(size=16),
  legend.text = element_text(size=14))

rplot
ggsave(filename="Race Map Plot PDF Updated 7-23-25.pdf",width=20,height=10)


#######################

Country<-c("Australia","Brazil","Israel","New Zealand","USA")
Studies<-c("2","1","6","5","45")
race<-data.frame(Country,Studies)
world_map<-map_data("world")
world_map<-subset(world_map,region!="Antarctica")
race$Studies<-factor(race$Studies,levels=c("1","2","5-6",">20"))

rplot<-ggplot(race)+
  geom_map(
    dat = world_map, map= world_map, aes(map_id = region),
    fill = "white",color = "#7f7f7f",size = 0.25
  ) +
  geom_map(map=world_map, aes(map_id = Country, fill = Studies), size = 0.25)+
  expand_limits(x=world_map$long, y = world_map$lat)+
  scale_fill_gradient()+
  geom_label(
    label= c("United States","Brazil", "Israel","Australia","New Zealand"),
    x= c(-100,-50,63,133,175), y=c(38,-10,10,-25,-50), color = "black", fill=NA )+
  geom_segment(aes(x=63, y=13, xend=35, yend=32), arrow = arrow(length=unit(.2, 'cm')),
               color='black', lwd=0.6)+
  theme_void()+
  theme(
    legend.position = c(.95, .67),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(5,5,5,5)
  )
rplot
#######################


#SES map (no gradient)
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
  scale_fill_manual(values=c("darkcyan","deeppink","darkorchid","chartreuse3"))+
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

#SES map (with gradient)

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
ggsave(filename="SES Map Plot Final PDF.pdf",width=17,height=10)
