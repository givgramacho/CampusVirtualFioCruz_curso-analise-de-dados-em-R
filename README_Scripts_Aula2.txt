================================================================================
README - SCRIPTS DA AULA 2
Formação Breve em Ciência de Dados e Informações para o SUS
================================================================================

VISÃO GERAL
-----------
Este conjunto contém 3 scripts progressivos de R para ensinar análise de dados
de saúde pública utilizando dados do SIM (Sistema de Informações de Mortalidade).


================================================================================
SCRIPT 1: aula2_script_1.R
================================================================================

TÍTULO: Iniciando no R - Conceitos Fundamentais

OBJETIVO:
Apresentar os conceitos básicos da linguagem R para iniciantes que nunca
programaram antes.

CONTEÚDO:
---------
SEÇÃO 1: Operações Básicas em R
  - Operações aritméticas simples (+, -, *, /)
  - Criação de variáveis (objetos)
  - Case sensitivity (diferença entre maiúsculas e minúsculas)

SEÇÃO 2: Tipos de Dados
  - Tipos básicos: integer, numeric, character, logical
  - Verificação de tipos com class()
  - Conversão entre tipos (as.integer, as.numeric)
  - Estruturas de dados: vetores, fatores, matrizes

SEÇÃO 3: Funções Básicas
  - Função sum() para somar valores
  - Função sqrt() para raiz quadrada
  - Verificação de tipos com is.numeric()

PRÉ-REQUISITOS:
- R e RStudio instalados
- Nenhum conhecimento prévio de programação necessário

DURAÇÃO ESTIMADA: 30-45 minutos

PÚBLICO-ALVO: Iniciantes absolutos em programação


================================================================================
SCRIPT 2: aula2_script_2.R
================================================================================

TÍTULO: Trabalhando com Dados - Tidyverse e Manipulação de Dados do SUS

OBJETIVO:
Ensinar manipulação de dados reais de saúde pública usando o ecossistema
tidyverse, com foco em dados do SIM.

CONTEÚDO:
---------
INSTALAÇÃO E CARREGAMENTO:
  - Instalação do tidyverse e pacotes complementares
  - Opções de instalação individual vs. meta-pacote
  - Resumo dos pacotes: dplyr, stringr, lubridate, readr, ggplot2, etc.

SEÇÃO 4: Importação de Dados
  - Importar arquivos CSV, Excel e Parquet
  - Gerenciamento de memória (remover objetos)

SEÇÃO 5: Exploração Inicial dos Dados
  - glimpse(): visualizar estrutura
  - head() e tail(): primeiras/últimas linhas
  - summary(): estatísticas descritivas

SEÇÃO 6: Análise de Frequências
  - table() do R base
  - count() do tidyverse

SEÇÃO 7: Criação e Modificação de Variáveis
  - mutate() para criar novas variáveis
  - if_else() para condições simples
  - case_when() para condições múltiplas
  - Padronização de variáveis categóricas (ex: sexo)

SEÇÃO 8: Manipulação de Datas
  - Conversão de strings para datas com lubridate
  - Extração de componentes (ano, mês, dia)
  - Análise temporal de óbitos

SEÇÃO 9: Manipulação de Strings (Texto)
  - str_sub() para extrair partes de texto
  - Processamento da variável IDADE do SIM

SEÇÃO 10: Múltiplas Transformações
  - Conversão de idades em diferentes unidades para anos
  - Pipeline de transformações encadeadas

SEÇÃO 11: Filtragem de Dados com filter()
  - Filtros simples (uma condição)
  - Filtros com múltiplas condições (E, OU lógico)
  - Tratamento de valores ausentes (NA)
  - Operador %in% para múltiplos valores
  - Filtros complexos combinados
  - 12 exemplos progressivos de filtragem

SEÇÃO 12: Combinando filter() com Outras Funções
  - filter() + select(): filtrar linhas e colunas
  - filter() + mutate(): filtrar e criar variáveis
  - filter() + group_by() + summarise(): análises por grupos
  - filter() + arrange(): filtrar e ordenar

SEÇÃO 13: Agrupamento e Agregação de Dados
  - group_by() para agrupar dados
  - summarise() para calcular estatísticas
  - Análises por mês, sexo, faixa etária

SEÇÃO 14: Joins (Junções de Tabelas)
  - left_join(), inner_join(), right_join(), full_join()
  - Exemplos conceituais de combinação de dados

SEÇÃO 15: Exercícios Práticos com filter()
  - 5 exercícios para prática individual

PRÉ-REQUISITOS:
- Completar Script 1 ou ter conhecimentos básicos de R
- R e RStudio instalados
- Pacote tidyverse instalado
- Arquivo de dados: sim_salvador_2023.csv

DURAÇÃO ESTIMADA: 2-3 horas

PÚBLICO-ALVO: Pessoas com conhecimentos básicos de R que querem aprender
manipulação de dados


================================================================================
SCRIPT 3: aula2_script_3.R
================================================================================

TÍTULO: Atividades Práticas e Visualização de Dados

OBJETIVO:
Consolidar conhecimentos através de exercícios práticos e introduzir
visualização de dados com ggplot2 e plotly.

CONTEÚDO:
---------
ATIVIDADE 1: Exploração e Transformação de Dados
  - Criar variável faixa_etaria (Criança, Adolescente, Adulto, Idoso)
  - Contar óbitos por faixa etária
  - Praticar mutate() e case_when()

ATIVIDADE 2: Manipulação de Datas e Agrupamento
  - Criar variável trimestre
  - Calcular total de óbitos e idade média por trimestre e sexo
  - Usar pivot_wider() para visualização alternativa

ATIVIDADE 3: Análise Integrada
  - Identificar mês com maior número de óbitos
  - Calcular diferença percentual entre óbitos masculinos e femininos
  - Determinar faixa etária mais afetada

ANÁLISES COMPLEMENTARES (BÔNUS):
  - Óbitos por faixa etária e sexo
  - Distribuição ao longo do ano
  - Top 5 faixas etárias mais afetadas

GUIA DE BOAS PRÁTICAS EM VISUALIZAÇÃO DE DADOS:
  - 5 Princípios Fundamentais:
    1. Clareza e Simplicidade
    2. Acessibilidade (cores amigáveis para daltônicos)
    3. Honestidade (escalas, fontes)
    4. Escolha adequada do tipo de gráfico
    5. Contexto e interpretação
  - Paletas de cores recomendadas
  - Dicas de formatação e exportação

VISUALIZAÇÕES COM ggplot2 (Estático):
  1. Gráfico de barras: Óbitos por mês
  2. Histograma: Distribuição de idade por sexo
  3. Barras agrupadas: Óbitos por faixa etária e sexo
  4. Pirâmide etária: Distribuição por sexo e idade

VISUALIZAÇÕES COM plotly (Interativo):
  1. Barras interativas: Óbitos por mês
  2. Barras agrupadas: Faixa etária x Sexo
  3. Histograma sobreposto: Distribuição etária
  4. Série temporal: Evolução mensal de óbitos
  5. Box plots: Distribuição por grupos
  6. Gráfico de pizza: Proporção por sexo
  7. Heatmap: Mês x Faixa etária

RECURSOS INCLUÍDOS:
  - Tooltips informativos
  - Zoom e pan interativos
  - Cores acessíveis e consistentes
  - Exportação para HTML e imagens
  - Conversão ggplot → plotly com ggplotly()

DICAS FINAIS:
  - Formatos de exportação (PNG, PDF, HTML)
  - Resoluções recomendadas (DPI)
  - Tamanhos ideais para diferentes usos
  - Recursos adicionais para aprendizado

PRÉ-REQUISITOS:
- Completar Scripts 1 e 2
- Pacotes instalados: tidyverse, lubridate, plotly, scales
- Arquivo processado: sim_salvador_2023_processado.csv

DURAÇÃO ESTIMADA: 2-3 horas

PÚBLICO-ALVO: Pessoas que completaram os Scripts 1 e 2 e querem consolidar
conhecimentos através de exercícios práticos e aprender visualização de dados


================================================================================
SEQUÊNCIA RECOMENDADA DE ESTUDO
================================================================================

DIA 1 - MANHÃ:
1. Instalação do R e RStudio
2. Script 1: Conceitos fundamentais (30-45 min)
3. Pausa
4. Script 2: Início da manipulação de dados (60-90 min)

DIA 1 - TARDE:
1. Script 2: Continuação - filtros e agrupamentos (60-90 min)
2. Pausa
3. Início das atividades do Script 3 (45 min)

DIA 2 - MANHÃ:
1. Revisão das atividades do Script 3 (30-45 min)
2. Visualização de dados com ggplot2 (60 min)
3. Pausa
4. Visualização interativa com plotly (45-60 min)


================================================================================
DADOS NECESSÁRIOS
================================================================================

ARQUIVO PRINCIPAL:
- sim_salvador_2023.csv (dados brutos do SIM)

ARQUIVO PROCESSADO:
- sim_salvador_2023_processado.csv (gerado pelo Script 2)

ESTRUTURA ESPERADA DO DATASET:
- SEXO: variável categórica (0=Ignorado, 1=Masculino, 2=Feminino)
- DTOBITO: data do óbito (formato ddmmyyyy)
- IDADE: idade codificada (primeiro dígito = tipo, demais = quantidade)
- Outras variáveis do SIM conforme dicionário de dados

FONTE DOS DADOS:
Sistema de Informações de Mortalidade (SIM) - DATASUS


================================================================================
PACOTES R NECESSÁRIOS
================================================================================

ESSENCIAIS:
- tidyverse (meta-pacote que inclui dplyr, ggplot2, tidyr, readr, etc.)
- lubridate (manipulação de datas)
- readxl (leitura de arquivos Excel)

PARA VISUALIZAÇÃO:
- plotly (gráficos interativos)
- scales (formatação de escalas)

PARA EXPORTAÇÃO:
- htmlwidgets (salvar gráficos plotly como HTML)

INSTALAÇÃO:
install.packages(c("tidyverse", "lubridate", "readxl", "plotly", "scales"))


================================================================================
OBJETIVOS DE APRENDIZAGEM
================================================================================

Ao completar os 3 scripts, o aluno será capaz de:

1. FUNDAMENTOS:
   ✓ Compreender tipos de dados em R
   ✓ Criar e manipular variáveis
   ✓ Usar funções básicas

2. MANIPULAÇÃO DE DADOS:
   ✓ Importar dados de diferentes formatos
   ✓ Explorar e limpar dados
   ✓ Criar novas variáveis derivadas
   ✓ Filtrar dados com múltiplas condições
   ✓ Agrupar e agregar dados
   ✓ Trabalhar com datas e strings

3. ANÁLISE:
   ✓ Calcular frequências e percentuais
   ✓ Realizar análises descritivas
   ✓ Comparar grupos
   ✓ Identificar padrões temporais

4. VISUALIZAÇÃO:
   ✓ Criar gráficos estáticos profissionais (ggplot2)
   ✓ Criar gráficos interativos (plotly)
   ✓ Aplicar boas práticas de visualização
   ✓ Exportar gráficos em diferentes formatos
   ✓ Escolher o tipo de gráfico adequado


================================================================================
RECURSOS ADICIONAIS
================================================================================

DOCUMENTAÇÃO OFICIAL:
- R: https://www.r-project.org/
- RStudio: https://posit.co/
- Tidyverse: https://www.tidyverse.org/
- ggplot2: https://ggplot2.tidyverse.org/
- plotly: https://plotly.com/r/

TUTORIAIS E CURSOS:
- R for Data Science (livro gratuito): https://r4ds.had.co.nz/
- RStudio Primers: https://posit.cloud/learn/primers
- Galeria de gráficos R: https://r-graph-gallery.com/

DADOS DE SAÚDE:
- DATASUS: https://datasus.saude.gov.br/
- Dicionários de dados do SIM
- TabNet - Estatísticas de mortalidade


================================================================================
SUPORTE E DÚVIDAS
================================================================================

Durante o curso:
- Tire dúvidas com os instrutores
- Compartilhe dificuldades com colegas
- Revise os comentários nos scripts

Após o curso:
- Consulte a documentação oficial dos pacotes
- Use fóruns: Stack Overflow, RStudio Community
- Pratique com seus próprios dados


================================================================================
LICENÇA E USO
================================================================================

Este material foi desenvolvido para o curso "Formação Breve em Ciência de 
Dados e Informações para o SUS".

Os scripts podem ser usados livremente para fins educacionais, pesquisa e 
análise de dados de saúde pública.

Ao utilizar este material, por favor:
- Cite a fonte apropriadamente
- Mantenha os créditos originais
- Compartilhe melhorias com a comunidade


================================================================================
CONTATO
================================================================================

Para dúvidas, sugestões ou feedback sobre o material didático, entre em 
contato com a equipe do curso.


================================================================================
ÚLTIMA ATUALIZAÇÃO: Novembro 2024
================================================================================
