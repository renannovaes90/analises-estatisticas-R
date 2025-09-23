library(ExpDes.pt) #carrega a biblioteca para análise das ANOVAS
library(nortest) #Carrega a biblioteca que faz as pressuposições (normalidade de resíduos e homogeneidade entre variâncias)
library(MASS) #carrega a biblioteca que faz as transformações de dados
dados7 <- Dados_Experimento_07 #criando um objeto para o database
attach(dados7) #fixando o database no R

#Seguem ANOVAS com testes de médias utilizando o método Scott-Knott uma vez que o número de parcelas (n) é maior que 50
ANOVA1 <- dic(Genotipos, Nfolhas, mcomp = "sk") #Análise de variância para número de folhas
ANOVA2 <- dic(Genotipos, SigatAmar, mcomp = "sk") #Análise de variância para incidência de Sigatoka-Amarela
ANOVA3 <- dic(Genotipos, NPencas, mcomp = "sk") #Análise de variância para número de pencas
ANOVA4 <- dic(Genotipos, Nfrutos, mcomp = "sk") #Análise de variância para número de frutas
ANOVA5 <- dic(Genotipos, Pcachos,mcomp = "sk") #Análise de variância para peso de cachos

#Segue teste para normalidade de resíduos quando número de parcelas (n) > 50

# Ajustando modelos lineares correspondentes
modelo_Nfolhas <- aov(Nfolhas ~ Genotipos, data = dados7) #Modelo linear para número defolhas
modelo_SigatAmar <- aov(SigatAmar ~ Genotipos, data = dados7) #Modelo linear para incidência de Sigatoka-amarela
modelo_NPencas <- aov(NPencas ~ Genotipos, data = dados7) #Modelo para número de pencas
modelo_Nfrutos <- aov(Nfrutos ~ Genotipos, data = dados7) #Modelo para número de frutos
modelo_Pcachos <- aov(Pcachos ~ Genotipos, data = dados7) #Modelo para peso de cachos

# Aplicando teste de normalidade de resíduos Lilliefors (lillie.test) nos resíduos
lillie.test(residuals(modelo_Nfolhas)) 
lillie.test(residuals(modelo_SigatAmar))
lillie.test(residuals(modelo_NPencas))
lillie.test(residuals(modelo_Nfrutos))
lillie.test(residuals(modelo_Pcachos))

# Teste de homogeneidade de variâncias (Bartlett)

bartlett.test(Nfolhas ~ Genotipos, data = dados7)     # modelo1
bartlett.test(SigatAmar ~ Genotipos, data = dados7)   # modelo2
bartlett.test(NPencas ~ Genotipos, data = dados7)     # modelo3
bartlett.test(Nfrutos ~ Genotipos, data = dados7)     # modelo4
bartlett.test(Pcachos ~ Genotipos, data = dados7)     # modelo5

##A normalidade de resíduos para Nfolhas não foi atendida (P<5%)
##As pressuposições, normalidade de resíduos e homogeneidade não foram atendidas para SigatAmar. Bartlett e Lilliefors P<5%
##Faz-se necessário a transformação dos dados com box-cox.

#-----------------------------
# Transformação para Nfolhas
#-----------------------------

#Ajustando o modelo linear para Nfolhas 
modelo1 <- aov(dados7$Nfolhas ~ dados7$Genotipos, data = dados7)

# Box-Cox para sugerir transformação
boxcox(modelo1, lambda = seq(-2, 2, 0.1))

# Criando variável transformada para Nfolhas com lambda = -0.5
lambda_nfolhas <- -0.5
dados7$Nfolhas_bc <- (dados7$Nfolhas^lambda_nfolhas - 1) / lambda_nfolhas

# Novo modelo com transformação
modelo1_bc <- aov(Nfolhas_bc ~ Genotipos, data = dados7)

# Testes de pressuposições após a transformação
lillie.test(residuals(modelo1_bc))                     # normalidade (Lilliefors)
bartlett.test(Nfolhas_bc ~ Genotipos, data = dados7)   # homogeneidade

#-------------------------------------
# Segue transformação para SigatAmar
#-------------------------------------

# Ajustando o modelo linear para SigatAmar

modelo2 <- aov(SigatAmar ~ Genotipos, data = dados7)

# Box-Cox para identificar o lambda
boxcox(modelo2, lambda = seq(-2, 2, 0.1))

# Aplicando transformação com lambda ≈ -0.9
lambda_sigatamar <- -0.9
dados7$SigatAmar_bc <- (dados7$SigatAmar^lambda_sigatamar - 1) / lambda_sigatamar

# Novo modelo com a variável transformada
modelo2_bc <- aov(SigatAmar_bc ~ Genotipos, data = dados7)

# Testes de pressuposições
lillie.test(residuals(modelo2_bc))                     # normalidade
bartlett.test(SigatAmar_bc ~ Genotipos, data = dados7) # homogeneidade

# ---------------------------
# Transformação para Pcachos
# --------------------------

# Ajustando modelo linear para Pcachos
modelo5 <- aov(Pcachos ~ Genotipos, data = dados7)

# Análise Box-Cox para sugerir a transformação
boxcox(modelo5, lambda = seq(-2, 2, 0.1))

# Substituir pelo valor de lambda indicado pelo gráfico
lambda_pcachos <- -0.9   

# Criando variável transformada para Pcachos
dados7$Pcachos_bc <- (dados7$Pcachos^lambda_pcachos - 1) / lambda_pcachos

# Novo modelo com transformação
modelo5_bc <- aov(Pcachos_bc ~ Genotipos, data = dados7)

# Testes de pressuposições
lillie.test(residuals(modelo5_bc))                     # normalidade (Lilliefors ou Shapiro-Wilk)
bartlett.test(Pcachos_bc ~ Genotipos, data = dados7)   # homogeneidade

# ANOVA e teste de Scott-Knott após transformação
ANOVA5_bc <- dic(Genotipos, dados7$Pcachos_bc, mcomp = "sk")

