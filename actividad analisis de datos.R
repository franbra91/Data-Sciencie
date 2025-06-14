#1) Suponga que un fabricante de l�mparas led afirma que la vida �til promedio de una l�mpara led es de 10000 horas. En una muestra de 30 l�mparas led se descubri� que solo duran, 9900 horas en promedio. Suponga que la desviaci�n est�ndar de la poblaci�n es de 120 horas. Con un nivel de significancia de 0.05.  �Se puede rechazar la afirmaci�n del fabricante?

# Planteo de las hipositesis

Ho: � = 10000
H1: � < 10000

Z = \frac{\bar{x} - \mu}{\frac{\sigma}{\sqrt{n}}} 


# Nivel de significance (a) = 0.05

(\bar{x} = 9900) #media muestral

(\mu = 10000) #media poblacional asumida

(\sigma = 120) #desviaci�n est�ndar poblacional

(n = 30) #(ama�o de la muestra

# calculo del valor critico a un nivel de significancia de 0.05

 Z = \frac{9900 - 10000}{\frac{120}{\sqrt{30}}} = \frac{-100}{\frac{120}{5.477}} = \frac{-100}{21.91} \approx -4.56 

 z = -4.564355

 alpha=0.05 # nivel de significancia

z.alpha= qnorm(1-alpha) # valor critico

-z.alpha # porque estoy mirando la cola inferior por la Ho

z = -1.644854

# El estadistico de prueba (-4.564355) es menor que el valor critico (-1,644854)
# Por lo tanto a un nivel de significancia de 0.05 rechazamos la afirmaci�n de que
# la vida media de las lamparas led es superior a 10000 horas

# 2) Una f�brica de cerveza artesanal afirma que el volumen de producci�n es mayor a 1000 litros. En una muestra de 3 producciones, se descubri� que la producci�n es de 992 litros en promedio. Suponiendo que la desviaci�n est�ndar es de 15. �Con un nivel de significancia de 0.1, podemos rechazar la afirmaci�n del fabricante?  

#Definir hip�tesis
#Hip�tesis nula ((H_0)): 
((H_0)): (\mu \leq 1000)

#Hip�tesis alternativa 
((H_a)): (\mu > 1000)

#Calcular el estad�stico de prueba

  [ t = \frac{\bar{x} - \mu}{\frac{s}{\sqrt{n}}} ]
Donde:
(\bar{x} = 992) #(media muestral)
(\mu = 1000) #(media poblacional asumida)
(s = 15) #(desviaci�n est�ndar muestral)
(n = 3) #(tama�o de la muestra)

#Sustituyendo los valores:
t = \frac{992 - 1000}{\frac{15}{\sqrt{3}}} = \frac{-8}{\frac{15}{1.732}} = \frac{-8}{8.66} \approx -0.92 
#Determinar la regi�n de rechazo: 

#Para un nivel de significancia de 
(\alpha = 0.1) y (df = n - 1 = 2) #grados de libertad, buscamos el valor cr�tico en la tabla t para una prueba unilateral.

#El valor cr�tico es 
= t_{0.1,2}
= 1.886. #Si (t) es menor que -1.886, rechazamos (H_0). #Sin embargo, en este caso (t = -0.92) es mayor que -1.886.

#Conclusion: Dado que el valor de t calculado no est� en la regi�n de rechazo, no podemos rechazar la afirmaci�n del fabricante con un nivel de significancia del 10%. En otras palabras, no hay suficiente evidencia estad�stica para concluir que la producci�n es menor a 1000 litros.

# 3) Realiza una estimaci�n por intervalo de la media poblacional de la variable edad del dataset mydata.csv con el que hemos venido trabajando

# Cargar el dataset

mydata <- read.csv("mydata.csv")

# Extraer la variable de edad

edad <- mydata$edad

# Calcular estad�sticos b�sicos

n <- length(edad)         # Tama�o de la muestra
media <- mean(edad)       # Media muestral
sd <- sd(edad)           # Desviaci�n est�ndar muestral

# Nivel de confianza

confianza <- 0.95
alpha <- 1 - confianza

# Calcular el valor cr�tico t
t_critico <- qt(1 - alpha/2, df = n - 1)

# Calcular el margen de error
margen_error <- t_critico * (sd / sqrt(n))

# Calcular el intervalo de confianza
limite_inferior <- media - margen_error
limite_superior <- media + margen_error

# Mostrar resultado
cat("Intervalo de confianza del 95% para la media poblacional de edad:", 
    limite_inferior, "a", limite_superior)
# 4) Supongamos que la altura de los pinos es una variable aleatoria con media y varianza desconocida. Se registra la altura de 5 pinos y los resultados son: 0.9144,  1.5240, 0.6096, 0.4572, 1.0668 metros. Calcular los valores estimados de � y s2 de la poblaci�n de pinos a partir de la muestra.

#calcular la media muestral ((\hat{\mu}))

{\sum{x_i}{n}} 

Donde:
( x_i ) #son los valores muestrales
( n ) #es el tama�o de la muestra (en este caso, ( n = 5 ))


 \hat{\mu} = \frac{0.9144 + 1.5240 + 0.6096 + 0.4572 + 1.0668}{5} 
 \hat{\mu} = \frac{4.5716}{5} = 0.9143 

# PCalcular la varianza muestral ((\hat{\sigma}^2))

 \hat{\sigma}^2 = \frac{\sum (x_i - \hat{\mu})^2}{n-1} 

{(0.9144 - 0.9143)^2 + (1.5240 - 0.9143)^2 + (0.6096 - 0.9143)^2 + (0.4572 - 0.9143)^2 + (1.0668 - 0.9143)^2}{4} 
{(0.0001)^2 + (0.6097)^2 + (-0.3047)^2 + (-0.4571)^2 + (0.1525)^2}{4} 
{0.00000001 + 0.3717 + 0.0928 + 0.2099 + 0.0233}{4} 
{0.7077}{4} = 0.1769 





