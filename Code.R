# Tarea: Comentar el siguiente cÃ³digo.
## Describir brevemente lo que hace cada lÃ­nea.
## Si no saben que hace una lÃ­nea, pueden escribirme o googlear la funciÃ³n
## Recuerden hacer comentarios usando #
#Luis Juan Centurión A01650501
#Norberto Reyes Muñoz A01651207
#Rafael García Cadenas A1334363
#Eduardo Ferrer MacGregor Ruiz A01651867
#La libreria fue instalada con el comando install.packages("tidyverse")
library("tidyverse")

gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")

ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()
