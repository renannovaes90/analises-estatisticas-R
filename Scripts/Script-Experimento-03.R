library(ExpDes.pt)
dados3 <- Dados_Experimento_03
attach(dados3)

Anova1 <- dbc(Consorcio, bloco, insetA)
Anova2 <- dbc(Consorcio, bloco, MSN)
Anova3 <- dbc(Consorcio,bloco, Nod)
Anova4 <- dbc(Consorcio, bloco, Nod_F)
Anova5 <- dbc(Consorcio, bloco, Prod)
