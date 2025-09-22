
# Experimento 03 – Efeitos de Cerotoma arcuata (Vaquinha) na Nodulação e Produtividade do Feijoeiro

Este repositório contém os dados, análises estatísticas e resultados referentes ao **Experimento 03**, conduzido para avaliar os danos causados por *Cerotoma arcuata* (vaquinha) em feijoeiro, considerando diferentes formas de cultivo e manejo.

## 📋 Descrição do experimento
- **Espécie alvo:** *Cerotoma arcuata* (vaquinha), praga de feijão, soja, caupi e outras leguminosas.  
- **Cultura avaliada:** Feijoeiro (*Phaseolus vulgaris* L.).  
- **Objetivo:** Avaliar os danos da infestação de *C. arcuata* sobre a nodulação e a produtividade do feijoeiro solteiro, consorciado com hospedeira (caupi), não-hospedeira (milho) e com cobertura morta.  
- **Delineamento experimental:** Blocos casualizados (DBC) com 5 repetições.  
- **Tratamentos (sistemas de cultivo):**
  - Solteiro  
  - Solteiro com cobertura morta (CobM)  
  - Consórcio com caupi (Caupi)  
  - Consórcio com milho (MilhoC)  
- **Número total de parcelas úteis:** 20  
- **Infestação:** Natural, avaliada por captura com rede entomológica.  
- **Inoculação:** Rizóbio (CIAT 899 para feijão; BR 2001 para caupi).  
- **Avaliações:**  
  - Aos 43 dias: insetos adultos (InsetA), número de nódulos (Nod), matéria seca dos nódulos (MSN), nódulos furados (Nod_F).  
  - Aos 70 dias: produtividade (Prod).  

---

## 📊 Análises estatísticas
As análises foram realizadas no software **R** com o pacote **ExpDes.pt**.  
Foram verificadas as pressuposições de **normalidade dos resíduos** (Shapiro-Wilk) e **homogeneidade de variâncias** (teste de O’Neill-Mathews). Todas as variáveis atenderam às pressuposições.

### Resultados resumidos:

#### 1. Incidência de insetos adultos (InsetA)
- Resíduos normais e homocedásticos.  
- **Tukey:** Feijoeiro solteiro apresentou maior incidência de insetos.  

#### 2. Matéria seca dos nódulos (MSN)
- Resíduos normais e homocedásticos.  
- **Tukey:** Cobertura morta e Caupi resultaram em maior matéria seca dos nódulos.  

#### 3. Número de nódulos (Nod)
- Resíduos normais e homocedásticos.  
- **Tukey:** Maior nodulação no consórcio com Caupi; menor no feijoeiro solteiro e milho consorciado.  

#### 4. Nódulos furados (Nod_F)
- Resíduos normais e homocedásticos.  
- **Tukey:** Maior incidência de nódulos danificados no consórcio com milho; menor com cobertura morta.  

#### 5. Produtividade (Prod)
- Resíduos normais e homocedásticos.  
- **Tukey:** Cobertura morta apresentou maior produtividade (1592 kg/ha); milho consorciado a menor (676 kg/ha).  

---

## 📂 Estrutura do repositório
```
📁 Experimento_03
 ┣ 📄 README.md               <- Descrição do estudo
 ┣ 📊 Dados_Experimento_03.xls <- Base de dados
 ┣ 📄 Dados G3.doc             <- Detalhes do experimento
 ┗ 📜 script_analise.R         <- Script em R para análise
```

---

## 🚀 Reprodutibilidade
Para reproduzir as análises, basta abrir o script `script_analise.R` no **R** e executar.  
Bibliotecas necessárias:
```R
library(ExpDes.pt)
```

---

## 📌 Conclusões preliminares
- O feijoeiro **solteiro** apresentou maior infestação de insetos adultos.  
- O consórcio com **caupi** favoreceu maior nodulação, mas com danos significativos.  
- A **cobertura morta** destacou-se como melhor estratégia, com maior matéria seca dos nódulos e maior produtividade.  
- O consórcio com **milho** reduziu a infestação de insetos, mas também reduziu significativamente a produtividade.  
