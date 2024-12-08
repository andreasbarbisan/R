#' ---
#' title: "APS 1 Micro IV 2024.2"
#' author: Andreas Azambuja Barbisan, Bruno Frasão Brazil Leiros, Diogo Roecker Cardozo
#'   e Lorena Liz Giusti e Santos
#' date: "2024-08-22"
#' output: pdf_document
#' lang: pt-BR
#' fontsize: 11pt 
#' geometry: margin=0.9in
#' ---
#' # WD
## ----setup, include=FALSE----------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

# Definição de WD
setwd("C:/Andreas/APS1 Micro 4/APS1")

#' 
#' 
#' 
#' 
#' # Bibliotecas
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
# Bibliotecas
library(dplyr)
library(haven)
library(plm) 
library(tidyverse)
library(pastecs) 
library(fastDummies)
library(stargazer) 
library(sandwich) 
library(tidyr)

#' 
#' 
#' 
#' 
#' # Dados
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
# Ler todas as bases
base1 = read_dta('Base1_APS1.dta')
base2 = read_dta('Base2_APS1.dta')
base3 = read_dta('Base3_APS1.dta')

#Juntar todas em uma só
base = base1 |> 
  inner_join(base2, by = c("state", "year")) |> 
  inner_join(base3, by = c("state", "year"))

base |> view()

#' 
#' 
#' 
#' 
#' 
#' 
#' # Balanceamento
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
pdim(base)

#' 
#' 
#' 
#' 
#' 
#' 
#' # Estatística Descritiva
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
# Estatísticas descritivas das variáveis usadas nas regressões
stat.desc(base$RTC, basic = FALSE, norm = FALSE)
stat.desc(base$ln_property_rate, basic = FALSE, norm = FALSE)
stat.desc(base$ln_incarc_rate, basic = FALSE, norm = FALSE)
stat.desc(base$ln_violent_rate, basic = FALSE, norm = FALSE)
stat.desc(base$ln_DeathsHomi_rate, basic = FALSE, norm = FALSE)
stat.desc(base$ln_DeathsHomi_fire_rate, basic = FALSE, norm = FALSE)
stat.desc(base$ln_DeathsHomi_nonfire_rate, basic = FALSE, norm = FALSE)

#' 
#' 
#' 
#' 
#' 
#' 
#' # Gráficos
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_property_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "Gráfico de Dispersão de ln_property_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_property_rate") +
  theme_gray()

#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_incarc_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "Gráfico de Dispersão de ln_incarc_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_incarc_rate") +
  theme_gray()

#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_violent_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "Gráfico de Dispersão de ln_violent_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_violent_rate") +
  theme_gray()

#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_DeathsHomi_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Gráfico de Dispersão de ln_DeathsHomi_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_DeathsHomi_rate") +
  theme_gray()


#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_DeathsHomi_fire_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "Gráfico de Dispersão de ln_DeathsHomi_fire_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_DeathsHomi_fire_rate") +
  theme_gray()

#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
base |>
  ggplot(aes(x = year, y = ln_DeathsHomi_nonfire_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "Gráfico de Dispersão de ln_DeathsHomi_nonfire_rate ao Longo dos Anos",
       x = "Anos",
       y = "ln_DeathsHomi_nonfire_rate") +
  theme_gray()

#' 
#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
data_summary = base |>
  group_by(year) |>
  summarise(count_RTC = sum(RTC, na.rm = TRUE),
            avg_exp_property_rate_RTC1 = mean(exp(ln_property_rate[RTC == 1]), na.rm = TRUE))

scale_factor = max(data_summary$count_RTC) / max(data_summary$avg_exp_property_rate_RTC1)

ggplot(data_summary, aes(x = year)) +
  geom_line(aes(y = count_RTC, color = "Contagem de RTC")) +
  geom_point(aes(y = count_RTC, color = "Contagem de RTC")) +
  geom_line(aes(y = avg_exp_property_rate_RTC1 * scale_factor, color = "Média property_rate para RTC = 1")) +
  geom_point(aes(y = avg_exp_property_rate_RTC1 * scale_factor, color = "Média property_rate para RTC = 1")) +
  scale_y_continuous(
    name = "Contagem de RTC",
    sec.axis = sec_axis(~ . / scale_factor, name = "Média property_rate para RTC = 1")
  ) +
  labs(title = "Contagem de Dummies Positivas (RTC) e Média property_rate (RTC = 1) por Ano",
       x = "Ano") +
  scale_color_manual(values = c("Contagem de RTC" = "blue", "Média property_rate para RTC = 1" = "red")) +
  theme_gray() +
  theme(
    axis.title.y.right = element_text(color = "red"),
    axis.title.y.left = element_text(color = "blue")
  )



#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
# Calculando a soma total de cada grupo por ano
data_long = base |>
  group_by(year) |>
  summarise(
    total_bm_1019 = sum(age_bm_1019, na.rm = TRUE),
    total_bm_2029 = sum(age_bm_2029, na.rm = TRUE),
    total_bm_3039 = sum(age_bm_3039, na.rm = TRUE),
    total_wm_1019 = sum(age_wm_1019, na.rm = TRUE),
    total_wm_2029 = sum(age_wm_2029, na.rm = TRUE),
    total_wm_3039 = sum(age_wm_3039, na.rm = TRUE),
    total_bf_1019 = sum(age_bf_1019, na.rm = TRUE),
    total_bf_2029 = sum(age_bf_2029, na.rm = TRUE),
    total_bf_3039 = sum(age_bf_3039, na.rm = TRUE),
    total_wf_1019 = sum(age_wf_1019, na.rm = TRUE),
    total_wf_2029 = sum(age_wf_2029, na.rm = TRUE),
    total_wf_3039 = sum(age_wf_3039, na.rm = TRUE)
  ) |>
  pivot_longer(cols = -year, names_to = "group", values_to = "count")

# Porcentagem de cada grupo em relação ao total de todos os grupos no ano
data_long = data_long |>
  group_by(year) |>
  mutate(total_year = sum(count),  # Calcula o total de todos os grupos por ano
         percent = count / total_year * 100)  # Calcula a porcentagem corretamente

# Criando um mapeamento de labels descritivos para cada grupo
group_labels = c(
  "total_bm_1019" = "Homens Negros (10-19 anos)",
  "total_bm_2029" = "Homens Negros (20-29 anos)",
  "total_bm_3039" = "Homens Negros (30-39 anos)",
  "total_bf_1019" = "Mulheres Negras (10-19 anos)",
  "total_bf_2029" = "Mulheres Negras (20-29 anos)",
  "total_bf_3039" = "Mulheres Negras (30-39 anos)",
  "total_wm_1019" = "Homens Brancos (10-19 anos)",
  "total_wm_2029" = "Homens Brancos (20-29 anos)",
  "total_wm_3039" = "Homens Brancos (30-39 anos)",
  "total_wf_1019" = "Mulheres Brancas (10-19 anos)",
  "total_wf_2029" = "Mulheres Brancas (20-29 anos)",
  "total_wf_3039" = "Mulheres Brancas (30-39 anos)"
)

# Definir as cores personalizadas para os grupos
custom_colors = c(
  "total_bm_1019" = "#4B0082",  
  "total_bm_2029" = "#5A4699",  
  "total_bm_3039" = "#6A8EB7",  
  "total_bf_1019" = "#8B4513",  
  "total_bf_2029" = "#A0522D",  
  "total_bf_3039" = "#CD853F",  
  "total_wm_1019" = "#FFA07A",  
  "total_wm_2029" = "#FF7F50",  
  "total_wm_3039" = "#FF6347",  
  "total_wf_1019" = "#FFB6C1",  
  "total_wf_2029" = "#FF69B4",  
  "total_wf_3039" = "#FF1493"   
)

# Criando o gráfico de áreas empilhadas com as cores personalizadas e limite até 100%
ggplot(data_long, aes(x = year, y = percent / 100, fill = group)) +  
  geom_area() +
  scale_fill_manual(values = custom_colors, labels = group_labels) +  
  scale_y_continuous(labels = scales::percent_format(), limits = c(0, 1)) +  
  labs(
    title = "Distribuição Percentual de Grupos Demográficos até 40 anos",
    x = "Ano",
    y = "Percentual",
    fill = "Grupo Demográfico"
  ) +
  theme_gray()




#' 
#' 
## ----message = FALSE, warning = FALSE----------------------------------------------------------------------------

# Filtrando os dados para RTC = 1 e RTC = 0, e calculando a média de ln_property_rate
data_rtc1 <- base |>
  filter(RTC == 1) |>
  group_by(year) |>
  summarise(mean_ln_property_rate = mean(ln_property_rate, na.rm = TRUE)) |>
  mutate(RTC = "RTC = 1")  # Criando uma coluna para RTC = 1

data_rtc0 <- base |>
  filter(RTC == 0) |>
  group_by(year) |>
  summarise(mean_ln_property_rate = mean(ln_property_rate, na.rm = TRUE)) |>
  mutate(RTC = "RTC = 0")  # Criando uma coluna para RTC = 0

# Combinando os dois datasets
combined_data <- bind_rows(data_rtc1, data_rtc0)

# Criando o gráfico combinado com RTC = 1 e RTC = 0 usando ln_property_rate
ggplot(combined_data, aes(x = year, y = mean_ln_property_rate, color = RTC, linetype = RTC)) +
  geom_line() +  
  scale_color_manual(values = c("RTC = 1" = "blue", "RTC = 0" = "red")) +  
  labs(
    title = "Evolução de ln_property_rate por RTC ao longo do tempo",
    x = "Ano",
    y = "ln_property_rate",
    color = "Grupo RTC",
    linetype = "Grupo RTC"
  ) +
  theme_gray()  


#' 
#' 
#' # Regressão
#' 
#' 
## ----message = FALSE, warning=FALSE------------------------------------------------------------------------------
# Pooling com efeito fixo de tempo, mas não por condado
pols = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate + age_bm_1019 + age_bm_2029 + age_bm_3039 + age_wm_1019 + age_wm_2029 + age_wm_3039 +factor(year),
      data = _,
      model = "pooling")

# Efeitos Fixos
fe = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate +
        age_bm_1019 + age_bm_2029 + age_bm_3039 + age_wm_1019 + age_wm_2029 + age_wm_3039 + factor(year) + factor(state),
      data = _,
      model = "within")

# Efeitos Aleatórios 
re = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate +
        age_bm_1019 + age_bm_2029 + age_bm_3039 + age_wm_1019 + age_wm_2029 + age_wm_3039,
      data = _,
      model = "random",
      random.method = "walhus")

# Teste de Hausman
hausman_test = phtest(fe, re)

# Extrair o chi-square e o p-valor do teste de Hausman
hausman_chisq = formatC(hausman_test$statistic, format = "f", digits = 4)
hausman_pvalue = formatC(hausman_test$p.value, format = "f", digits = 4)

# Comparando os três modelos (POLS vs FE vs RE) e incluindo o teste de Hausman - Saída no CONSOLE (formato texto)
stargazer(pols, fe, re,
          column.labels = c("POLS", "FE", "RE"),
          type = "text",
          omit = c("year", "state"),
          add.lines = list(
            c("Year FE", "Yes", "Yes", "No"),
            c("State FE", "No", "Yes", "No"),
            c("Hausman Test Chi-Sq", "", "", hausman_chisq),
            c("Hausman Test p-value", "", "", hausman_pvalue)
          ))

# Comparando os três modelos (POLS vs FE vs RE) e incluindo o teste de Hausman - Saída em LaTeX
stargazer(pols, fe, re,
          column.labels = c("POLS", "FE", "RE"),
          type = "latex",                   # Saída em LaTeX
          out = "regressoes_output.tex",    # Salvando o arquivo LaTeX
          omit = c("year", "state"),
          add.lines = list(
            c("Year FE", "Yes", "Yes", "No"),
            c("State FE", "No", "Yes", "No"),
            c("Hausman Test Chi-Sq", "", "", hausman_chisq),
            c("Hausman Test p-value", "", "", hausman_pvalue)
          ))

# Resultado do Teste de Hausman (no console)
print(hausman_test)



#' 
#' # Regressão mas sem fatores demográficos como regressores
## ----message = FALSE, warning = FALSE----------------------------------------------------------------------------
# Pooling com efeito fixo de tempo, mas não por condado
pols = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate + factor(year),
      data = _,
      model = "pooling")

# Efeitos Fixos
fe = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate + factor(year) + factor(state),
      data = _,
      model = "within")

# Efeitos Aleatórios 
re = base |>
  plm(ln_property_rate ~ RTC + ln_incarc_rate + ln_violent_rate + ln_DeathsHomi_rate + ln_DeathsHomi_fire_rate + ln_DeathsHomi_nonfire_rate,
      data = _,
      model = "random",
      random.method = "walhus")

# Teste de Hausman
hausman_test = phtest(fe, re)

# Extrair o chi-square e o p-valor do teste de Hausman
hausman_chisq = formatC(hausman_test$statistic, format = "f", digits = 4)
hausman_pvalue = formatC(hausman_test$p.value, format = "f", digits = 4)

# Comparando os três modelos (POLS vs FE vs RE) e incluindo o teste de Hausman
stargazer(pols, fe, re,
          column.labels = c("POLS", "FE", "RE"),
          type = "text",
          omit = c("year", "state"),
          add.lines = list(
            c("Year FE", "Yes", "Yes", "No"),
            c("State FE", "No", "Yes", "No"),
            c("Hausman Test Chi-Sq", "", "", hausman_chisq),
            c("Hausman Test p-value", "", "", hausman_pvalue)
          ))
# Comparando os três modelos (POLS vs FE vs RE) e incluindo o teste de Hausman - Saída em LaTeX
stargazer(pols, fe, re,
          column.labels = c("POLS", "FE", "RE"),
          type = "latex",                   # Saída em LaTeX
          out = "regressoes_output.tex",    # Salvando o arquivo LaTeX
          omit = c("year", "state"),
          add.lines = list(
            c("Year FE", "Yes", "Yes", "No"),
            c("State FE", "No", "Yes", "No"),
            c("Hausman Test Chi-Sq", "", "", hausman_chisq),
            c("Hausman Test p-value", "", "", hausman_pvalue)
          ))


# Resultados do Teste de Hausman
print(hausman_test)


#' 
#' 
