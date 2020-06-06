#### Datos y librerias ####
rm(list = ls())
setwd("C:/Users/JGALLO/Desktop/Clase3R4DS")
library(dplyr)
# desarrollado por hadley Wikham (Rstudio)
# dplyr : gramatica para manipulacion de datos

#### cargar data : storms. pollutions. tb ####
storms <- read.csv("https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/storms.csv")
# Velocidades maximas de viento para 6 huracanes
# https://www.nhc.noaa.gov/

Pollution <- read.csv("https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/pollution.csv")
# Nivel promedio de la contaminacion del aire por particulas (ciudades de: NY, Londres y Berlin)
# https://www.who.int/phe/health_topics/outdoorair/en/

tb <- read.csv("https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/tb.csv")
# Numero de casos de tuberculosis : 1995 - 2013

#### Algunas funciones de dplyr #####
class(storms) # Se utiliza para saber que tipo es la variable
dim(storms)
head(storms,n = 2)
tail(storms, n =3)
colnames(storms) # Se utiliza para saber el nombre de las columnas del DF.
names(storms) # Se utiliza para saber el nombre de las columnas del DF.
str(storms) # Para listar las variables

# Es notorio que la variable $date es una variable que represente
# a la linea del tiempo
class(storms$date) # evidenciamos que la variable es de tipo caracter
storms$date <- as.Date(storms$date)# cambiamos la variable a tipo date (fecha)
storms$date <- as.factor(storms$date) # Para cambiar la variable a categorico

#### Funcion Select ####
# permite seleccionar columna(s) (2da dimension) de un DF.
# Seleccionar las variables "Storm" y  "presure"

help("select") # help Nos muestra toda la informacion 
select(storms, storm, pressure) # seleccionamos de la data Storm, la columan "storm" y la columna "presure"
select(storms, colnames(storms)[1], colnames(storms)[3])# tambien podemos utilizar colname para llamar a ambas columnas si sabemos su posicion de columnas

# Verifiquemos que el resultado es de tipo data frame
class(select(storms, storm, pressure)) 
select(storms, colnames(storms)[1], colnames(storms)[3])

# Utilizando la sintaxis matricial
storms[,c(1,3)]# filas ( ,)todas c(1,3) columnas 1 y 3

# Para excluir una columna utilizamos el operador (unario) : -
select(storms, -storm)

# Con notacion matricial
storms[,-1] # para excluir una columna
storms[,-c(1,3)] # para excluir varias columnas 

# Podemos utilizar la notacion : para seleccionar un rango de columnas
select(storms, wind:date) # desde la columna "wind" hasta "date"

# Utilizando los operadores : y - de forma conjunta hacer mas cosas
select(storms, -(storm:wind))

# Selecciona las columnas cuyo nombre contiene un patron
select(storms, starts_with("w"))

# Seleccionamos la columna cuyo nombre termina con la letra "e"
select(storms, ends_with("e"))

# Seleccionamos todas las columnas
select(storms, everything())

# Seleccionamos columnas cuyo nombre contiene un string
select(storms, contains("essur"))

# Algunas funciones de select son bastante utiles
# -
# :
# contains()
# star_with()
# ends_with()
# everything()

#### filter ####
# La funcion filter nos permite filtrar filas segun una condicion
filter(storms, wind >= 50) # Filtra todas las filas cuya variable "wind" es mayor a 50
filter(storms, wind >= 50, storm %in% c("Alberto","Alex","Allison"))# con wind indicamos el filtro luego indicamos la condicion

# Filtramos aquellas filas con wind>=50 y pressure<100
filter(storms, wind>=50 & pressure>100)

#### Arrange ####
# La funcion arrange() se utiliza para ordenar las filas de un data frame 
# de acuerdo a una o varias columnas (variables)
# Por defecto arrange ordena las filas por orden ascendente
# Para ordenar las filas por las variables "wind" de forma ascendente :
arrange(storms, wind)
# Para ordenar de forma descendente :
arrange(storms, desc(wind))

#### Rename #####
names(storms)

rename(storms, tormenta = storm, viento = wind, presion = pressure, fecha = date)

#### mutate ####
# Podemos computar, calcular transformaciones de las variables de un DF
# A menudo tendremos la necesidad de crear nuevas variables.
# que se calculan a partir de variables existentes, mutate() proporciona
# una interface para realizar este tipo de opreaciones.
# Deseo calcular una varibale ratio que sea definida como el cociente 
# Pressure (presion) y Wind (viento)
mutate(storms, ratio = pressure/wind)
StormsNuevo <- mutate(storms, ratio = pressure/wind) #guardamos en un Df la nueva variable ratio
# mutate nos permite encadenar varias expresiones
mutate(storms, ratio = pressure/wind, inverse = ratio^-1)
StormsNuevo <- mutate(storms, ratio = pressure/wind, inverse = ratio^-1)

mean(StormsNuevo$wind) # Obtenemos la media
summary(StormsNuevo) # obtenemos una stadistica descriptiva sencilla


#### Summarise ####
# funciona de forma analoga a la funcion mutate, excepto que en lugar de añadir nuevas
# columnas crea un data frame
# Por ejemplo para calcuar la mediana y la varianza de la variable amount del 
# data frame pollution

summarise(Pollution, mediana = median(amount), variance = var(amount))
class(summarise(Pollution, mediana = median(amount), variance = var(amount)))

#### Operador pipe ####
# El uso es bastante y basicamente sirve para concatenar expresiones
# de la gramatica de dplyr
Pollution %>% summarise(mediana2 = median(amount), varianza = var(amount))

# Funciones que trabajan conjuntamente con summarise
# base : min, max, median, mean, sum, var, sd.
# dplyr : first, last, n, n_distinct, nth

#### group by ####
Pollution
group_by(Pollution, city)
class(group_by(Pollution, city))

Pollution %>% group_by(city) %>% # nos crea un nuevo data frame con las columnas city media sum y n
  summarise(media = mean(amount), sum(amount), n = n())

Info <- Pollution %>% group_by(city) %>% # guardamos en DF INFO
  summarise(media = mean(amount), sum(amount), n = n())

class(Info)





































