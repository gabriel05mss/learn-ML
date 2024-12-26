library(readr)
library(e1071)
vinho = read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data")

colnames(vinho)=c('Tipo','Alcohol','Malic_acid','Ash','Alcalinity_of_ash','Magnesium','Total_phenols', 
                  'Flavanoids','Nonflavanoid_phenols','Proantocianinas','Proanthocyanins',
                  'Hue','OD280/OD315','Proline')

vinho1 = vinho[,-1]

vinhoNorm = as.data.frame(scale(vinho1))

vinho_cm = cmeans(vinhoNorm,3,dist = 'euclidean',method = 'cmeans')

vinho_cm$size
vinho_cm$centers
previsao <- vinho_cm$cluster
vinho_cm$membership

clusplot(vinhoNorm,previsao, color = T, lines = F, labels = 5)

