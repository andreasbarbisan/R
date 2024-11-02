# Economia da Educação e o Projeto STAR

Este projeto explora o impacto do tamanho de turmas e da formação dos professores no desempenho dos alunos, usando dados do Projeto STAR (Student-Teacher Achievement Ratio). O estudo investiga como o nível educacional do professor pode moderar o efeito de turmas menores no aprendizado, focando na disciplina de Português. Utilizando técnicas econométricas e análise experimental, este projeto visa fornecer insights sobre os fatores que influenciam a qualidade da educação. Aqui, você vai encontrar a base em .csv, o código em RMarkdown e Script e o relatório em Word.

## Estrutura do Projeto

### 1. Definição da Pergunta de Pesquisa
   - **Descrição:** Formulamos uma pergunta de pesquisa que examina o papel da formação dos professores como fator moderador no efeito do tamanho da turma sobre o desempenho dos alunos. Esta pergunta busca entender melhor como o nível educacional dos docentes impacta o aprendizado em diferentes configurações de sala de aula.
   - **Objetivo:** Compreender o impacto da formação docente no contexto de turmas menores, oferecendo uma perspectiva sobre políticas educacionais.

### 2. Construção de uma Teoria Microeconômica
   - **Descrição:** Estruturamos uma teoria microeconômica que fundamenta os argumentos teóricos, baseando-nos na literatura sobre a produção educacional. O modelo examina como a formação do professor e o tamanho da turma podem interagir para afetar o desempenho dos alunos, culminando em uma hipótese econômica específica.
   - **Objetivo:** Desenvolver um modelo teórico que relacione as características do professor e o tamanho da turma com o desempenho educacional.

### 3. Análise Descritiva dos Dados
   - **Descrição:** Realizamos uma análise descritiva das variáveis de desempenho em Português e da formação dos professores, caracterizando os diferentes tipos de turmas (pequena, regular e com assistente).
   - **Objetivo:** Fornecer uma visão inicial dos dados, explorando as diferenças entre os tipos de turma e identificando padrões nas variáveis de interesse.

### 4. Estimação do Modelo Econométrico
   - **Descrição:** Estimamos um modelo de regressão múltipla para testar a hipótese econômica, justificando a inclusão de cada variável explicativa e interpretando os resultados obtidos.
   - **Objetivo:** Avaliar empiricamente o impacto do tamanho de turma e da formação docente sobre o desempenho dos alunos em Português.

### 5. Inclusão de Efeitos Fixos por Escola
   - **Descrição:** Incorporamos efeitos fixos por escola para controlar por fatores não-observáveis que possam influenciar o desempenho dos alunos. Testamos a significância desses efeitos e discutimos o impacto na consistência das estimativas.
   - **Objetivo:** Considerar o efeito das escolas para garantir uma análise mais robusta dos resultados.

### 6. Verificação da Aleatorização
   - **Descrição:** Checamos a aleatorização do experimento estimando um modelo de probabilidade linear para verificar a distribuição dos alunos em turmas pequenas. Interpretamos os coeficientes para avaliar a validade da aleatorização.
   - **Objetivo:** Validar a aleatorização do experimento, garantindo que a distribuição dos alunos foi aleatória e os resultados são consistentes.

---

## Requisitos e Execução

Este projeto foi desenvolvido em R, utilizando pacotes para análise econométrica e tratamento de dados em painel. Para executar o código, baixe os arquivos de dados do Projeto STAR e siga as instruções no script.

## Referências

- **Bietenbeck, J.** (2020). *The long-term impacts of low-achieving childhood peers: evidence from Project STAR.*
- **Chetty, R., et al.** (2011). *How does your kindergarten classroom affect your earnings? Evidence from Project STAR.*
- **Krueger, A. B.** (1999). *Experimental estimates of education production functions.*

---

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request* para melhorias ou correções.

## Licença

Este projeto está licenciado sob a licença MIT.
