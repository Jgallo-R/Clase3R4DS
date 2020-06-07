#### Limpiamos memoria ####
rm(list = ls())

# Setear el directorio de trabajo
# setwd()
getwd()
dir()

#### cargar la data ####
library(ggplot)
library(ggplot2)
library(car)
library(carData)
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
p + geom_point(aes(shape  = sex, col = sex), size = 3) + 
  scale_shape_manual(values = c(4,21)) + 
  scale_color_manual(values = c("red", "#5C7A54")) +
  #theme(legend.position = "rigth") +
  theme(legend.background = element_rect(fill = "#A2AFC9",
                                         colour = "darkblue",
                                         linetype = "dashed"))

# modificar componentes de un theme
#https://ggplot2.tidyverse.org/reference/theme.html


# Grafico 5
Graph5 <- p + geom_point(aes(shape  = sex, col = sex), size = 3) + 
  scale_shape_manual(values = c(4,21)) + 
  scale_color_manual(values = c("red", "#5C7A54")) +
  #theme(legend.position = "rigth") +
  theme(legend.background = element_rect(fill = "#A2AFC9")) +
  scale_y_continuous(labels = scales::scientific)
                                        
# Grafico 6
Graph5 + geom_smooth()
ggsave(filename = "grafico6_GeomSmmoth.png")

# Grafico 7
Graph5 + geom_smooth(method = "lm", formula = y ~ poly(x,3))

# Grafico 8
Graph5 + geom_smooth(method = "lm", formula = y ~ poly(x,3)) +
  facet_grid(~sex)# con esta grafica separamos por sub graficas por sexo

# Grafico 9
help("Salaries")

p1 <- ggplot(data = Salaries, aes(x = yrs.service, y = salary , colour = rank))

p1 + geom_point()

p1 + geom_point()+
  geom_smooth(aes(group = rank) , method = "lm", color = "black", size = 0.5)+
  facet_grid(~sex)

# Grafico 10
p1 <- ggplot(data = Salaries, aes(x = yrs.service, y = salary , file = rank))
p1 + geom_point(shape = 21) +
  geom_smooth(method = "lm",
              color = "black",
              size = 0.5,
              se = FALSE)+
  facet_grid(~sex)

library(gridExtra)

# Grafico 11
Plt1 <- ggplot(Salaries, aes(x = rank)) + geom_bar()
Plt2 <- ggplot(Salaries, aes(x = sex)) + geom_bar()
Plt3 <- ggplot(Salaries, aes(x = yrs.service, y = salary)) + geom_point()
grid.arrange(Plt1,Plt2,Plt3, ncol = 3)














