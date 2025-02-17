# Tarea: Comentar el siguiente código.
## Describir brevemente lo que hace cada línea.
## Si no saben que hace una línea, pueden escribirme o googlear la función
## Recuerden hacer comentarios usando #
#Luis Juan Centuri�n A01650501
#Norberto Reyes Mu�oz A01651207
#Rafael Garc�a Cadenas A1334363
#Eduardo Ferrer MacGregor Ruiz A01651867
#La libreria fue instalada con el comando install.packages("tidyverse")
install.packages("tidyverse")
library("tidyverse")
#Lectura del archivo CSV que contienen los datoas a analizarse(datos relacionados a la calidad de vida en diversos paises)
gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")
#Filtrado de los datos para seleccionar solamente los datos relacionados a Canada
gap_5060_CA <- gap_5060 %>% filter(country == "Canada")
#Graficaci�n de la calidad de vida con respecto al a�o
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")
#Colocar el axis de las x como el a�o donde se llev� el estudio y las "Y" como la correspondiente expectativa de vida
#geom_line() permite realizar una linea entre cada punto de los valores en X(en este caso une el a�o de 1952 a 1953 y 1953 a 1954 y as� correspondientemente)
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()
#Filtrar los datos para obtener solamente los correspondientes a Canad�, M�xico y Estados UNidos
gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))
#Finalmente graficar con una linea para hacer una comparativa entre los 3 paises previamente seleccionados
ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()
