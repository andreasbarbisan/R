# APS 2 - Análise do Mercado de Streaming Musical

Este projeto investiga o mercado de streaming musical, comparando as características e o desempenho de músicas em duas plataformas concorrentes: Spotify e YouTube Music. A análise busca entender as diferenças no consumo de música entre essas plataformas e explorar os fatores associados ao sucesso das músicas em cada uma delas. Aqui, você vai encontrar o código em R, o relatório final em Word e a base de dados em xlsx. 

## Estrutura do Projeto

### Objetivos

1. **Análise das Variáveis:** Classificar as variáveis da base de dados e interpretar a distribuição da duração das músicas.
2. **Diferenças entre Gêneros Musicais:** Explorar se existem diferenças na duração das músicas para diferentes gêneros musicais através de visualizações de boxplot.
3. **Fatores de Sucesso no Spotify:** Identificar as características das músicas que possuem maior associação com o número de streams no Spotify, considerando também as diferenças por gênero musical.
4. **Fatores de Sucesso no YouTube:** Analisar a popularidade das músicas no YouTube, considerando o número de likes para avaliar o gênero musical mais popular na plataforma.
5. **Comparação entre Plataformas:** Investigar se existe associação entre o sucesso de uma música no Spotify (streams) e o sucesso no YouTube (likes e visualizações), comparando as medidas de associação para determinar qual métrica reflete melhor a popularidade entre as plataformas.

### Dados

Os dados utilizados estão no arquivo `aps2.xlsx` e contêm informações sobre:

- **Características da Música:** Nome do artista, nome da faixa, álbum, gênero, energia, volume, fala, acústica, vivacidade e duração.
- **Desempenho nas Plataformas:** Número de streams no Spotify, likes no YouTube e visualizações no YouTube.

### Análises Realizadas

- **Análise Exploratória e Visualizações:** Esquema de 5 pontos para a duração das músicas e boxplots para comparar gêneros.
- **Associações e Regressões:** Análise de correlação entre variáveis do Spotify (como energia, volume) e o sucesso da música; regressão para identificar o impacto da característica mais relevante em cada gênero musical.
- **Comparação entre Plataformas:** Gráficos e medidas de associação para examinar a relação entre sucesso no Spotify e no YouTube.

### Ferramentas Utilizadas

O projeto foi desenvolvido em **R** e faz uso de pacotes para análise estatística e visualização de dados. 

## Como Executar

1. Baixe os dados do arquivo `aps2_v2clean.xlsx`.
2. Execute o script em R para reproduzir as análises e gráficos.
3. Consulte o relatório gerado para ver a interpretação dos resultados.

## Organização

- **Relatório:** Um documento detalhado com todas as análises, gráficos e interpretações, apresentado de forma clara e organizada.
- **Script R:** Código bem comentado, contendo todas as etapas para replicar as análises realizadas.

## Referências

Este projeto utiliza informações de fontes como a Federação Internacional da Indústria Fonográfica (IFPI) e dados extraídos de Kaggle sobre o mercado de streaming musical.

---

## Contribuições

Contribuições são bem-vindas! Para sugestões ou melhorias, sinta-se à vontade para abrir uma *issue* ou enviar um *pull request*.

## Licença

Este projeto está licenciado sob a licença MIT.
