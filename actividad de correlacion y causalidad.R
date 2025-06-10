# 1) Se pretende estudiar si existe correlación entre el “% de ausencia a clase” y la “nota” que obtienen los alumnos en una materia. Los datos son los siguientes: 

Asistencia 65 93 100 60 50 78 85 90 83 77
Nota 55 88 97 52 41 60 69 80 70 80


#a. Obtener la gráfica Q-Q para cada variable e interpretar

asistencia<-c(65,93,100,60,50,78,85,90,83,77)
nota<-c(55,88,97,52,41,60,69,80,70,80)


# Gráfica Q-Q para asistencia
qqnorm(asistencia, main="Q-Q Plot de Asistencia")
qqline(asistencia, col="red")

# Gráfica Q-Q para nota
qqnorm(nota, main="Q-Q Plot de Nota")
qqline(nota, col="blue")

#b. Realizar el test de normalidad para cada variable e interpretar

shapiro.test(asistencia) # presenta distribucion normal
shapiro.test(nota) # presenta distribucion normal


#c. ¿Qué tipo de prueba de correlación debe aplicarse?

#Si ambas variables son normales, aplicamos la correlación de Pearson.
#Si al menos una no es normal, usamos la correlación de Spearman (que no asume normalidad).

cor.test(asistencia, nota, method = "pearson")
cor.test(asistencia, nota, method = "spearman")

#d. ¿Existe relación lineal entre el porcentaje de asistencia a clase y la nota final de una materia? Interprete los resultados

# Regresión lineal
modelo <- lm(nota ~ asistencia)
summary(modelo)

# Gráfico de dispersión con línea de regresión
plot(asistencia, nota, main="Relación entre asistencia y nota", xlab="Asistencia (%)", ylab="Nota", pch=16)
abline(modelo, col="red")


# 2) Supongamos que tenemos una empresa que cuenta con 15 vendedores que realizan ventas telefónicas.Creamos un dataframe con los datos de los vendedores, el n umero de llamadas que realizan y el número de vendas

vendedores <- paste("Vendedor",1:15, sep="")

llamadas <- c(96, 40, 104, 128, 164, 76, 72, 80 , 36, 84, 180, 132, 120, 44, 84) 
ventas <- c(41, 41, 51, 60, 61, 29, 39, 50, 28, 43, 70, 56, 45, 31, 30)

datos <- data.frame(vendedores, llamadas, ventas)

datos

#a) el coeficiente de correlación de Pearson r

vendedores <- paste("Vendedor", 1:15, sep="")
llamadas <- c(96, 40, 104, 128, 164, 76, 72, 80, 36, 84, 180, 132, 120, 44, 84)
ventas <- c(41, 41, 51, 60, 61, 29, 39, 50, 28, 43, 70, 56, 45, 31, 30)
datos <- data.frame(vendedores, llamadas, ventas)

r_pearson <- cor(datos$llamadas, datos$ventas, method = "pearson")

cat("Coeficiente de correlación de Pearson (r):", r_pearson, "\n")
  
#Si ( r ) está cerca de 1, hay una fuerte correlación positiva (más llamadas ??? más ventas).
#Si ( r ) está cerca de -1, la relación es negativa (más llamadas ??? menos ventas).
#Si ( r ) es cercano a 0, no hay correlación significativa

#b) el valor del coeficiente de determinación r2

r2 <- r_pearson^2

cat("Coeficiente de determinación (r^2):", r2, "\n")
  
#Si ( r^2 ) es cercano a 1, la cantidad de llamadas explica bien las ventas.
#Si es cercano a 0, la relación no es fuerte.

#c) Realizar la prueba de significancia para determinar si la correlación estimada es diferente de cero para rechazar o aceptar una hipótesis nula.
#( H_0 ):  

(( r = 0 ))

# Prueba de significancia para la correlación
prueba_correlacion <- cor.test(datos$llamadas, datos$ventas, method = "pearson")

# Mostrar resultados
print(prueba_correlacion)
  
n <- nrow(datos)
t <- r * (sqrt(n-2) / sqrt(1 - r^2))
t

# determino el valor critico de t con nivel de confianza de 95%
# Para eso uso la funcion qt() 

confianza = 0.95
t.critico <- qt(p = (1 - confianza) / 2, df = n-2, lower.tail = FALSE)
t.critico

# Realizo una gráfica para ubicar el valor de t con respecto al valor de t.critico
# y se estima si está en una zona de aceptación o rechazo para concluir que se 

install.packages("visualize")
library(visualize)
visualize.t(stat = c(-t.critico, t.critico), section = "tails", df = (n-2)) +
  abline(v = t, col = "red", lwd = 3, lty = 2) +
  text(0, 0.2, paste(confianza * 100, "%", sep = ""), col = "red")
  
  
