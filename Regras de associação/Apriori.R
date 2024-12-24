#install.packages("arules")
library(arules)

#### leitura da base
caminho <- paste0(getwd(),"/dados/GroceryStoreDataSet.csv")
base <- read.transactions(file = caminho, header = F, sep = ",", rm.duplicates = T)
####

#### plot frequencia relativa de cada item
itemFrequencyPlot(base) # pode adicionar top = 5 para mostrar os 5 mais frequencia
####

#### criando regras definir suporte e confiança
regra <- apriori(data = base, parameter = list(sup = 0.1, conf = 0.5))
####

####visualizar essas regras
inspect(regra)
####

#### base de dados reais
#### leitura da base
caminho1 <- paste0(getwd(),"/dados/SuperMarket.csv")
base1 <- read.transactions(file = caminho1, header = F, sep = ",", rm.duplicates = T)
####

#### plot frequencia relativa de cada item
itemFrequencyPlot(base1, top = 10)
####

####criando regras definir suporte e confiança
regra1 <- apriori(data = base1, parameter = list(sup = 0.001, conf = 0.8))
####

#### visualizar regras
inspect(regra1)
inspect(sort(regra1,by = "confidence")[1:30])
####