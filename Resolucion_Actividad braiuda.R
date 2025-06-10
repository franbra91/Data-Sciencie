###############################################
### CERTIFICACION UNIVERSITARIA EN DATA SCIENCE
### PROGRAMACION PARA LA CIENCIA DE DATOS I ###
###               ACTIVIDAD 1               ###
###############################################


## 24 de ENERO de 2023 ##

rm(list=ls())# Borrar los datos de entorno cargados en memoria 

## Ejercicio 1: Usando R como calculadora ##-----------
4+5 
27-11 
3*9 
23/4 
23%/%4 
23%%4 
2/3+4/7 
sqrt(36) 
sqrt(79) 
sin(pi) 
sin(3.14)

## Ejercicio 2: mas calculos ##---------

sqrt(144) / (27^(1/3)) ##Usamos exponenciaci?n de 1/3 para calcular la ra?z c?bica

round(abs((356-366)*pi),2) ##Podemos integrar varias funciones matem?ticas como en este caso round() y abs()
# [1] 31.42
abs((356-366)*pi) # sin decimales

# [1] 31.41593

## Ejercicio 3: Mi primer scripts ## --------
setwd("C:/ARRAYANES/MUNDO_E") # aqui debes asigna tu directorio de trabajo
# entre () y "" va el camino al directorio de trabajo deseado

getwd() ## corroboro en que directorio de trabajo estamos situados

a <- 5 
b <- 4 
c <- a + b 
a <- b * c 
b <- (c - a)^2 
c <- a * b 

a -5
b -4
c (-(-5) + (-4))

## Ejercicio 4: Trabajando con vectores ##--------------

x <- c(1,3,5,7,9) 
y <- c(2,3,5,7,11,13) 

x+1

c(2,4,6,8,10) 

y+1

c(3,4,6,8,12,14) 

y*3

c(6, 9, 15, 21, 33, 39)

length(x) + length(y) 

length(x) = 5

length(y) = 6 

x+y 

5 + 6 = 11

## Ejercicio 5: operaciones con vectores ##-----------

1:10 #vector del 1 al 10 en orden creciente 

c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

10:1 # vector del 1 al 10 en orden decreciente

c(10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

seq(1,10,2) # creamos la secuencia del 1 al 10 de numeros impares

seq(1, 10, 2)

seq(from = 1, to = 10, length =6) # secuencia del 1 al 10 conteniendo 6 elementos

c(1, 2.8, 4.6, 6.4, 8.2, 10)

rep(5,10) # repetimos 10 veces el elemento 5

c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5)

rep(1:3,rep(5,3)) # repetimos cada elemento el vector 3 veces de 5 en 5
#[1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
  
c(5, 5, 5)

c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3)

meses<- c ( "Enero","Febrero","Marzo","Abril","mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
        
str(meses)

#chr [1:12] "Enero","Febrero","Marzo","Abril","mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"
 
mode(meses) "character"
length(meses) 12
meses [3] "Marzo"
#meses [2:6] "Febrero", "Marzo", "Abril", "mayo", "Junio"#

rm(meses) # elimino el vector meses 

#el vector meses desaparece del resultado#

ls() # listo los objetos en la memoria

## Ejercicio 6: mas vectores ## --------

x<-c(2,4,6,8,10) # 5 primeros numeros pares
x # llamamos al objeto creado

x <- seq( from = 2, by = 2, length = 5) # otra forma de resolver
#x (2 4 6 8 10)

y<-10:1 # numeros naturales en orden decreciente.
y <- (10:1)  # otra forma, agregando los ()
#y(10 9 8 7 6 5 4 3 2 1)

seq(1,15,length=7)# secuencia del 1 al 15 en 7 pasos
# 1.0 3.33 5.67 8.0 10.33 12.67 15.0

seq( from = 1, to = 15, by = 2)  # cuidado, si lo resolves asi te devuelve 8 valores
# 1 3 5 7 9 11 13 15

seq(1, 15, by=2) # otro error: asi te devuelve 8 pasos
# 1 3 5 7 9 11 13 15

vector <- rep(4,10) # resuelto de una manera facil y corta 
vector
# rep(4 4 4 4 4 4 4 4 4 4)

vector_num <- rep(4, time=10) # otra forma de resolverlo
vector_num
#rep(4 4 4 4 4 4 4 4 4 4)

dias <-c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")
dias 
length(dias)
dias[3]  # dia en la tercera posicion "Miercoles"
"Miercoles"

## Ejercicio 7: trabajando con listas ##--------------

milista <- list(Lugar="Granja", 
                Nombre="La Vaca Loca", 
                numero.animales=6, 
                animales =c("Gallo", "Gallina" , "Conejo","Caballo", "Perro" ,"Vaca"  ), 
                cantidad=c(1,8,6,4,2,1))
milista

milista$Lugar
milista$Nombre
milista$numero.animales
milista$animales
milista$cantidad
milista$cantidad[milista$animales == "Gallina"]

## Ejercicio 8: trabajando con Dataframe ##--------------

## sample() te genera valores al azar. 
# CUIDADO, CADA VEZ QUE CORRES EL CÓDIGO LOS VALORE CAMBIAN!!!!
edad<- sample(0:20,10) 
edad

genero<- sample(c("Hombre", "Mujer"),10, replace=T)
genero

class(genero)

enfermo<- sample(c("verdadero", "falso"),10, replace = T)
enfermo

datos<- data.frame(edad, genero, enfermo)
datos

dim(datos) # dimension: 10 onservaciones, 3 variables


## Ejercicio 9: Construyendo un data.frame ##--------------

# genero los vectores y los asigno a un objeto
ID<-c(101,105,108,109,116,120,132,148)
Edad<-c(17,16,14,18,12,14,15,17)
Fuma<-c(T,T,F,F,F,T,F,T)
Genero<-c("M","H","H","H","M","NA","H","M")
Edad_ini<-c(16,16,NA,NA,NA,14,NA,15)
Curso<-c(6,5,3,5,1,2,3,5)

# genero el data.frame
adolescentes<-data.frame(ID,Edad,Genero,Fuma,Edad_ini,Curso)

# mostrar nombres de variables 
names(adolescentes)

# nuevo objeto
adolescentes_dim<-dim(adolescentes)
adolescentes_dim

# structura del DF

str(adolescentes)

# cabecera del DF
head(adolescentes)

# cola del DF
tail(adolescentes)

## Ejercicio 10: Indices de Data.frame ## --------------

# mostrar variables Fuma y Edad_ini
adolescentes[,c("Fuma","Edad_ini")]

# mostarr filas
adolescentes[c(1,2,6,7,8),]

# nuevo objeto fumadores
fumadores<-adolescentes[adolescentes$Fuma==T,]
fumadores

# mostrar la clase del objeto fumadores
class(fumadores)

#mostrar primeras tres observaciones
fumadores[1:3,c("ID","Edad","Genero","Curso")]

# eliminar variable ID
fumadores$ID<-NULL

# verifico
names(fumadores)#verifico que no exista#


####################
### Fin del script 
#####################

#########################################################

