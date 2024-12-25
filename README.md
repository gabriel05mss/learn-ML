# learn-ML
aprendizado de algoritmos de aprendizado de maquina
## Sumário
- [Regras de associação](#Regras-de-associação)
  - [Apriori](#Apriori)
  - [ECLAT](#ECLAT)
- [Clusterização](#Clusterização)
## Regras de associação
### Apriori
O objetivo principal do Apriori é encontrar itens frequentemente comprados juntos e usar esses padrões para gerar regras de associação, que indicam as relações entre os itens. Essas regras são expressas na forma "se X, então Y", onde X e Y são conjuntos de itens.

Definir termos

$I$ itens: conjunto dos n atributos

$D$ data base: contem todas as transações

$t_i$ todas as transações unicas em $D$

Definimos as regras de associação como X => Y, onde X, Y $\in\$ $I$.

O modo utilizado para encontrar tais regras envolve o cálculo de medidas como Support, Confidence e Lift.

- Support: indica proporção de X em $D$

supp(X) = $\frac{X \in\ D}{D}$

- Confidence: é calculada em cima de uma Regra (X => Y). Ela expressa a proporção de "Se X for comprado, qual a chance de Y ser comprado?

conf(X => Y) = $\frac{supp(X \cup Y)}{supp(X)}$

- Lift: informação nos trás mais conhecimento sobre a possibilidade de Itens serem comprados juntos: 1) Conf(X) é muito alta se ele aparece em todas as transações ou 2) Conf(X) é alta e ele aparece em poucas transações? Essa diferenciação é calculada pelo Lift.

lift(X => Y) = $\frac{supp(X \cup Y)}{supp(X) * supp(Y)}$

Se Lift(X=>Y) > 1, então o conjunto Y é provável de ser comprado quando X for comprado.

Se Lift(X=>Y) ≤1, então NÃO é provável que Y seja comprado, caso X seja comprado.

[Back to sumário](#Sumário)

### ECLAT
Ele tem como objetivo identificar padrões frequentes (itemsets frequentes) em grandes bases de dados, mas de uma forma mais eficiente que o Apriori, especialmente quando se lida com grandes conjuntos de dados.

não cria regras de associação, mas apenas itemsets.

[Back to sumário](#Sumário)

## Clusterização
### K-means
### Fuzzy c-means
### K-medoids
### DBSCAN
### Hierárquico
