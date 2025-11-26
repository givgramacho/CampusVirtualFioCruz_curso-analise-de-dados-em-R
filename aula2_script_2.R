# ==============================================================================
# AULA 2 - INTRODUÇÃO À LINGUAGEM DE PROGRAMAÇÃO R
# Curso: Análise de Dados para Pesquisa no SUS
# Script: Trabalhando com Dados 
# ==============================================================================

# ------------------------------------------------------------------------------
# INSTALAÇÃO (executar apenas uma vez)
# ------------------------------------------------------------------------------

# OPÇÃO 1: Instalação usando Tidyverse (RECOMENDADO - mais simples)
# O Tidyverse já inclui vários pacotes essenciais
install.packages("tidyverse")  # Inclui: dplyr, stringr, lubridate, readr, ggplot2 e outros
install.packages("readxl")     # Leitura de arquivos Excel
install.packages("arrow")      # Leitura de arquivos Parquet

# OPÇÃO 2: Instalação individual de cada pacote
# Use esta opção se quiser instalar apenas pacotes específicos
install.packages("dplyr")      # Manipulação de dados
install.packages("stringr")    # Manipulação de strings/texto
install.packages("lubridate")  # Manipulação de datas
install.packages("readr")      # Leitura de arquivos CSV
install.packages("ggplot2")    # Criação de gráficos
install.packages("tibble")     # Trabalhar com tibbles (dataframes modernos)
install.packages("tidyr")      # Organização de dados
install.packages("readxl")     # Leitura de arquivos Excel
install.packages("arrow")      # Leitura de arquivos Parquet

# ------------------------------------------------------------------------------
# CARREGAMENTO (executar toda vez que abrir o R/RStudio)
# ------------------------------------------------------------------------------

# OPÇÃO 1: Carregamento usando Tidyverse (RECOMENDADO - mais simples)
library(tidyverse)   # Carrega automaticamente: dplyr, stringr, lubridate, 
                     # readr, ggplot2, tibble, tidyr, purrr e forcats
library(readxl)      # Leitura de arquivos Excel (.xlsx, .xls)
library(arrow)       # Leitura de arquivos Parquet

# OPÇÃO 2: Carregamento individual de cada pacote
# Use esta opção se quiser controlar exatamente quais pacotes estão ativos
library(dplyr)       # Funções: mutate, filter, select, group_by, summarise, etc.
library(stringr)     # Funções: str_sub, str_replace, str_detect, etc.
library(lubridate)   # Funções: dmy, ymd, month, year, day, etc.
library(readr)       # Funções: read_csv, write_csv
library(ggplot2)     # Funções: ggplot, geom_col, geom_point, etc.
library(tibble)      # Funções: tibble, as_tibble
library(tidyr)       # Funções: pivot_wider, pivot_longer
library(readxl)      # Funções: read_excel
library(arrow)       # Funções: read_parquet, write_parquet

# ------------------------------------------------------------------------------
# RESUMO DOS PACOTES E SUAS FUNÇÕES PRINCIPAIS
# ------------------------------------------------------------------------------

# tidyverse (meta-pacote que inclui 8 pacotes principais):
#   ├── dplyr      → Manipulação de dados
#   ├── stringr    → Manipulação de strings
#   ├── lubridate  → Manipulação de datas
#   ├── readr      → Leitura/escrita de arquivos CSV
#   ├── ggplot2    → Criação de gráficos
#   ├── tibble     → Dataframes modernos
#   ├── tidyr      → Organização de dados
#   └── purrr      → Programação funcional

# Pacotes adicionais (não incluídos no tidyverse):
#   ├── readxl     → Leitura de arquivos Excel
#   └── arrow      → Leitura de arquivos Parquet

# ------------------------------------------------------------------------------
# VERIFICAR PACOTES CARREGADOS
# ------------------------------------------------------------------------------

# Ver quais pacotes estão atualmente carregados
search()

# Ver a versão de um pacote específico
packageVersion("tidyverse")
packageVersion("dplyr")

# ------------------------------------------------------------------------------
# CONFIGURAÇÃO INICIAL
# ------------------------------------------------------------------------------

# Definir diretório de trabalho
# Altere para o caminho correto no seu computador
setwd("C:/caminho/para/sua/pasta")

# Verificar diretório atual
getwd()


# ------------------------------------------------------------------------------
# SEÇÃO 4: IMPORTAÇÃO DE DADOS
# ------------------------------------------------------------------------------

# 4.1 Importar arquivo CSV
df_csv <- read_csv("sim_salvador_2023.csv")
# df_csv <- read_csv("C:/caminho/para/sua/pasta/sim_salvador_2023.csv") <-- você pode escrever assim também
 
# 4.2 Importar arquivo Excel
df_xlsx <- read_excel("sim_salvador_2023.xlsx")

# 4.3 Importar arquivo Parquet
df_parquet <- read_parquet("sim_salvador_2023.parquet")

# 4.4 Remover dataframes duplicados da memória
rm(df_xlsx, df_parquet)

# ------------------------------------------------------------------------------
# SEÇÃO 5: EXPLORAÇÃO INICIAL DOS DADOS
# ------------------------------------------------------------------------------

# 5.1 Visualizar estrutura dos dados
glimpse(df_csv)
# Saída mostra: nome das variáveis, tipo e exemplos de valores

# 5.2 Visualizar primeiras linhas
head(df_csv)

# 5.3 Visualizar últimas linhas
tail(df_csv)

# 5.4 Resumo estatístico
summary(df_csv)

# ------------------------------------------------------------------------------
# SEÇÃO 6: ANÁLISE DE FREQUÊNCIAS
# ------------------------------------------------------------------------------

# 6.1 Usando table() do R base
table(df_csv$SEXO, useNA = "always")


# 6.2 Usando count() do Tidyverse (mais intuitivo)
df_csv %>% 
  count(SEXO, sort = TRUE)


# ------------------------------------------------------------------------------
# SEÇÃO 7: CRIAÇÃO E MODIFICAÇÃO DE VARIÁVEIS
# ------------------------------------------------------------------------------

# 7.1 Criar variável SEXO padronizada usando if_else
df_csv <- df_csv %>%
  mutate(
    sexo_p = if_else(SEXO == 1, "Masculino",
                     if_else(SEXO == 2, "Feminino", 
                             if_else(SEXO == 0, "Ignorado", NA_character_)))
  )

# Verificar resultado
# Verificar resultado (mesmo resultado do if_else)
df_csv %>% count(SEXO)   # Antes: variável SEXO original (valores numéricos: 0, 1, 2)
df_csv %>% count(sexo_p) # Depois: variável sexo_p transformada (valores em texto)


# 7.2 Alternativa usando case_when (mais limpo para múltiplas condições)
df_csv <- df_csv %>%
  mutate(
    sexo_2 = case_when(
      SEXO == 1 ~ "Masculino",
      SEXO == 2 ~ "Feminino",
      SEXO == 0 ~ "Ignorado",
      is.na(SEXO) ~ NA_character_
    )
  )

# Verificar resultado (mesmo resultado do if_else)
df_csv %>% count(SEXO)   # Antes: variável SEXO original (valores numéricos: 0, 1, 2)
df_csv %>% count(sexo_2) # Depois: variável sexo_2 transformada (valores em texto)

# ------------------------------------------------------------------------------
# SEÇÃO 8: MANIPULAÇÃO DE DATAS
# ------------------------------------------------------------------------------

# 8.1 Converter variável de data (formato ddmmyyyy para Date)
df_csv <- df_csv %>%
  mutate(
    DTOBITO_dt = dmy(DTOBITO)  # dmy = dia-mês-ano
  )

# 8.2 Extrair ano da data
df_csv <- df_csv %>%
  mutate(
    ano_obito = year(DTOBITO_dt)
  )

# 8.3 Verificar as transformações
glimpse(df_csv)

# 8.4 Contar óbitos por ano
df_csv %>% count(ano_obito)

# 8.5 Contar óbitos por sexo e ano
df_csv %>% count(sexo_p, ano_obito)

# ------------------------------------------------------------------------------
# SEÇÃO 9: MANIPULAÇÃO DE STRINGS (TEXTO)
# ------------------------------------------------------------------------------

# 9.1 Extrair partes de uma string
# A variável IDADE tem formato: primeiro dígito = tipo (ex: dias, meses ou anos), demais = quantidade
# Exemplo: "204" = 4 dias, "305" = 5 meses, "450" = 50 anos

# Extrair primeiro caractere (tipo de idade)
df_csv <- df_csv %>%
  mutate(
    tipo_idade = str_sub(IDADE, 1, 1),    # Posição 1 até 1
    idade = str_sub(IDADE, 2)              # Posição 2 até o final
  )

# Verificar resultado
df_csv %>%
  select(IDADE, tipo_idade, idade) %>% # select seleciona apenas as variáveis dentro dos parênteses
  head() # visualiza apenas o início da tabela



# ------------------------------------------------------------------------------
# SEÇÃO 10: MÚLTIPLAS TRANSFORMAÇÕES
# ------------------------------------------------------------------------------
# Regra de conversão:
# - Se tipo_idade 0 a 3 (minutos, horas, dias, meses) → considera 0 anos (< 1 ano)
# - Se tipo_idade 4 (já está em anos) → usa o valor direto
# - Se tipo_idade 5 (centenários) → soma 100 + valor

# 10.1 Aplicar todas as transformações de uma vez
df_csv <- df_csv %>%
  mutate(
    tipo_idade = str_sub(IDADE, 1, 1), # Extrai posição 1
    idade = str_sub(IDADE, 2), # Extrai da posição 2 em diante
    idade_anos = case_when(
      tipo_idade <= 3 ~ 0, # Menores de 1 ano
      tipo_idade == 4 ~ as.numeric(idade), # Já em anos
      tipo_idade == 5 ~ 100 + as.numeric(idade) # Centenários
    )
  )

# Verificar estrutura final
glimpse(df_csv)
# Verificar resultado
View(df_csv)

# ------------------------------------------------------------------------------
# SEÇÃO 11: FILTRAGEM DE DADOS COM filter()
# ------------------------------------------------------------------------------
# O filter() é uma das funções mais importantes do dplyr/tidyverse
# Ele permite SELECIONAR LINHAS baseado em condições lógicas

# 11.1 Filtro simples - Uma condição
# Filtrar apenas óbitos do sexo masculino
df_masculino <- df_csv %>%
  filter(sexo_p == "Masculino")

# Verificar resultado
df_masculino %>% count(sexo_p)
nrow(df_masculino) # Contar número de linhas

# 11.2 Filtrar valores numéricos
# Óbitos de pessoas com 65 anos ou mais (idosos)
df_idosos <- df_csv %>%
  filter(idade_anos >= 65)

# Verificar resultado
summary(df_idosos$idade_anos)

# 11.3 Múltiplas condições com E lógico (&)
# Óbitos de mulheres com 65 anos ou mais
df_idosas <- df_csv %>%
  filter(sexo_p == "Feminino" & idade_anos >= 65)

# Alternativa: usar vírgula (equivalente ao &)
df_idosas_v2 <- df_csv %>%
  filter(sexo_p == "Feminino", idade_anos >= 65)

# Verificar que dá o mesmo resultado
nrow(df_idosas)
nrow(df_idosas_v2)

# 11.4 Múltiplas condições com OU lógico (|)
# Óbitos de crianças (< 1 ano) OU idosos (>= 65 anos)
df_extremos <- df_csv %>%
  filter(idade_anos < 1 | idade_anos >= 65)

# Verificar resultado
df_extremos %>%
  count(idade_anos) %>%
  arrange(idade_anos)

# 11.5 Filtrar por valores ausentes (NA)
# Óbitos com sexo não informado
df_sexo_na <- df_csv %>%
  filter(is.na(sexo_p))

nrow(df_sexo_na)

# 11.6 Filtrar EXCLUINDO valores ausentes
# Óbitos com idade informada (remove NAs)
df_idade_conhecida <- df_csv %>%
  filter(!is.na(idade_anos))

# O símbolo ! significa "NÃO" (negação)
# !is.na() = "NÃO é NA" = "tem valor"

# 11.7 Filtrar por múltiplos valores usando %in%
# Óbitos em meses específicos (Janeiro, Fevereiro, Março)
df_primeiro_trimestre <- df_csv %>%
  mutate(mes_obito = month(DTOBITO_dt)) %>%
  filter(mes_obito %in% c(1, 2, 3))

# Verificar resultado
df_primeiro_trimestre %>% count(mes_obito)

# 11.8 Filtrar usando operador NOT IN (excluir valores)
# Óbitos EXCETO os de sexo ignorado
df_sexo_conhecido <- df_csv %>%
  filter(!sexo_p %in% c("Ignorado", NA))

# Verificar resultado
df_sexo_conhecido %>% count(sexo_p)

# 11.9 Filtros com strings (texto) - usar str_detect()
# Exemplo: se houver campo de município de residência
# df_salvador <- df_csv %>%
#   filter(str_detect(CODMUNRES, "^2927408")) # Código IBGE de Salvador

# 11.10 Filtros complexos combinados
# Óbitos de mulheres adultas (18-64 anos) no primeiro semestre
df_filtro_complexo <- df_csv %>%
  mutate(mes_obito = month(DTOBITO_dt)) %>%
  filter(
    sexo_p == "Feminino",          # Mulheres
    idade_anos >= 18,               # Maior de idade
    idade_anos < 65,                # Não idosa
    mes_obito <= 6,                 # Primeiro semestre
    !is.na(idade_anos)              # Idade conhecida
  )

# Verificar resultado
glimpse(df_filtro_complexo)
nrow(df_filtro_complexo)

# 11.11 Filtrar e contar em uma linha
# Quantos óbitos masculinos em 2023?
df_csv %>%
  filter(sexo_p == "Masculino", ano_obito == 2023) %>%
  nrow()

# 11.12 Filtrar por faixas etárias
# Criar análise por grupos etários
df_csv %>%
  filter(!is.na(idade_anos)) %>%
  mutate(
    faixa_etaria = case_when(
      idade_anos < 1 ~ "< 1 ano",
      idade_anos >= 1 & idade_anos < 18 ~ "1-17 anos",
      idade_anos >= 18 & idade_anos < 60 ~ "18-59 anos",
      idade_anos >= 60 ~ "60+ anos"
    )
  ) %>%
  count(faixa_etaria, sexo_p)

# ------------------------------------------------------------------------------
# SEÇÃO 12: COMBINANDO filter() COM OUTRAS FUNÇÕES
# ------------------------------------------------------------------------------

# 12.1 Filter + Select (filtrar linhas E colunas)
# Selecionar apenas algumas variáveis para idosos
df_idosos_resumo <- df_csv %>%
  filter(idade_anos >= 65) %>%
  select(DTOBITO_dt, sexo_p, idade_anos, ano_obito)

View(df_idosos_resumo)

# 12.2 Filter + Mutate (filtrar E criar novas variáveis)
# Calcular tempo de vida para centenários
df_centenarios <- df_csv %>%
  filter(idade_anos >= 100) %>%
  mutate(
    decadas_vida = idade_anos / 10,
    categoria = "Centenário"
  )

View(df_centenarios)

# 12.3 Filter + Group_by + Summarise (análise por grupos filtrados)
# Estatísticas de idade por sexo, apenas para adultos
df_adultos_stats <- df_csv %>%
  filter(idade_anos >= 18, !is.na(sexo_p)) %>%
  group_by(sexo_p) %>%
  summarise(
    n = n(),
    idade_media = mean(idade_anos, na.rm = TRUE),
    idade_mediana = median(idade_anos, na.rm = TRUE),
    idade_min = min(idade_anos, na.rm = TRUE),
    idade_max = max(idade_anos, na.rm = TRUE)
  )

View(df_adultos_stats)

# 12.4 Filter + Arrange (filtrar E ordenar)
# Top 10 óbitos mais jovens
df_mais_jovens <- df_csv %>%
  filter(!is.na(idade_anos)) %>%
  arrange(idade_anos) %>%
  head(10) %>%
  select(DTOBITO_dt, sexo_p, idade_anos)

View(df_mais_jovens)

# ------------------------------------------------------------------------------
# SEÇÃO 13: AGRUPAMENTO E AGREGAÇÃO DE DADOS
# ------------------------------------------------------------------------------

# 13.1 Agrupar óbitos por mês
df_csv_agrupado <- df_csv %>%
  mutate(mes_obito = month(DTOBITO_dt, label = TRUE)) %>% # Passo 1: Extrair o mês da data de óbito
  group_by(mes_obito) %>% # Passo 2: Agrupar os dados por mês
  summarise( # Passo 3: Calcular estatísticas para cada grupo (mês)
    total_obitos = n(),  # Conta o número de óbitos
    idade_media = mean(idade_anos, na.rm = TRUE) # Calcula a idade média
  )

View(df_csv_agrupado)


# 13.2 Agrupar por sexo e calcular estatísticas: outro exemplo

df_csv %>%
  group_by(sexo_p) %>%
  summarise(
    n = n(),
    idade_media = mean(idade_anos, na.rm = TRUE),
    idade_min = min(idade_anos, na.rm = TRUE),
    idade_max = max(idade_anos, na.rm = TRUE)
  )

# ------------------------------------------------------------------------------
# SEÇÃO 14: JOINS (JUNÇÕES DE TABELAS)
# ------------------------------------------------------------------------------

# Exemplo conceitual - ajuste conforme seus dados reais

# 14.1 Left Join - mantém todas as linhas da tabela à esquerda
# resultado <- df_sim %>%
#   left_join(df_populacao, by = "codigo_ibge")

# 14.2 Inner Join - mantém apenas linhas com correspondência
# resultado <- df_sim %>%
#   inner_join(df_populacao, by = "codigo_ibge")

# 14.3 Right Join - mantém todas as linhas da tabela à direita
# resultado <- df_sim %>%
#   right_join(df_populacao, by = "codigo_ibge")

# 14.4 Full Join - mantém todas as linhas de ambas as tabelas
# resultado <- df_sim %>%
#   full_join(df_populacao, by = "codigo_ibge")


# ------------------------------------------------------------------------------
# SEÇÃO 15: EXERCÍCIOS PRÁTICOS COM filter()
# ------------------------------------------------------------------------------

# EXERCÍCIO 1: Filtrar óbitos de crianças (< 1 ano)
# Sua resposta aqui:


# EXERCÍCIO 2: Filtrar óbitos do sexo feminino em 2023
# Sua resposta aqui:


# EXERCÍCIO 3: Filtrar óbitos de pessoas entre 30 e 50 anos
# Sua resposta aqui:


# EXERCÍCIO 4: Quantos óbitos de idosos (65+) ocorreram em cada sexo?
# Sua resposta aqui:


# EXERCÍCIO 5: Criar um subset dos dados apenas com idade conhecida e sexo conhecido
# Sua resposta aqui:


# ------------------------------------------------------------------------------
# FIM DO SCRIPT
# ------------------------------------------------------------------------------
# Salvar o dataframe processado (opcional)
write_csv(df_csv, "sim_salvador_2023_processado.csv")
# write_parquet(df_csv, "sim_salvador_2023_processado.parquet")
