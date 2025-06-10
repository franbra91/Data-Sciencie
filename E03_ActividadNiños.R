# Instalar y cargar el paquete necesario
install.packages("readxl")  # Solo si no está instalado previamente
library(readxl)

# ruta del archivo (ajústala según la ubicación real del archivo)
archivo_excel <- "NiñosLP.xlsx"

# Leer la hoja "GENERAL" y asignarla al objeto datos
datos <- read_excel("C:/Users/FRANCO/Desktop/NiñosLP.xlsx", sheet = "GENERAL")


file.exists("C:/Users/FRANCO/Desktop/aqctividades/E03_ActividadNiños/NiñosLP.xlsx")


library(readxl)

datos <- read_excel("C:/Users/FRANCO/Desktop/aqctividades/E03_ActividadNiños/NiñosLP.xlsx", sheet = "GENERAL")

# primeras filas del dataset
head(datos)

# Confirmar estructura de los datos ( 3)
str(datos)

# 4)
ncol(datos)

colnames(datos)

# 5)
na.fail(datos) # pregunto si tiene NA
sum(is.na(datos)) 
sapply(datos,function(datos)sum(is.na(datos)))


# 6)
class(datos$Sexo) # numeric
unique(datos$Sexo) # 1 0
# Transformo la variable sexoa a factor
datos$Sexo<- factor(datos$Sexo,labels= c("Hombre","Mujer"))
class(datos$Sexo)
unique(datos$Sexo)

# 7) 
class(datos$FechaNac)
round_date(datos$FechaNac)
class(datos$Fecha)
round_date(datos$Fecha)

# 8) 
datos$Edad_actual<- round((datos$Fecha - datos$FechaNac)/365.25)
edad$Edad_actual

# 9) 
head(datos$Peso) 
head(datos$Talla)

datos<- transform(datos,Talla=Talla/100)
datos$IMC<- round(datos$Peso/(datos$Talla*datos$Talla),2)
head(datos$IMC)

datos$gIMC<- cut(datos$IMC,breaks = c(0,13,19,24,+Inf),
                  labels = c("Bajo Peso","Normal","Sobrepeso","Obesidad"),
                  right=FALSE)
datos$gIMC

#10)
class(datos$Zona)
datos$Zona<- as.factor(datos$Zona)
class(datos$Zona)
unique(datos$Zona)
require(forcats)
datos$Zona<-fct_recode(datos$Zona, Centro_LP="Casco Urbano")
unique(datos$Zona)


