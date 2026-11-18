Banco de Dados para Registros de Campo e Mídias do LAMECE

Trabalho final da disciplina CIN8003 – Bancos de Dados e Aplicações (2026.2)
Luiza Kittel Chiká

Este repositório reúne o desenvolvimento do trabalho final da disciplina CIN8003 - Bancos de Dados e Aplicações, realizado a partir de uma proposta de organização dos dados do Laboratório de Métodos de Estudos Subaquáticos e Cefalópodes (LAMECE).

O laboratório realiza pesquisas com cefalópodes em diferentes regiões costeiras e ilhas oceânicas brasileiras. Essas atividades envolvem expedições, registros de avistamentos, relatórios de campo e a produção de fotografias e vídeos. Atualmente, parte dessas informações está distribuída entre planilhas e arquivos de mídia, incluindo registros históricos produzidos ao longo de décadas, nem sempre seguindo os mesmos padrões de organização.

A proposta do trabalho foi desenvolver um banco de dados relacional que permitisse organizar essas informações, estabelecer relações entre registros de campo e mídias e facilitar sua recuperação e consulta.

O projeto seguiu as etapas propostas na disciplina, desde o levantamento de requisitos e a elaboração dos modelos conceitual e lógico até a implementação do banco em SQLite, a inserção de dados e a realização de operações e consultas SQL. Os arquivos estão organizados por etapa, de modo a preservar o processo de desenvolvimento, apesar de após a finalização da última etapa algumas partes da primeira terem sido refeitas (explico mais pra frente).

Para a implementação e os exercícios, foram utilizadas situações fictícias combinadas com informações reais do contexto do laboratório. Por exemplo, as mídias e suas respectivas localidades são reais, enquanto os integrantes (rs) e parte das situações representadas foram criados ficticiamente para permitir o preenchimento das tabelas e a execução das consultas. Portanto, os registros utilizados neste trabalho não devem ser interpretados como uma base científica pronta/real.

Ao longo do desenvolvimento, a estrutura do banco passou por ajustes em relação à proposta inicial. Por esse motivo, o Modelo Entidade-Relacionamento (MER) e o modelo lógico relacional foram refeitos ao final do trabalho, para corresponder à versão definitiva do banco de dados, disponível neste repositório por meio do script SQL de criação das tabelas.

A implementação apresentada tem caráter acadêmico e representa uma proposta de estruturação dos dados, não um sistema já implantado no laboratório. Funcionalidades como uma interface de cadastro, mecanismos adicionais de controle de acesso e integração com Sistemas de Informação Geográfica (SIG) permanecem como possibilidades para desenvolvimento futuro
