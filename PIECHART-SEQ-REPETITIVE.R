setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("Seq_Repetitive.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)
library(tidyverse)
library(ggsci)

df_long <- df %>% pivot_longer(cols=2:5,names_to = "Repetitive seq",
                               values_to = "Repeat motif")

ggpie(df_long, "Repeat motif", label = "Repetitive seq",
      fill = "Repetitive seq", color = "black",
      palette = c("#1E90FF", "#AB82FF","#CAFF70","#FFA500"))


ggpie(df_long, "Repeat motif", label = "Repetitive seq",
      fill = "Repetitive seq", color = "black",
      palette = c("#1E90FF", "#AB82FF","#CAFF70","#FFA500"))+
  theme(legend.position = "bottom")


ggsave("PIECHART-FINISH.png")
