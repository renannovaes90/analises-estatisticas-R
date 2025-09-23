library(ExpDes.pt) #Carregando livraria para as anovas
dados11 <- Dados_experimento_11 #Criando objeto para o dataset
attach(dados11) #Anexando dataset ao R

ANOVA1 <- dic(K2O, NF) #Análise de variância para numero médio de frutos por planta
ANOVA2 <- dic(K2O, PF) #Análise de variância para peso médio de frutos por planta
