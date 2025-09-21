library(ExpDes.pt) #carrega a biblioteca
dados7 <- Dados_Experimento_07 #criando um objeto para o database
attach(dados7) #fixando o database

#Seguem ANOVAS com testes de médias utilizando o método Scott-Knott uma vez que o número de parcelas (n) é maior que 50
ANOVA1 <- dic(Genotipos, Nfolhas, mcomp = "sk") #Análise de variância para número de folhas
ANOVA2 <- dic(Genotipos, SigatAmar, mcomp = "sk") #Análise de variância para incidência de Sigatoka-Amarela
ANOVA3 <- dic(Genotipos, NPencas, mcomp = "sk") #Análise de variância para número de pencas
ANOVA4 <- dic(Genotipos, Nfrutos, mcomp = "sk") #Análise de variância para número de frutas
ANOVA5 <- dic(Genotipos, Pcachos,mcomp = "sk") #Análise de variância para peso de cachos

#Segue teste para normalidade de resíduos quando número de parcelas (n) > 50
library(nortest)

# Ajustando modelos lineares correspondentes
modelo1 <- aov(Nfolhas ~ Genotipos, data = dados7) #Modelo linear para número defolhas
modelo2 <- aov(SigatAmar ~ Genotipos, data = dados7) #Modelo linear para incidência de Sigatoka-amarela
modelo3 <- aov(NPencas ~ Genotipos, data = dados7) #Modelo para número de pencas
modelo4 <- aov(Nfrutos ~ Genotipos, data = dados7) #Modelo para número de frutos
modelo5 <- aov(Pcachos ~ Genotipos, data = dados7) #Modelo para peso de cachos

# Aplicando teste de normalidade de resíduos Lilliefors (lillie.test) nos resíduos
lillie.test(residuals(modelo1)) 
lillie.test(residuals(modelo2))
lillie.test(residuals(modelo3))
lillie.test(residuals(modelo4))
lillie.test(residuals(modelo5))

# Teste de homogeneidade de variâncias (Bartlett)

bartlett.test(Nfolhas ~ Genotipos, data = dados7)     # modelo1
bartlett.test(SigatAmar ~ Genotipos, data = dados7)   # modelo2
bartlett.test(NPencas ~ Genotipos, data = dados7)     # modelo3
bartlett.test(Nfrutos ~ Genotipos, data = dados7)     # modelo4
bartlett.test(Pcachos ~ Genotipos, data = dados7)     # modelo5

#A normalidade de resíduos para Nfolhas não foi atendida (P<5%)
#As pressuposições, normalidade de resíduos e homogeneidade não foram atendidas para SigatAmar. Bartlett e Lilliefors P<5%
#Faz-se necessário a transformação dos dados com box-cox.

#Segue transformação para Nfolhas
library(MASS)
modelo1 <- aov(Nfolhas ~ Genotipos, data = dados7)

# Box-Cox para sugerir transformação
boxcox(modelo1, lambda = seq(-2, 2, 0.1))

# Criando variável transformada para Nfolhas com lambda = -0.5
lambda_nfolhas <- -0.5
dados7$Nfolhas_bc <- (dados7$Nfolhas^lambda_nfolhas - 1) / lambda_nfolhas

# Novo modelo com transformação
modelo1_bc <- aov(Nfolhas_bc ~ Genotipos, data = dados7)

# Testes de pressuposições
library(nortest)
lillie.test(residuals(modelo1_bc))                     # normalidade (Lilliefors)
bartlett.test(Nfolhas_bc ~ Genotipos, data = dados7)   # homogeneidade
