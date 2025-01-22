setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("REPETITIVES-SEQ.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)

df_long <- df %>% pivot_longer(cols=2:15,names_to = "Species",
                               values_to = "Number Repetitives")

df_long

p <- ggballoonplot(df_long, x = "Species", y = "Number Repetitives",
                   fill = "Sequences Repetitives",
                   color = "white",
                   palette = "jco",
                   sort.val = "desc",
                   sort.by.groups = TRUE,
                   x.text.angle = 45)

p


p <- ggballoonplot(df_long, x = "Species", y = "Number Repetitives",
                   fill = "Sequences Repetitives",
                   color = "white",
                   palette = "jco",
                   sort.val = "desc",
                   sort.by.groups = TRUE,
                   x.text.angle = 45)

p
