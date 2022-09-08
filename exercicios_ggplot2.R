
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
# e) Gráfico de dispersão

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
  scale_fill_viridis(discrete = TRUE, option = "B") +
  theme_ipsum() +
  theme(legend.position = "none")

# c) Gráfico de barras com média e erro padrão

dados3 <- dados %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark")) %>%
  group_by(skin_color) %>%
  summarise(media = mean(height, na.rm = T),
            sd = sd(height, na.rm = T), n = n(),
            se = sd/sqrt(n)) %>%
  view()

ggplot(dados3, aes(x = fct_reorder(skin_color, media), 
                   y = media, fill = skin_color)) +
  geom_col() +
  geom_errorbar(aes(ymin = media - se, ymax = media + se),
                width = 0.24, size = 0.8) +
  scale_fill_viridis(discrete = T, option = "D") +
  labs(y = "Altura (cm)", x = "Cor da pele") +
  theme_ipsum_es() +
  theme(legend.position = "none")

# d) Gráfico de linhas

ggplot(dados3, aes(x = skin_color, 
                   y = media, group = 1)) +
  geom_line(linetype = "dashed") +
  geom_point(size = 2.3) +
  geom_errorbar(aes(ymin = media - se, ymax = media + se),
                width = 0.13, size = 0.8) +
  labs(y = "Altura (cm)", x = "Cor da pele") +
  theme_ipsum_es() +
  theme(legend.position = "none")

dados4 <- dados %>%
  select(skin_color, eye_color, mass) %>%
  filter(skin_color %in% c("grey", "brown", "pale", "dark"),
         eye_color %in% c("blue", "yellow", "red", "brown")) %>%
  group_by(eye_color, skin_color) %>%
  summarise(media = mean(mass, na.rm = T)) %>%
  view()

ggplot(dados4, aes(x = skin_color, 
                   y = media,
           color = eye_color,
           group = eye_color)) +
  geom_line(size = 1.7) +
  geom_point(size = 2.3) +
  scale_color_viridis(discrete = T, option = "D") +
  labs(y = "Altura (cm)", x = "Cor da pele", color = "Cor dos olhos") +
  theme_ipsum_es() 
