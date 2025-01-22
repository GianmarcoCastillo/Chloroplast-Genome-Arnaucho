setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("Motif_SRR.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)

df_long <- df %>% pivot_longer(cols=1:5,names_to = "Motif",
                               values_to = "Repeat number")

df_long


ggbarplot(df_long, x = "Motif", y = "Repeat number",
          fill = "Motif",
          color = "black",
          palette = "jco",
          sort.val = "desc",
          sort.by.groups = FALSE,
          x.text.angle = 90)

p <- ggbarplot(df_long, x = "Motif", y = "Repeat number",
               fill = "Motif",
               color = "black",
               palette = "jco",
               sort.val = "desc",
               sort.by.groups = FALSE,
               x.text.angle = 90)


p + rotate_x_text(angle=49, hjust=0.45)
