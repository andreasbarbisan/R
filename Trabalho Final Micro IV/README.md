# Projeto - Impacto do Ensino Integral em São Paulo: Análise com Diferenças em Diferenças

Este projeto analisa o impacto do ensino integral no desempenho acadêmico de estudantes de São Paulo, utilizando a metodologia de Diferenças em Diferenças (DiD) e o estimador de Callaway-Sant'Anna. O estudo inclui uma comparação internacional usando dados do PISA, com foco em métricas de desempenho educacional em matemática e língua portuguesa para contextualizar o cenário educacional do Brasil em relação a outros países. Estatísticas descritivas detalhadas são construídas para entender o perfil das escolas e dos alunos antes da implementação da política de ensino integral.

## Estrutura do Projeto

### Objetivos

1. **Comparação Internacional com PISA**: Comparar o desempenho do Brasil em educação com outros países, contextualizando o cenário educacional e os desafios da implementação do ensino integral.
2. **Estatísticas Descritivas**: Avaliar a distribuição das variáveis e perfis dos alunos nas escolas que aderiram ao programa de ensino integral.
3. **Estimativa de Impacto (Diferenças em Diferenças)**: Estimar o efeito do programa de ensino integral sobre o desempenho dos alunos com a metodologia de Callaway-Sant'Anna.

### Metodologia

- **Comparação Internacional com PISA**: A biblioteca `learningtower` é utilizada para manipular dados do PISA, explorando o desempenho em matemática, leitura e ciências no contexto do G7 e países da América do Sul.
- **Análises Descritivas**: Estatísticas e gráficos exploram a distribuição dos indicadores de desempenho e o perfil das escolas de ensino integral.
- **Diferenças em Diferenças (DiD)**: O estimador de Callaway-Sant'Anna é aplicado para analisar o impacto do programa ao longo do tempo entre grupos de controle e tratamento.

### Conteúdo do Projeto

- **TrabalhoFinal.Rmd**: Documento RMarkdown com o código completo da análise e comentários explicativos.
- **TrabalhoFinal.R**: Script R para execução direta das análises.
- **Bases de Dados**: Inclui os dados necessários, como dados do PISA e das escolas em São Paulo.
- **Slides da Apresentação**: Resumo visual dos resultados e metodologia do estudo.

## Como Executar

1. **Requisitos**: Instale `learningtower`, `did`, `tidyverse`, e outras bibliotecas listadas no `TrabalhoFinal.Rmd`.
2. **Execução**: Abra `TrabalhoFinal.Rmd` em RStudio e clique em "Knit" para gerar o relatório ou execute o script `TrabalhoFinal.R` diretamente.
3. **Interpretação dos Resultados**: Os resultados incluem tabelas e gráficos que interpretam o impacto do ensino integral no aprendizado.

## Referências

1. **Agüero, J. M.** (2016). *Evaluación de impacto de la Jornada Escolar Completa*. Projeto FORGE, Universidade de Connecticut.
2. **Bellei, C.** (2009). *Does lengthening the school day increase students' academic achievement? Results from a natural experiment in Chile*. *Economics of Education Review*, 28(5), 629–640.
3. **Berthelon, M., Kruger, D., & Vienne, V.** (2016). *Longer School Schedules and Early Reading Skills: Effects from a Full-Day School Reform in Chile*. IZA Discussion Paper No. 10282.
4. **Llambí, M. C.** (2016). *El efecto causal de la política de tiempo completo sobre los resultados educativos en la enseñanza media*. CINVE.
5. **Oliveira, L. F. B., & Terra, R.** (2018). *Impacto do Programa Mais Educação em indicadores educacionais*. Universidade de Brasília.
6. Hanushek, E. A., & Woessmann, L. (2012). Do better schools lead to more growth? Cognitive skills, economic outcomes, and causation.
7. Domínguez, P., & Ruffini, K. (2020). Long-Term Gains from Longer School Days.
8. Centro de Evidências da Educação Integral - Insper. *Impactos econômicos de médio e longo prazo de uma educação integral*.

## Contribuições

Contribuições para aprimoramento do código ou sugestões de melhorias são bem-vindas. Envie uma *issue* ou um *pull request*.

## Licença

Este projeto está licenciado sob a licença MIT.
