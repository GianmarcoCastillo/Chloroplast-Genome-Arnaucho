setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("Total_SSR_frequency.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)

df_long <- df %>% pivot_longer(cols=1:3,names_to = "Repeat Types",
                               values_to = "Repeat number")

df_long


ggbarplot(df_long, x = "Repeat Types", y = "Repeat number",
          fill = "Repeat Types",
          color = "black",
          palette = "jco",
          sort.val = "desc",
          sort.by.groups = FALSE,
          x.text.angle = 90)

p <- ggbarplot(df_long, x = "Repeat Types", y = "Repeat number",
               fill = "Repeat Types",
               color = "black",
               palette = "jco",
               sort.val = "desc",
               sort.by.groups = FALSE,
               x.text.angle = 90)


p + rotate_x_text(angle=49, hjust=0.45)
