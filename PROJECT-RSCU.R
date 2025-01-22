library(ggplot2)
library(tidyverse) # Tidyverse to manipulate data
#install.packages("patchwork")
library(patchwork) # Patchwork to arrange plots

# Example Data
dat=data.frame(Codon=c("UUU","UUA","UUG","CUU","AUU","GUU","GUA","UCU","UCC","UCA","CCU","CCA","ACU","ACC","ACA","GCU","GCA","UAU","CAU","CAA","AAU","AAA","GAU","GAA","UGU","CGA","AGA","AGG","GGA","GGG"),
               RSCU=c(1.19,1.30,1.23,1.26,1.31,1.38,1.20,1.50,1.13,1.17,1.11,1.21,1.23,
                      1.02,1.13,1.27,1.22,1.36,1.37,1.40,1.41,1.35,1.42,1.37,1.25,1.08,1.97,1.07,
                      1.37,1.02),AA=c("Phe","Leu","Leu","Leu","Ile","Val","Val","Ser","Ser","Ser","Pro","Pro","Thr","Thr","Thr","Ala","Ala","Tyr","His","Gln","Asn","Lys","Asp","Glu","Cys","Arg","Arg","Arg","Gly","Gly"))
# Create a column for fill colour
dat$Col=1
# This populates the Col column with unique values for each codon coding an amino. Each value is a color, therefore all aminos will share the same values but the codons will be different.
dat=dat %>% group_by(AA) %>% mutate(Col = lag(cumsum(Col), default = 0)) %>% mutate(Col =as.factor(Col))
# Create bar plot
p0=ggplot(data=dat, aes(x=AA, y=RSCU, fill=Col))+geom_bar(stat='identity')+theme_minimal()+theme(axis.title.x=element_blank(),legend.position="top")+
  theme_test()+
  theme(legend.position = "none",
        axis.text.x = element_text(angle=45, hjust=1))
# Create tile plot
p1=ggplot(data=dat)+geom_tile(aes(x=AA, y=fct_rev(Col),fill=Col),col="black")+geom_text(aes(x=AA, y=Col,label=Codon),col="white", fontface = "bold") +theme_void()+theme(legend.position="none")

#Combine both plots in a single plot
p=p0/p1

#Set plot size. The ratio here is 7:1. The bar plot is 7 times the height of the tile plot
p=p+plot_layout(heights = c(7, 1.3))
p

ggsave("ArnauchoSupano.pdf",p)

