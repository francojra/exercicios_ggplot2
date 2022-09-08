
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
