#### limpiamos la memoria ####
rm(list = ls())
# setear directorio de trabajo
setwd("C:/Users/JGALLO/Desktop/Clase3R4DS")
dir()


#### Cargar la data ####
library(ggplot)
library(ggplot2)
library(car)
library(carData)
data("Salaries")

str(Salaries)
summary(Salaries)

# Grafico 1
ggplot(Salaries, aes(x = salary))# veremos la densidad demla data

ggplot(Salaries, aes(x = salary , y = ..density..))+
  geom_histogram(colour = 'grey60' , fill = 'cornsilk')+
  geom_density(colour = NA , fill = "blue" , alpha = 0.1)+
  geom_line(stat = "density" , colour = "red")+
  xlim(45000, 250000)

# //////////////////////////////////////////////////////////////////
# Los intervalos de clase
Hs <- hist(Salaries$salary)
Hs$breaks[2] - Hs$breaks[1] # longitud del intervalo de clase
Hs$counts

hist(Salaries$salary,breaks = seq(40000, 240000, 15*1000 ))

Hs2 <- hist(Salaries$salary,breaks = seq(40000, 240000, 8*1000 ))
# Hs2$breaks
bwidth <- Hs2$breaks[2] - Hs2$breaks[1]

ggplot(Salaries, aes(x = salary , y = ..density..))+
  geom_histogram(binwidth = bwidth, colour= 'grey60' , fill = 'cornsilk')+
  geom_density(colour = NA , fill = "blue" , alpha = 0.1)+
  geom_line(stat = "density" , colour = "red")+
  xlim(45000, 250000)



# //////////////////////////////////////////////////////////////////

















