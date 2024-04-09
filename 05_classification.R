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
#-------------#
#1992

f1992<- freq(m1992c)
f1992

#per sapere il totale si utilizza la funzione ncell
tot1992 <- ncell(m1992c)  #si hanno 1800000

prop1992 = f1992/tot1992
prop1992

#calcolo percentuale forest=83%  human=17%

perc1992= prop1992*100
#----------------#
#2006

f2006<- freq(m2006c)
f2006

#per sapere il totale si utilizza la funzione ncell
tot2006 <- ncell(m2006c)  #si hanno 7200000

#calcolo proporzioni 
prop2006 = f2006/tot2006
prop2006

#calcolo percentuale
perc2006=prop2006*100

#percentuali forest =45% human=55%
#----------------------#

#calcolo per 1992

#dataframe funzione che crea una dataframe
#prima colonna corrisponde a [forest,human] -> che sono testo

class <- c("forest","human")
y1992 <- c(83,17)
y2006 <- c(45,55)

#ora abbiamo 3 colonne, andiamo quindi a fare la tabella mediante la funzione dataframe

tabout <- data.frame (class,y1992,y2006)

#per vedere facciamo view(tabout)

#ggplot2 graphs

ggplot(tabout,aes (x=class,y=y1992, color=class)) + geom_bar(stat="identity",fill="white")
#lancio comando e vediamo il grafico con istogrammi, con foreste da un lato e human dall'altro. Si ha la dominanza delle foreste 

#Calcolo per 2006 
ggplot(tabout,aes (x=class,y=y2006, color=class)) + geom_bar(stat="identity",fill="white")

#perte umana supera le foreste 

#------#

#ora mettiamo tutto insieme tramite l'installazione del pacchetto patchwork

install.packages("patchwork")
library(patchwork)

#riassegnano ad un oggetto 

p1 <- ggplot(tabout,aes (x=class,y=y1992, color=class)) + geom_bar(stat="identity",fill="white")
p2 <- ggplot(tabout,aes (x=class,y=y2006, color=class)) + geom_bar(stat="identity",fill="white")

p1+p2

#se vediamo i due grafici, vediamo che hanno scala diversa per cui sarebbe errato mostrarlo.Per correggere questo basta utilizzare ylim 

p1 <- ggplot(tabout,aes (x=class,y=y1992, color=class)) + geom_bar(stat="identity",fill="white"+ ylim(c(0,100))
p2 <- ggplot(tabout,aes (x=class,y=y2006, color=class)) + geom_bar(stat="identity",fill="white"+ ylim(c(0,100))
#ora vediamo bene i grafici, vediamo come la foresta sia diminuita, 
                                                    
                                                                   












