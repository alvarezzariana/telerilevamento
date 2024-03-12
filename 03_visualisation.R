#Satellite data visualisation in R by imageRy

library(terra)
library(imagineR)

#tutte le funzioni di imagineR iniziano con im.

#forniscela lista di tutti i contenuti del pacchetto 
im.list()  
#consente di utilizzare uno dei dati della lista
#in questo caso importazione di un immagine 

mato <- im.import("matogrosso_ast_2006209_lrg.jpg")

