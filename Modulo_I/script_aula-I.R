# Somando números
2 + 2

# Gerando dez números aleatórios de uma dist. Uniforme
runif(10)

# Gerando dez números aleatórios de uma dist. Uniforme
# entre 1 e 100
runif(min = 1, max = 100, n = 10)
# Selecionando somente a parte inteira de uma dist. Uniforme
# com dez números aleatórios entre 1 e 100
trunc(runif(10, min = 1, max = 100), 0)

32 + (16^2) - (25^3)

(32 + (16^2) - (25^3))/345

(exp(-2) * (2^4) - 1)/factorial(4)

log((exp(-2) * (2^4) - 1)/factorial(4))

runif(30)

runif(30, min = -5, max = 5)

runif(30, min = 10, max = 500)

# Atribuindo valores a objetos
x <- 2

y <- 4

y <- runif(10)

x <- 32 + (16^2) - (25^3)

y <- x/345

vet <- runif(30, min = 10, max = 50)

rm(y)

rm(list = ls())

numerico <- c(10, 5, 2, 4, 8, 9)

numerico + c(2, 4, 1)

numerico + c(2, 4, 1, 3)









vet <- c(54, 0, 17, 94, 12.5, 2, 0.9, 15)

vet + c(5, 6)

sex <- c(rep("M", 15), rep("F", 12), rep("J", 8))

sex == "F"

matriz <- matrix(c(2, 8, 4, 0, 4, 1, 9, 7, 5), ncol = 3, 
                 nrow = 3, byrow = TRUE)

praias <- data.frame(praias = c("Joaquina", "Campeche", "Armação",
                                "Praia Mole"), 
                     plantas = c(42, 34, 59, 18))

vet[c(2, 5, 7)]

vet[vet != 0]

praias[praias$plantas < 30,]

praias$regiao <- c("leste", rep("sul", 2), "leste")

praias[praias$regiao == "sul" & praias$plantas > 40,]





## Módulo II - Análise descritiva e gráficos



























