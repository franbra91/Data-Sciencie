# install.packages("patchwork")

# cargamos las librerias
library(patchwork)
library(ggplot2)

# cargamos el dataset
data("iris")

str(iris)

# armamos los graficos con ggplot2
# ggplot(dataframe) + geom_nombre(aes(x, y))

histogram <- ggplot(iris) + geom_histogram(aes(
  Petal.Width, fill = Species
))

puntos <- ggplot(iris) + geom_point(
  aes(
    Sepal.Length, Sepal.Width,
    colour = Species
  )
)

barras <- ggplot(iris) + geom_bar(
  aes(
    Species
  )
)

ggplot(iris) + geom_bar(
  aes( # aes(x, y)
    Species, Petal.Length
  ), stat = "Identity"
)

max(iris$Petal.Length)

datos <- data.frame(
  Categoria = c("A", "B", "C", "D"),
  Valor = c(30, 20, 15, 35)
)

grafico_torta <- ggplot(iris, aes(x = "", y = Petal.Length, fill = Species)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  theme_void() +
  labs(title = "Gráfico de Torta")

sum(iris$Petal.Length[iris$Species == "setosa"]) / length(iris$Petal.Length[iris$Species == "setosa"])

# patchwork: tableros estaticos
# (graf1 + graf2) graficos uno al lado del otro
# graf1 / graf2, graficos uno encima del otro
# graf1 | graf2, graf2 queda en una columna nueva

(histogram + grafico_torta) / puntos

histogram / grafico_torta / puntos

histogram / puntos | grafico_torta

grafico_torta / puntos | histogram

# # # # # # # # # # # # # # # # # # # # # # # # # # #

# edicion grafica con ggplot2

puntos

# edicion y agregado de texto
puntos <- puntos + labs(
  title = "Grafico de dispersion",
  subtitle = "Ancho vs largo de sepalo de tres especies de iris",
  x = "Largo de sepalo (cm)",
  y = "Ancho de sepalo (cm)"
)

# edicion de temas en ggplot
# theme()

puntos + theme(
  axis.line = element_line(colour = "black", linewidth = 0.7),
  axis.title.y = element_text(size = 12, angle = 0),
  axis.title.x = element_text(size = 12, hjust = 1),
  panel.background = element_blank()
)

tema1 <- theme(
  axis.line = element_line(colour = "black", linewidth = 0.7),
  axis.title.y = element_text(size = 12, angle = 0),
  axis.title.x = element_text(size = 12, hjust = 1),
  panel.background = element_blank()
)

histogram + tema1

histogram + theme_minimal()
