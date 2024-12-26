library(readr)
library(tidyverse)
library(corrplot)
library(gridExtra)
library(GGally)
library(knitr)
#### importando a base 
vinho = read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data")
View(vinho)
structure(vinho)
####

#### nomeando colunas
colnames(vinho)=c('Tipo','Alcohol','Malic_acid','Ash','Alcalinity_of_ash','Magnesium','Total_phenols', 
                  'Flavanoids','Nonflavanoid_phenols','Proantocianinas','Proanthocyanins',
                  'Hue','OD280/OD315','Proline') 
####

#### base de teste
vinho1 <- vinho[,-1]
####

#### padronizar
scale(vinho1)
####

#### correlações
corrplot(cor(vinho1))
####

####clusterização
vinho_k2 <- kmeans(vinho1, centers = 2)

# para qual cluster os pontos foram alocados
vinho_k2$cluster

# centroide de cada cluster
vinho_k2$centers

# quantos pontos por cluster
vinho_k2$size
####

#### analisando quantos clusters tem melhor ajuste aos dados
bts = numeric()
tws = numeric()
set.seed(1234)
for(i in 1:10){
  bts[i] = kmeans(vinho1, centers=i)$betweenss
  tws[i] = kmeans(vinho1, centers=i)$tot.withinss
}

c3=qplot(1:10, bts, geom=c("point", "line"), 
         xlab="Numero de clusters", ylab="Soma entre os quadrados") +
  scale_x_continuous(breaks=seq(0, 10, 1)) +
  theme_bw()

c4=qplot(1:10, tws, geom=c("point", "line"),
         xlab="Numero de clusters", ylab="Soma total de quadrados dentro do cluster") +
  scale_x_continuous(breaks=seq(0, 10, 1)) +
  theme_bw()

grid.arrange(c3, c4, ncol=2)
