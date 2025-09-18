library(ExpDes.pt)
attach(Dados_G5)

ANOVA1 <- dic(Adubo, altp)
ANOVA2 <- dic(Adubo, diamc)
ANOVA3 <- dic(Adubo, pan)
ANOVA4 <- dic(Adubo, Nfoliar)
ANOVA5 <- dic(Adubo, CTfolh)
ANOVA6 <- dic(Adubo, altpt)

# Pacotes necessários
library(ExpDes.pt)
library(MASS)

# ---------------------------
# ALTURA DA PLANTA (altp)
# ---------------------------

# ANOVA original
ANOVA1 <- dic(Dados_G5$Adubo, Dados_G5$altp)

# Teste Box-Cox
anova_altp <- aov(altp ~ Adubo, data = Dados_G5)
boxcox(anova_altp, lambda = seq(-2, 2, 0.1))

# Transformações
ANOVA1_log  <- dic(Dados_G5$Adubo, log(Dados_G5$altp))
ANOVA1_sqrt <- dic(Dados_G5$Adubo, sqrt(Dados_G5$altp))

# ---------------------------
# ALTURA DA PANÍCULA (altpt)
# ---------------------------

# ANOVA original
ANOVA6 <- dic(Dados_G5$Adubo, Dados_G5$altpt)

# Teste Box-Cox
anova_altpt <- aov(altpt ~ Adubo, data = Dados_G5)
boxcox(anova_altpt, lambda = seq(-2, 2, 0.1))

# Transformações
ANOVA6_log  <- dic(Dados_G5$Adubo, log(Dados_G5$altpt))
ANOVA6_sqrt <- dic(Dados_G5$Adubo, sqrt(Dados_G5$altpt))
