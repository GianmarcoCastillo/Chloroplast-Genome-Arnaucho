setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("SSR_Comparation.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)
library(dplyr)

df_long <- df %>% pivot_longer(cols=1:14,names_to = "Capsiceae",
                               values_to = "Total number of SSRs")


ggbarplot(df_long, x ="Capsiceae",y= "Total number of SSRs",
           group = "Capsiceae", color = "red",
           palette = c("orange"),
           sorting = "ascending",
           add = "segments",
           axis.text.x = element_text(angle=45, hjust=1.12),
           ggtheme = theme_pubr()
)


ggbarplot(df_long, x = "Capsiceae", y = "Total number of SSRs",
          fill = "Capsiceae",
          color = "black",
          palette = "jco",
          sort.val = "desc",
          sort.by.groups = FALSE,
          x.text.angle = 35)+
  theme(legend.position = "none")+
  geom_bar(stat = "identity",
           color = "#050505",
           lwd = 0.8, fill = "#FF8C69")+
  coord_flip()


p <- ggbarplot(df_long, x = "Capsiceae", y = "Total number of SSRs",
               fill = "Capsiceae",
               color = "black",
               palette = "jco",
               sort.val = "desc",
               sort.by.groups = FALSE,
               x.text.angle = 0)+
  theme(legend.position = "none")+
  geom_bar(stat = "identity",
           color = "#050505",
           lwd = 0.3, fill = "#3A5FCD")+
  coord_flip()

p



