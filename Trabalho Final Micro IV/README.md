# Projeto - Impacto do Ensino Integral em São Paulo: Análise com Diferenças em Diferenças

Este projeto investiga o impacto do Ensino Integral no desempenho educacional dos alunos em São Paulo, aplicando a metodologia de Diferenças em Diferenças (DiD) com o estimador de Callaway-Sant'Anna. Primeiramente, uma análise comparativa internacional foi realizada usando dados do PISA para contextualizar os resultados educacionais do Brasil em relação a outros países, com o auxílio da biblioteca `learningtower`. Em seguida, foram construídas estatísticas descritivas detalhadas antes da execução da análise de impacto.

## Estrutura do Projeto

### Objetivos

1. **Comparação Internacional com PISA**: Explorar o desempenho do Brasil em educação comparado com outros países, usando dados do PISA para contextualizar o cenário educacional e os desafios da educação integral.
2. **Estatísticas Descritivas**: Analisar a distribuição das variáveis e o perfil dos alunos impactados pelo programa de Ensino Integral.
3. **Estimativa de Impacto (Diferenças em Diferenças)**: Estimar o efeito do programa de Ensino Integral no desempenho acadêmico dos alunos usando a metodologia de Callaway-Sant'Anna.

### Metodologia

- **Comparação Internacional com PISA**: Utilização da biblioteca `learningtower` para acessar e manipular dados do PISA, comparando o Brasil com outros países em métricas como matemática, leitura e ciências.
- **Análises Descritivas**: Cálculo de medidas-resumo e gráficos para entender o perfil dos alunos antes e após a introdução do programa de Ensino Integral.
- **Diferenças em Diferenças**: Uso do estimador de Callaway-Sant'Anna para captar o impacto do programa ao longo do tempo e entre grupos de controle e tratamento.

### Conteúdo do Projeto

- **TrabalhoFinal.Rmd**: Documento RMarkdown com a análise completa e comentários, incluindo códigos, gráficos e explicações detalhadas.
- **TrabalhoFinal.R**: Versão em script R do projeto para fácil reprodução das análises.
- **Bases de Dados**: Inclui todos os arquivos de dados necessários para a execução do projeto.
- **Slides da Apresentação (em breve)**: Resumo visual dos principais resultados e metodologias usadas, para apresentação final.

## Como Executar

1. **Requisitos**: Instale as bibliotecas `learningtower`, `did`, `tidyverse`, e outras bibliotecas indicadas no `TrabalhoFinal.Rmd`.
2. **Execução**: Para uma execução detalhada com anotações, abra o arquivo `TrabalhoFinal.Rmd` em RStudio e selecione "Knit" para gerar um relatório completo. Alternativamente, rode o script `TrabalhoFinal.R` para uma execução direta.
3. **Interpretação dos Resultados**: Os resultados incluem análises descritivas e tabelas de impacto, além de gráficos para interpretação do efeito do Ensino Integral no aprendizado.

## Referências

- Hanushek, E. A., & Woessmann, L. (2012). Do better schools lead to more growth? Cognitive skills, economic outcomes, and causation.
- Domínguez, P., & Ruffini, K. (2020). Long-Term Gains from Longer School Days.
- Centro de Evidências da Educação Integral - Insper. *Impactos econômicos de médio e longo prazo de uma educação integral*.

---

## Contribuições

Contribuições para aprimorar o código ou sugerir melhorias são bem-vindas. Abra uma *issue* ou envie um *pull request*.

## Licença

Este projeto está licenciado sob a licença MIT.
