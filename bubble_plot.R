setwd("C:/Users/sweta/OneDrive - Emory University/Nadimpalli Lab")
library(readxl)
library(ggplot2)
library(dplyr)
library(ggtext)
library(glue)
library(tidyverse)
race<-read_excel("AMR_race_ethnicity_bubble_plot_02.26.2025.xlsx")

colors = c("yellow3",  "#0099CC", "#CC3300","#00CC33","purple", "deeppink","orange")
names(colors) <- levels(race$Race)
levels(as.factor(race$Race))
race$Race<-factor(race$Race,levels=c("Middle Eastern","Maori, Aboriginal, Pacific Islander","Bedouin","Asian","Hispanic race","Hispanic ethnicity","Black"))
race$Strains<-factor(race$Strains,levels=c("MRSA or Staphylococcus aureus","Escherichia coli","SSTI","UTI","Pseudomonas aeruginosa","Enterobacterales","Enterococcus faecium","Klebsiella pneumoniae"))
strain=c("MRSA or <br>*Staphylococcus aureus*","<br>*Escherichia coli*","SSTI","UTI","<br>*Pseudomonas aeruginosa*","Enterobacterales","<br>*Enterococcus faecium*","<br>*Klebsiella pneumoniae*")

x = ggplot(race, aes(x = Strains, y = Race)) + 
  geom_point(aes(size = Comparisons, fill = Race), alpha = 0.75, shape = 21) + 
  scale_size_continuous(limits = c(0.000001, 75), range = c(1,40), breaks = c(1,15,29)) + 
  theme(title=ggtext::element_markdown())+
  guides(size = guide_legend(title="Number of Comparators"),fill="none")+
  theme(legend.key=element_blank(), 
        axis.text.x = element_markdown(colour = "black", size = 15, face = "bold", angle =50, vjust = 0.85, hjust = 0.75), 
        axis.text.y = element_text(colour = "black", face = "bold", size = 15), 
        legend.text = element_text(size = 15, face ="bold", colour ="black"), 
        legend.title = element_text(size = 15, face = "bold"), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1.2), 
        legend.position = "right",
        axis.title.x = element_blank(),
        axis.title.y = element_blank())+
  scale_fill_manual(values = colors) + 
  scale_x_discrete(labels = strain)+
  labs(xlab="",ylab="")
x

ggsave(filename="Race Bubble Plot PDF 2-28-25.pdf",width=15,height=10)
