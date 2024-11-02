# Economia do Crime e Leis Right-to-Carry (RTC) nos EUA

Este projeto investiga o impacto das leis de "right-to-carry" (RTC) na taxa de crimes contra a propriedade nos Estados Unidos, com base em dados em painel que cobrem diversos estados ao longo de 36 anos. A análise envolve um modelo microeconômico e técnicas econométricas avançadas, com foco em entender se a presença dessas leis está associada a variações nos índices de criminalidade. Nesse arquivo, você vai encontrar o código em RMarkdown, o relatório gerado em .tex, além da base de dados para replicação e os PNGs dos gráficos gerados.

## Estrutura do Projeto

### 1. Definição da Pergunta de Pesquisa
   - **Descrição:** Formulamos uma pergunta de pesquisa no contexto da Economia do Crime, visando avaliar como as leis RTC influenciam a taxa de crimes contra a propriedade. Essa pergunta busca aprofundar a compreensão sobre o papel das leis de porte de armas na segurança pública.
   - **Objetivo:** Estabelecer uma base sólida para o estudo, relacionando as leis RTC ao comportamento criminal.

### 2. Construção de uma Teoria Microeconômica
   - **Descrição:** Estruturamos uma teoria microeconômica que fundamenta os argumentos teóricos do projeto. O modelo foi escolhido com base na literatura relevante, abordando a racionalidade dos agentes econômicos (potenciais criminosos) e levando à formulação de uma hipótese econômica.
   - **Objetivo:** Desenvolver um modelo teórico alinhado à pergunta de pesquisa, que explora a relação entre a presença de leis RTC e o comportamento dos agentes em relação ao crime. A teoria culmina em uma hipótese econômica que será testada empiricamente.

### 3. Análise Descritiva dos Dados
   - **Descrição:** Realizamos uma análise descritiva dos dados, gerando estatísticas e visualizações que ilustram padrões e correlações nas variáveis de interesse. A ênfase é dada às variáveis que auxiliam na resposta à pergunta de pesquisa.
   - **Objetivo:** Observar os dados iniciais para identificar possíveis relações entre as leis RTC e a taxa de crimes contra a propriedade.

### 4. Teste da Hipótese Econômica
   - **Descrição:** Estimamos uma regressão com dados em painel, usando modelos de efeitos fixos e aleatórios. A escolha do modelo mais adequado é feita através do Teste de Hausman. Também discutimos a hipótese de identificação e outras questões econométricas relevantes.
   - **Objetivo:** Testar empiricamente o impacto das leis RTC sobre a criminalidade contra a propriedade, garantindo uma interpretação robusta do efeito causal.

### 5. Organização e Documentação do Código
   - **Descrição:** Todo o código utilizado no projeto está comentado e estruturado para replicar todas as etapas da análise, incluindo preparação dos dados, análises descritivas e regressões. A organização do código é essencial para garantir transparência e verificabilidade dos resultados.
   - **Objetivo:** Facilitar a validação do trabalho e assegurar a replicabilidade da análise empírica.

---

## Requisitos e Execução

Este projeto foi desenvolvido em R, utilizando pacotes para manipulação de dados em painel e visualização. Para executar o código, baixe os arquivos de dados e siga as instruções presentes no script.

## Referências

- **He, Q., & Barkowski, S.** (2020). *The effect of health insurance on crime: Evidence from the Affordable Care Act Medicaid expansion.*
- **Song, Z., & Hao, C.** (2022). *Housing price and criminal crime in China: direct and indirect influence.*
- **Donohue, J. J., Aneja, A., & Weber, K. D.** (2019). *Right‐to‐carry laws and violent crime: A comprehensive assessment using panel data and a state‐level synthetic control analysis.*

---

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request* para melhorias ou correções.

## Licença

Este projeto está licenciado sob a licença MIT.
