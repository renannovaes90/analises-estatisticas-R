library(ExpDes.pt) #Carregando biblioteca ExpDes.pt
dados3 <- Dados_Experimento_03 #Criando objeto para o dataset
attach(dados3) #Anexando o dataset no R

Anova1 <- dbc(Consorcio, bloco, insetA) #Análise de variância para incidência de insetos adultos
Anova2 <- dbc(Consorcio, bloco, MSN) #Análise de variância para matéria seca dos nódulos
Anova3 <- dbc(Consorcio,bloco, Nod) #Análise de variância para nódulos
Anova4 <- dbc(Consorcio, bloco, Nod_F) #Análise de variância para nódulos furados
Anova5 <- dbc(Consorcio, bloco, Prod) #Análise de varância para produtividade 
