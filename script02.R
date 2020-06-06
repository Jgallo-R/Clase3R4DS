#### Limpiamos memoria ####
rm(list = ls())

# Setear el directorio de trabajo
# setwd()
getwd()
dir()

#### cargar la data ####
library(ggplot)
library(ggplot2)
library(help = car)
library(help = carData)
data("Salaries")
str(Salaries) # para ver su estuctura
summary(Salaries)

#### Primeros pasos con ggplot2 ####
# Creacion del grafico : agregamos la data y configuramos las variables
ggplot(data = Salaries, aes(x= yrs.service , y = salary))

# Creamos un diagrama de dispersion
p <- ggplot(data = Salaries, aes(x= yrs.service , y = salary)) #capa de la data

p + geom_point()

# modificamos nuestro objeto p (lienzo vacio) : modificamos la estetica
p <- ggplot(data = Salaries, aes(x= yrs.service , y = salary, fill = sex))
p + geom_point()

# grafico 1
p + geom_point(shape = 25, size = 2.8)

# grafico 2
p + geom_point(aes(shape  = sex, col = sex), size = 3)

# grafico 3
# colores
p + geom_point(aes(shape  = sex, col = sex), size = 3) + 
  scale_shape_manual(values = c(4,21)) + 
  # scale_color_manual(values = c("red","#5C7B01")) + 
  # theme(legend.position = "left") 
  # theme(legend.position = "top")
  # theme(legend.position = "bottom")
  theme(legend.position = c(0.95, 0.9))

help(ggsave)
ggsave(filename = "Grafico3.png", width)

# Grafico 4
p + p + geom_point(aes(shape  = sex, col = sex), size = 3) + 
  scale_shape_manual(values = c(4,21)) + 
  theme(legend.position = c(0.95, 0.9))









