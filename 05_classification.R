#quantifying land cover variability 

install.packages("ggplot2") #installazione 
#installato il pacchetto lo richiamo 

library(ggplot2)
library(imageRy)

#Lista images

im.list()

#importazione data
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
sun<- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #satellite del sole 

sunc <- im.classify(sun,num_clusters=3)

#mato grosso images
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import(" matogrosso_ast_2006209_lrg.jpg" ) 

#classfying images

m1992c <- im.classify(m1992,num_clusters=2)

#class 1= forest
#class 2= human

m2006c <- im.classify(m2006, num_clusters=2)
#class 1= forest
#class 2= human

#calculating frequncies

f1992<- freq(m1992c)
f1992

#per sapere il totale si utilizza la funzione ncell
tot1992 <- ncell(m1992c)  #si hanno 1800000

prop1992 = f1992/tot1992
prop1992





