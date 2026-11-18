INSERT INTO cidade_ilha (id_cidade_ilha, tipo, estado, pais, descricao)
VALUES
    ('florianopolis', 'cidade', 'Santa Catarina', 'Brasil', NULL),
    ('fernando_de_noronha', 'ilha', 'Pernambuco', 'Brasil', NULL),
    ('trindade', 'ilha', 'Espírito Santo', 'Brasil', NULL),
    ('atol_das_rocas', 'ilha', 'Rio Grande do Norte', 'Brasil', NULL),
    ('arquipelago_sao_pedro_sao_paulo', 'ilha', 'Pernambuco', 'Brasil', NULL),
    ('arraial_do_cabo', 'cidade', 'Rio de Janeiro', 'Brasil', NULL);

INSERT INTO familia (id_familia)
VALUES
    ('octopodidae'),
    ('argonautidae');

INSERT INTO genero (id_genero, id_familia)
VALUES
    ('amphioctopus', 'octopodidae'),
    ('callistoctopus', 'octopodidae'),
    ('macrotritopus', 'octopodidae'),
    ('octopus', 'octopodidae'),
    ('paroctopus', 'octopodidae'),
    ('argonauta', 'argonautidae');

INSERT INTO especie (id_especie, id_genero, autoridade_taxonomica)
VALUES
    ('amphioctopus_burryi', 'amphioctopus', 'Voss, 1950'),
    ('callistoctopus_furvus', 'callistoctopus', 'Gould, 1852'),
    ('macrotritopus_cf_defilippi', 'macrotritopus', 'Vérany, 1852'),
    ('octopus_americanus', 'octopus', 'Monfort, 1802'),
    ('octopus_hummelincki', 'octopus', 'Adam, 1936'),
    ('octopus_insularis', 'octopus', 'Leite & Haimovici, 2008'),
    ('octopus_tehuelchus', 'octopus', 'Orbigny, 1834'),
    ('paroctopus_cthulu', 'paroctopus', 'Leite, Lima, Lima & Haimovici, 2021'),
    ('argonauta_argo', 'argonauta', 'Linnaeus, 1758');

INSERT INTO integrante (id_integrante, email, instituicao)
VALUES
    ('elis_regina', 'elis.regina@example.com', 'UFSC'),
    ('gal_costa', 'gal.costa@example.com', 'UFSC'),
    ('maria_bethania', 'maria.bethania@example.com', 'UFRN'),
    ('rita_lee', 'rita.lee@example.com', 'UFSC'),
    ('marisa_monte', NULL, 'FURG'),
    ('adriana_calcanhotto', NULL, NULL);

INSERT INTO permissao (id_permissao, codigo, descricao)
VALUES
    ('visualizar', 'VISUALIZAR', 'Consultar registros e midias'),
    ('cadastrar', 'CADASTRAR', 'Adicionar registros e midias'),
    ('editar', 'EDITAR', 'Modificar registros existentes'),
    ('excluir', 'EXCLUIR', 'Excluir registros'),
    ('gerenciar_usuarios', 'GERENCIAR_USUARIOS', 'Gerenciar usuarios e permissoes');

INSERT INTO usuario (id_usuario, id_integrante, login, email, senha_hash, ativo, criado_em)
VALUES
    (1, 'elis_regina', 'elis_regina', 'elis.regina@example.com', 'hashficticio1', 1, '2026-03-10'),
    (2, 'gal_costa', 'gal_costa', 'gal.costa@example.com', 'hashficticio2', 1, '2026-04-15'),
    (3, 'maria_bethania', 'maria_bethania', 'maria.bethania@example.com', 'hashficticio3', 1, '2026-05-20'),
    (4, NULL, 'usuario_teste', 'usuario.teste@example.com', 'hashficticio4', 0, '2026-06-05');

INSERT INTO local (id_local, id_cidade_ilha, latitude, longitude, descricao)
VALUES
    ('ilha_do_arvoredo', 'florianopolis', -27.286941, -48.370794, 'Ilha do Arvoredo'),
    ('praia_do_pantano_do_sul', 'florianopolis', -27.785621, -48.509810, 'Praia do Pantano do Sul'),
    ('praia_dos_ingleses', 'florianopolis', -27.442452, -48.370133, 'Praia dos Ingleses'),
    ('praia_do_sueste', 'fernando_de_noronha', -3.867517, -32.425988, 'Baia do Sueste'),
    ('praia_do_leao', 'fernando_de_noronha', -3.870248, -32.434315, 'Praia do Leao'),
    ('praia_das_andradas', 'trindade', -20.510874, -29.306992, 'Praia das Andradas'),
    ('enseada', 'arquipelago_sao_pedro_sao_paulo', 0.917073, -29.345492, 'Enseada'),
    ('praia_do_forno', 'arraial_do_cabo', -22.964540, -42.012371, 'Praia do Forno');

INSERT INTO expedicao (id_expedicao, id_cidade_ilha, nome, data_inicio, data_fim, descricao)
VALUES
    (1, 'florianopolis', 'Monitoramento costeiro de Florianopolis', '2025-03-10', '2025-03-15', 'Levantamento visual em ambientes costeiros'),
    (2, 'fernando_de_noronha', 'Monitoramento de polvos em Fernando de Noronha', '2025-06-05', '2025-06-12', 'Observacoes em ambientes recifais'),
    (3, 'trindade', 'Expedicao Ilha da Trindade', '2025-09-01', '2025-09-15', 'Levantamento de fauna marinha'),
    (4, 'arquipelago_sao_pedro_sao_paulo', 'Expedicao Sao Pedro e Sao Paulo', '2026-02-10', NULL, 'Expedicao de pesquisa em ambiente insular');

INSERT INTO expedicao_integrante (id_expedicao, id_integrante, chefe)
VALUES
    (1, 'elis_regina', 1),
    (1, 'gal_costa', 0),
    (1, 'rita_lee', 0),
    (2, 'maria_bethania', 1),
    (2, 'marisa_monte', 0),
    (3, 'elis_regina', 1),
    (3, 'adriana_calcanhotto', 0),
    (4, 'gal_costa', 1);

INSERT INTO lote_midia (id_lote)
VALUES
    (1),
    (2),
    (3),
    (4);

INSERT INTO registro_campo (
    id_registro, id_expedicao, id_local, id_integrante_autor,
    id_genero, id_especie, data_avistamento, hora_avistamento,
    tipo_amostragem, visibilidade_m, profundidade_m,
    temperatura_agua_c, dentro_toca, sexo, distancia_entre_olhos_mm,
    substrato, observacoes, id_usuario_cadastro, cadastrado_em
)
VALUES
    (1, 1, 'ilha_do_arvoredo', 'elis_regina', 'octopus', 'octopus_americanus',
     '2025-03-10', '09:30', 'autonomo', 12, 8.5, 24.0, 1, NULL, NULL, 'rocha', NULL, 1, '2025-03-11'),
    (2, 1, 'ilha_do_arvoredo', 'gal_costa', 'octopus', 'octopus_americanus',
     '2025-03-11', '10:15', 'autonomo', 15, 11.0, 23.5, 0, 'masc', 18.0, 'rocha', 'Animal fora da toca', 2, '2025-03-12'),
    (3, 1, 'praia_do_pantano_do_sul', 'rita_lee', 'octopus', NULL,
     '2025-03-12', '14:20', 'livre', 6, 3.0, 25.0, 1, NULL, NULL, 'rocha', 'Identificacao apenas ate genero', 1, '2025-03-13'),
    (4, 1, 'praia_dos_ingleses', 'elis_regina', 'octopus', 'octopus_americanus',
     '2025-03-14', '08:45', 'livre', 8, 2.5, NULL, 1, NULL, NULL, 'rocha', NULL, 1, '2025-03-15'),
    (5, 2, 'praia_do_sueste', 'maria_bethania', 'octopus', 'octopus_insularis',
     '2025-06-06', '09:10', 'livre', 18, 4.0, 27.0, 0, 'fem', 22.0, 'coral', NULL, 3, '2025-06-07'),
    (6, 2, 'praia_do_leao', 'marisa_monte', 'octopus', 'octopus_insularis',
     '2025-06-08', '11:30', 'livre', 20, 5.5, 27.5, 1, NULL, NULL, 'rocha', 'Animal observado na toca', 3, '2025-06-09'),
    (7, 2, 'praia_do_sueste', 'maria_bethania', 'octopus', NULL,
     '2025-06-10', '15:00', 'autonomo', 16, 9.0, 26.5, 0, NULL, NULL, 'coral', NULL, 3, '2025-06-11'),
    (8, 3, 'praia_das_andradas', 'elis_regina', 'octopus', 'octopus_insularis',
     '2025-09-03', '10:40', 'autonomo', 25, 12.0, 25.0, 1, 'masc', 20.0, 'rocha', NULL, 1, '2025-09-04'),
    (9, 3, 'praia_das_andradas', 'adriana_calcanhotto', 'octopus', 'octopus_insularis',
     '2025-09-08', '13:15', 'autonomo', 22, 15.0, 24.5, 0, NULL, NULL, 'rocha', NULL, 1, '2025-09-09'),
    (10, NULL, 'praia_do_forno', 'gal_costa', 'macrotritopus', 'macrotritopus_cf_defilippi',
     '2025-11-05', '09:50', 'autonomo', 14, 10.0, 22.0, 0, NULL, NULL, 'areia', NULL, 2, '2025-11-06'),
    (11, NULL, 'praia_dos_ingleses', 'rita_lee', 'octopus', NULL,
     '2026-01-18', '16:10', 'livre', 5, 2.0, NULL, 1, NULL, NULL, 'rocha', 'Especie nao identificada', 1, '2026-01-19'),
    (12, NULL, 'enseada', 'marisa_monte', 'octopus', 'octopus_insularis',
     '2026-03-20', '11:00', 'autonomo', 28, 14.0, 28.0, 0, NULL, NULL, 'rocha', NULL, 3, '2026-03-21');

INSERT INTO registro_midia (
    id_midia, id_lote, id_registro, id_local, id_integrante_autor,
    id_genero, id_especie, nome_original, caminho_arquivo,
    data_captura, profundidade_m, temperatura_agua_c, sexo,
    observacoes, id_usuario_cadastro, cadastrado_em
)
VALUES
    (195, NULL, NULL, 'praia_do_forno', NULL, NULL, NULL,
     'IMG_0195.jpg',
     'https://drive.google.com/file/d/18JvPNrbo6epmVwBE2vt45aonkS39r-CA/view?usp=drive_link',
     '2025-04-19', NULL, 25.0, NULL, NULL, 1, '2026-11-17'),
    (226, NULL, NULL, 'praia_do_forno', NULL, NULL, NULL,
     'IMG_0226.jpg',
     'https://drive.google.com/file/d/1nw5-nq3frxyMAcujjrMpCKMa7bBWoHGr/view?usp=sharing',
     '2026-04-19', NULL, NULL, NULL, 'mestrado Camila', 2, '2026-11-17'),
    (296, NULL, 8, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0296.jpg',
     'https://drive.google.com/file/d/1luuqdMMGwvlNaq6z1tPE3_cfLv-2ZRN6/view?usp=sharing',
     '2025-11-02', 0, NULL, NULL, NULL, 1, '2026-11-17'),
    (297, NULL, 8, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0297.jpg',
     'https://drive.google.com/file/d/1N16mfax6DEplVHcrNGIF26LjEbOTSIo6/view?usp=sharing',
     '2025-11-02', 0, NULL, NULL, NULL, 2, '2026-11-17'),
    (336, NULL, 8, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0336.jpg',
     'https://drive.google.com/file/d/1RANrcbbWWmI2iH-8L6xx49NRuXSlaf-I/view?usp=sharing',
     '2026-08-31', 0, NULL, NULL, NULL, 3, '2026-11-17'),
    (342, NULL, 8, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0342.jpg',
     'https://drive.google.com/file/d/1dtiRYOymSn6Mm2rENtJVb_kHTMve0d47/view?usp=sharing',
     '2026-08-31', 0.2, NULL, NULL,
     'Em poça pequena em linha reta ao monumento de marco de retomada da Ilha de Trindade', 1, '2026-11-17'),
    (343, NULL, 8, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0343.jpg',
     'https://drive.google.com/file/d/1HZ6BRhYRYTs2IryF2zljC_Ro_ZO97Bl1/view?usp=sharing',
     '2026-08-31', 0.5, NULL, 'masc',
     'Estava sendo predado por moreia e pufas.', 2, '2026-11-17'),
    (344, NULL, 9, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0344.jpg',
     'https://drive.google.com/file/d/1eICfyGPQyBYTx1sOpzsXXSvu_NdfK9Fv/view?usp=sharing',
     '2026-09-04', 0.2, 23.0, NULL,
     'Em frente a toca camuflado, ventilando.', 1, '2026-11-17'),
    (345, NULL, 9, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0345.jpg',
     'https://drive.google.com/file/d/1XaQskdE7t3-QSTibTGv_jLISa5WQq7nh/view?usp=sharing',
     '2026-09-04', 0.2, 24.0, NULL,
     'Completamente entocado e não camuflado', 2, '2026-11-17'),
    (347, NULL, 9, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0347.jpg',
     'https://drive.google.com/file/d/1Lh-4c0WqWehv0LcW9pBQ9gv4nSnSlaa2/view?usp=sharing',
     '2026-09-15', NULL, NULL, NULL,
     'Predando grapsus', 3, '2026-11-17'),
    (348, NULL, 9, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0348.jpg',
     'https://drive.google.com/file/d/1nWTvsBgWXQYFb1ilYcbFPkSojw2hFUlS/view?usp=sharing',
     '2026-09-15', 0.2, 30.0, NULL,
     'Piloto interação grapsus e insularis, insularis dando bote', 3, '2026-11-17'),
    (349, NULL, 9, 'praia_das_andradas', NULL, 'octopus', 'octopus_insularis',
     'IMG_0349.jpg',
     'https://drive.google.com/file/d/1oX5SrgrSUHSmyiiM4XTa4DXjJ0TzpQbs/view?usp=sharing',
     '2026-09-15', 0.2, 24.0, NULL,
     'Não teve interesse no grapsus oferecido.', 3, '2026-11-17');

INSERT INTO tag (id_tag, ativa)
VALUES
    ('copula', 1),
    ('forrageio', 1),
    ('toca', 1),
    ('interacao', 1),
    ('camuflagem', 1),
    ('desova', 1),
    ('juvenil', 1),
    ('lixo', 1),
    ('pesca', 1),
    ('sono', 1),
    ('mergulhador', 1),
    ('habitat', 1),
    ('video', 1),
    ('barco', 1),
    ('presa', 1),
    ('predador', 1);

INSERT INTO midia_tag (
    id_midia, id_tag, id_usuario_atribuicao, atribuida_em
)
VALUES
    (195, 'habitat', 1, '2026-11-17'),
    (226, 'habitat', 2, '2026-11-17'),
    (296, 'toca', 1, '2026-11-17'),
    (297, 'camuflagem', 2, '2026-11-17'),
    (336, 'habitat', 3, '2026-11-17'),
    (342, 'habitat', 1, '2026-11-17'),
    (343, 'interacao', 2, '2026-11-17'),
    (343, 'predador', 2, '2026-11-17'),
    (344, 'toca', 1, '2026-11-17'),
    (344, 'camuflagem', 1, '2026-11-17'),
    (345, 'toca', 2, '2026-11-17'),
    (347, 'forrageio', 3, '2026-11-17'),
    (347, 'presa', 3, '2026-11-17'),
    (348, 'interacao', 3, '2026-11-17'),
    (348, 'forrageio', 3, '2026-11-17'),
    (348, 'presa', 3, '2026-11-17'),
    (349, 'interacao', 3, '2026-11-17'),
    (349, 'presa', 3, '2026-11-17');

INSERT INTO comentario_midia (
    id_comentario, id_midia, id_usuario, texto, criado_em
)
VALUES
    (1, 296, 1, 'Solicitar a professora revisao da identificacao da especie.', '2026-11-17'),
    (2, 297, 2, 'Esta identificacao como Octopus insularis esta correta?', '2026-11-17'),
    (3, 342, 3, 'Conferir se as coordenadas do local cadastrado correspondem ao ponto de coleta.', '2026-11-17'),
    (4, 343, 1, 'Pedir confirmacao da identificacao do sexo.', '2026-11-17'),
    (5, 344, 2, 'Verificar se esta midia foi associada ao registro de campo correto.', '2026-11-17'),
    (6, 345, 3, 'Solicitar revisao da classificacao das tags atribuidas.', '2026-11-17'),
    (7, 348, 1, 'Conferir se a temperatura informada foi registrada corretamente na planilha original.', '2026-11-17'),
    (8, 349, 2, 'Verificar se este arquivo ja foi cadastrado anteriormente no banco.', '2026-11-17');

INSERT INTO relatorio (
    id_relatorio, id_expedicao, titulo, caminho_arquivo,
    data_relatorio, id_usuario_cadastro
)
VALUES
    (1, 1, 'Relatorio de monitoramento costeiro de Florianopolis',
     'relatorios/monitoramento_florianopolis_2025.pdf', '2025-03-20', 1),
    (2, 2, 'Relatorio de monitoramento de polvos em Fernando de Noronha',
     'relatorios/monitoramento_noronha_2025.pdf', '2025-06-18', 3),
    (3, 3, 'Relatorio de levantamento da fauna marinha de Trindade',
     'relatorios/levantamento_trindade_2025.pdf', '2025-09-20', 1),
    (4, 4, 'Relatorio parcial da expedicao Sao Pedro e Sao Paulo',
     NULL, '2026-02-20', 2);

INSERT INTO relatorio_autor (
    id_relatorio, id_integrante
)
VALUES
    (1, 'elis_regina'),
    (1, 'gal_costa'),
    (1, 'rita_lee'),
    (2, 'maria_bethania'),
    (2, 'marisa_monte'),
    (3, 'elis_regina'),
    (4, 'gal_costa');

INSERT INTO usuario_permissao (
    id_usuario, id_permissao
)
VALUES
    (1, 'visualizar'),
    (1, 'cadastrar'),
    (1, 'editar'),
    (1, 'excluir'),
    (1, 'gerenciar_usuarios'),
    (2, 'visualizar'),
    (2, 'cadastrar'),
    (3, 'visualizar'),
    (3, 'cadastrar');

INSERT INTO historico_alteracao (
    id_alteracao, nome_tabela, chave_registro, operacao,
    dados_anteriores, dados_novos, id_usuario,
    alterado_em, justificativa
)
VALUES
    (1, 'registro_midia', '{"id_midia":296}', 'INSERT',
     NULL, '{"id_local":"praia_das_andradas"}',
     1, '2026-11-17', 'Cadastro inicial da midia'),
    (2, 'registro_midia', '{"id_midia":297}', 'INSERT',
     NULL, '{"id_local":"praia_das_andradas"}',
     2, '2026-11-17', 'Cadastro inicial da midia'),
    (3, 'registro_midia', '{"id_midia":343}', 'UPDATE',
     '{"sexo":null}', '{"sexo":"masc"}',
     2, '2026-11-17', 'Correcao da identificacao do sexo'),
    (4, 'registro_midia', '{"id_midia":344}', 'UPDATE',
     '{"temperatura_agua_c":null}', '{"temperatura_agua_c":23.0}',
     1, '2026-11-17', 'Conferencia da temperatura registrada'),
    (5, 'registro_midia', '{"id_midia":348}', 'UPDATE',
     '{"temperatura_agua_c":null}', '{"temperatura_agua_c":30.0}',
     3, '2026-11-17', 'Atualizacao dos dados ambientais'),
    (6, 'midia_tag', '{"id_midia":344,"id_tag":"camuflagem"}', 'INSERT',
     NULL, '{"id_midia":344,"id_tag":"camuflagem"}',
     1, '2026-11-17', 'Classificacao da midia'),
    (7, 'comentario_midia', '{"id_comentario":4}', 'INSERT',
     NULL, '{"id_midia":343,"id_usuario":1}',
     1, '2026-11-17', 'Solicitacao de revisao da identificacao'),
    (8, 'registro_campo', '{"id_registro":8}', 'UPDATE',
     '{"visibilidade_m":20}', '{"visibilidade_m":25}',
     1, '2026-11-17', 'Correcao da visibilidade');
