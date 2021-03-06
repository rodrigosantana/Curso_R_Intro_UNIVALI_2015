##======================================================================
## Curso R - UNIVALI
## 26-27, novembro, 2012
## An�lise Multivariada
##======================================================================

install.packages("vegan", dep = TRUE)


#### An�lise de Agrupamento

# Carregando o pacote Vegan
library (vegan)

# Importando dados bioticos e ambientais dos arquivos csv
spe <- read.csv("DoubsSpe.csv", row.names=1)
env <- read.csv("DoubsEnv.csv", row.names=1)
spe <- spe[-8,] # Remove empty site 8
env <- env[-8,] # Remove empty site 8

## Padroniza��o do objeto com a contagem de esp�cies
spe.norm <- decostand(spe, "normalize")

## Para os dados de Esp�cies

    ## Dendograma de liga��o simples.

## Defini��o e usuabilidade: Permite que os objetos se aglomerem
## facilmente aos grupos, resultando na dificuldade de forma��o de
## grupos espec�ficos. Serve para identificar gradientes nos dados
## observados.

# Dist�ncia euclidiana
spe.ch <- vegdist(spe.norm, method = "euc")
spe.ch.single <- hclust(spe.ch, method = "single")

# Similaridade de Bray-Curtis
spe.br <- vegdist(spe.norm, method = "bray")
spe.br.single <- hclust(spe.br, method = "single")

# Plot comparativo dos dois m�todos
par(mfrow = c(1, 2))
plot(spe.ch.single, main = "", ylab = "Dist�ncia Euclidiana")
plot(spe.br.single, main = "", ylab = "Indice de Bray-Curtis")

    ## Dendograma de liga��o completa.

## Defini��o e usuabilidade: Este m�todo � muito mas contrastante, este
## m�todo s� permite a entrada de um novo membro ao grupo quando a
## distancia deste corresponde a distancia do ultimo membro do grupo, ou
## seja, para o novo membro adentrar ao grupo necessita a unanimidade de
## todos os membros do mesmo. Este m�todo � interessante para pesquisar
## e identificar descontinuidades nos dados, pois tende a forma grupos
## pequenos.

# Dist�ncia euclidiana
spe.ch.comp <- hclust(spe.ch, method = "complete")

# Similaridade de Bray-Curtis
spe.br.comp <- hclust(spe.br, method = "complete")

# Plot comparativo dos dois m�todos
par(mfrow = c(1, 2))
plot(spe.ch.comp, main = "", ylab = "Dist�ncia Euclidiana")
plot(spe.br.comp, main = "", ylab = "Indice de Bray-Curtis")

# Preparacao da area grafica para quatro paineis dispostos lado a lado,
# com aumento do tamanho de legenda e para nao ("n") mostrar uma caixa
# em torno do plot
par(mfrow = c(2, 2), cex.axis = 1.2, cex.lab = 1.4, bty = "n")
plot(spe.ch.single, main = "", ylab = "Dist�ncia Euclidiana")
plot(spe.br.single, main = "", ylab = "Indice de Bray-Curtis")
plot(spe.ch.comp, main = "", ylab = "Dist�ncia Euclidiana")
plot(spe.br.comp, main = "", ylab = "Indice de Bray-Curtis")

## An�lise de Correspond�ncia Can�nica (CCA)
out.cca <- cca(spe, env)

summary(out.cca)
plot(out.cca)

## An�lise de Redund�ncia (RDA)
out.rda <- rda(spe, env)

summary(out.rda)
plot(out.rda)

## An�lise de Componentes Principais (PCA)
out.pca <- rda(env, scale = TRUE)

summary(out.pca)
plot(out.pca)

ev <- out.pca$CA$eig

barplot(ev, main = "Eigenvalues", col = "gray", las = 2)
abline(h = mean(ev), col = "green")

biplot(out.pca, scaling = 1)
