# 1 ) 
install.packages("readxl")
library(readxl)

archivo_excel <- "data_banco.xlsx"


library(readxl)

archivo_excel <- "C:/Users/FRANCO/Desktop/aqctividades/Data_Banco/data_banco.xlsx"
print(excel_sheets(archivo_excel))

data_banco <- read_xlsx(archivo_excel, col_names = TRUE, sheet = "Data")
data_sucursal <- read_xlsx(archivo_excel, sheet = "Data_Sucursal")
data_cajero <- read_xlsx(archivo_excel, sheet = "Data_Cajero")

# 2)
str(datos)

# 3)
head(datos)

# 4)
names(data_banco)
names(data_sucursal)
names(data_cajero)

# 5)

install.packages("tidyverse")
library(tidyverse)
install.packages("tibble")
library(tibble)


data_banco <- as_tibble(data_banco)
data_sucursal <- as_tibble(data_sucursal)
data_cajero <- as_tibble(data_cajero)

glimpse(data_banco)
glimpse(data_sucursal)
glimpse(data_cajero)



# 6)
data_banco %>% select(-Cajero) %>% View

# 7)
class(data_banco$Satisfaccion)
data_banco$Satisfaccion <- as.factor(data_banco$Satisfaccion)
levels(data_banco$Satisfaccion)

# 8)
data_banco %>% filter(Sucursal == 62) %>% View
ls()

# 9)
data_banco %>% filter(Sucursal == 62 & Tiempo_Servicio_seg > 120) %>% View

# 10)
data_banco %>% filter(Sucursal == 62 & Tiempo_Servicio_seg > 120 & Satisfaccion == 
                        "Muy Bueno") %>% View
datos2 <- data_banco %>% filter(Sucursal == 62 & Tiempo_Servicio_seg > 120 & 
                                  Satisfaccion == "Muy Bueno")
# 11)
data_banco %>% arrange(Satisfaccion) %>% View

install.packages("dplyr")
library(dplyr)

#12)
data_banco %>% arrange(Transaccion, desc(Tiempo_Servicio_seg)) %>% View

# 13)
data_banco %>% mutate(Tiempo_Servicio_Min = Tiempo_Servicio_seg/60)%>% View

# 14)
data_banco %>% mutate(Monto = str_replace(Monto, pattern = ",", replacement = "."))

# 15)
summary(data_banco)

install.packages("stringr")
library(stringr)

# 16)
mean(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
median(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
summary(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)

# 17)
quantile(data_banco$Tiempo_Servicio_seg, probs = seq(from = 0.1, to = 1, by = 0.1))
quantile(data_banco$Tiempo_Servicio_seg, probs = c(0.05, 0.95))

# 18)
var(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
sd(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
IQR(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)
range(data_banco$Tiempo_Servicio_seg, na.rm = TRUE)

# 19)
data_banco %>% filter( Sucursal== 62) %>% group_by (Transaccion, Satisfaccion) %>% 
summarise_at( vars(Tiempo_Servicio_seg), funs ( MEDIA= mean(., na.rm=TRUE), 
    MEDIA_ACOT= mean(., na.rm = TRUE, trim = 0.05),CANTIDAD= n() ) )

library(dplyr)

data_banco %>%
  summarise_at(vars(Monto), list(mean = mean, median = median))

str(data_banco)

library(dplyr)
library(stringr)

data_banco <- data_banco %>%
  mutate(Monto = str_replace(Monto, ",", ".")) %>%
  mutate(Monto = as.numeric(Monto))
data_banco %>%
  summarise(mean_monto = mean(Monto, na.rm = TRUE))

# 20)
table(data_banco$Transaccion)
table(data_banco$Satisfaccion)

# 21)
hist(data_banco$Tiempo_Servicio_seg, breaks = "Sturges", 
     main = "Variable Tiempo de respuesta", xlab = "Tiempo de servicio (seg)")

#23)
data_banco %>% group_by(Transaccion, Satisfaccion) %>% 
  summarise_at(vars(Tiempo_Servicio_seg), 
               funs(MEDIA = mean(., na.rm = TRUE), MEDIA_ACOT = mean(., na.rm = TRUE, trim = 
                                                                       0.05), 
                    CANTIDAD = n()))
# 24)
data_banco %>% group_by(Sucursal) %>% 
  summarise_at(vars(Tiempo_Servicio_seg), 
               funs(MEDIA = mean(., na.rm = TRUE),
                    MEDIA_ACOT = mean(., na.rm = TRUE, trim = 0.05),
                    CANTIDAD = n()))
data_banco %>% 
  filter( Sucursal== 85 ) %$%
  cor(Tiempo_Servicio_seg, as.numeric(Monto))

library(dplyr)

data_banco %>%
  summarise_at(vars(Monto), list(mean = mean, median = median))

library(dplyr)
library(tibble)

install.packages("magrittr")
library(magrittr)

data_banco %>% 
  filter(Sucursal == 85) %>%
  with(cor(Tiempo_Servicio_seg, otra_variable))

install.packages("dplyr")  
install.packages("magrittr") 
library(dplyr)
library(magrittr)

data_banco %>%
  summarise_at(vars(Monto), tibble::lst(mean, median))

# 25)
boxplot(data_banco$Tiempo_Servicio_seg)
data_banco %>% select(Tiempo_Servicio_seg) %>% boxplot
boxplot(data_banco$Tiempo_Servicio_seg, main = "Boxplot para Tiempo de Servicio 
(seg)", ylab = "Tiempo")

install.packages("dplyr")  
install.packages("magrittr") 
library(dplyr)
library(magrittr)


exists("%>%", where = "package:dplyr")
data_banco %>% 
  select(Tiempo_Servicio_seg) %>%
  pull() %>%
  boxplot(main = "Distribución del Tiempo de Servicio", ylab = "Segundos")











