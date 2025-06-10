
# sintaxis de ggplot2: clase 1
library(ggplot2)

data("iris")
str(iris)

unique(iris$Species)
levels(iris$Species)

# sintaxis de ggplot2

# 1. crear el sistema de coordenadas (canvas)
# ggplot(data.frame)
g1 <- ggplot(iris)

# 2. agregar la geometria (tipo de grafico)
# geom_nombregeometria(aes())

# 3. indicar las variables usando la funcion aes()
# aes(x, y), aes(x), x es el nombre de la variable tal cual
# figura en el dataframe
# siempre aes va adentro de la geom

g1 + geom_histogram(aes(Petal.Length))

# en aes() tmb mapeamos variable con atributo visual
# color, forma, tamanio, transparencia
# aes(x, y, atributo = variable)

g1 + geom_histogram(aes(Petal.Length, fill = Species))

# scatterplot (grafico de dispersion, o puntos)
g1 + geom_point(aes(Sepal.Width, Sepal.Length)) # aes(x, y)

g1 + geom_point(aes(Sepal.Width, Sepal.Length,
                    size = Species))

# boxplot (diagrama de cajas)
g1 + geom_boxplot(aes(Petal.Width))
g1 + geom_boxplot(aes(, Petal.Width))
g1 + geom_boxplot(aes(y = Petal.Width)) # aes(y = var1, x = var2)

g1 + geom_boxplot(aes(Species, Petal.Width))

# agregamos "muescas" (notch) en cada boxplot
g1 + geom_boxplot(aes(Species, Petal.Width),
                  notch = TRUE)

# argumentos de mismo nombre pero diferente aplicacion
# pueden ir en aes o en la geom
# por ejemplo, el color
g1 + geom_boxplot(aes(Species, Petal.Width, colour = Species))
g1 + geom_boxplot(aes(Species, Petal.Width), colour = "blue")

# scales: customizar los atributos visuales mapeados con aes()
# la sintaxis es scale_****_funcion, por ejemplo scale_shape_manual()
g1 + geom_boxplot(aes(Species, Petal.Width, colour = Species)) +
  scale_colour_manual(values = c("chocolate", "green", "cyan"))
