setwd("/home/marcos/Escritorio/CLOROPLASTO-ARNAUCHO-PEPPER/")

library(readxl)

df <- read_xlsx("MEGA-result3.xlsx")

head(df)
dim(df)
library(tidyr)

df_long <- df %>% pivot_longer(cols= 2:15,names_to = "Capsiceae",
                               values_to = "Distance")

dim(df_long)
head(df_long)

###install.packages("ggrain")
library(ggplot2)
library(ggrain)

ggplot(df_long,aes(Capsiceae, Distance))+
  geom_rain()



ggplot(df_long,aes(Capsiceae, Distance, fill=Capsiceae))+
  geom_rain()+
  theme_test()+
  theme(axis.text.x = element_text(angle=45, hjust=1.2))



ggplot(df_long,aes(Capsiceae, Distance, fill=Capsiceae))+
  geom_rain()+
  theme_test()+
  theme(legend.position = "none",
        axis.text.x = element_text(angle=45, hjust=1.12))

