#install.packages("arules")
library(arules)

####leitura da base 
caminho <- paste0(getwd(),"/dados/GroceryStoreDataSet.csv")
base <- read.transactions(file = caminho, header = F, sep = ",", rm.duplicates = T)
####

#### gradico da base de dados outra forma de visualizar
image(base)
####

####itemset
itemset <- eclat(base, parameter = list(support = 0.1))
inspect(itemset)

itemset <- eclat(base, parameter = list(support = 0.2,maxlen = 2))
inspect(itemset)

itemset <- eclat(base, parameter = list(support = 0.1,minlen = 2))
inspect(itemset)
####