
# Exercícios - Produção de gráficos com o pacote ggplot2 ----------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 07/09/2022 -------------------------------------------------------------------------------------------------------------------------

# Exercícios -------------------------------------------------------------------------------------------------------------------------------

# 1 - Escolha um conjunto de dados disponível no R
# 2 - Carregue os pacotes necessários
# 3 - Produza os seguintes gráficos:
# a) Gráficos de histograma e densidade
# b) Gráficos de boxplot e violino
# c) Gráfico de barras com valores de média e erro padrão
# d) Gráfico de linhas

# Respostas --------------------------------------------------------------------------------------------------------------------------------

# Exercício 1

library(dplyr) # Pacote que carrega o banco de dados Starwars
dados <- starwars
View(dados)

# Exercício 2

library(tidyverse)
library(viridis)
library(hrbrthemes)

# Exercício 3

# a) Gráficos de histograma e densidade

dados <- dados %>%
  drop_na(mass) %>%
  view()

ggplot(dados, aes(x = mass)) +
  geom_histogram(bins = 30)

ggplot(dados, aes(x = mass, y = height)) +
  geom_density_2d()

ggplot(dados, aes(x = mass, y = height)) +
  geom_density_2d_filled()

ggplot(dados, aes(x = mass, y = height)) +
  geom_density_2d_filled()

ggplot(dados, aes(x = mass)) +
  geom_density()

ggplot(dados, aes(x = height, fill = sex)) +
  geom_density()

dados1 <- dados %>%
  drop_na(gender, height)

ggplot(dados1, aes(x = height, fill = gender)) +
  geom_histogram(bins = 30)

# c) Gráficos de boxplot e violino

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark", "tan")) %>%
  ggplot(aes(x = skin_color, y = mass)) +
  geom_boxplot()

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass)) +
  geom_violin() 

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass, fill = skin_color)) +
  geom_violin() 

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass)) +
  geom_boxplot(fill = 'forestgreen', alpha = 0.5, outlier.shape = NA) +
  stat_summary(fun = mean, geom = "point", 
               shape = 20, size = 4, color = "red", fill = "red")

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass)) +
  geom_boxplot(fill = 'forestgreen', alpha = 0.5, 
               outlier.colour = "red", outlier.shape = 8,
               outlier.size = 6) +
  geom_jitter(position = position_jitter(0.2)) +
  stat_summary(fun = mean, geom = "point", 
               shape = 20, size = 4, color = "red", fill = "red")

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass, fill = skin_color)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", 
               shape = 20, size = 4, color = "red", fill = "red") +
  scale_fill_viridis(discrete = TRUE, option = "A") +
  theme_ipsum() +
  theme(legend.position = "none")

dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  ggplot(aes(x = skin_color, y = mass, fill = skin_color)) +
  geom_violin(fill = "gray", alpha = 0.6, trim = F) +
  geom_boxplot(width = 0.1) +
  stat_summary(fun = mean, geom = "point", 
               shape = 20, size = 2.4, color = "red", fill = "red") +
  scale_fill_viridis(discrete = TRUE, option = "A") +
  theme_ipsum() +
  theme(legend.position = "none")
