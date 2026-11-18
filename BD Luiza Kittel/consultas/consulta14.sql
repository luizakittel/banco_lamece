-- Consulta 14: Recuperar links do Google Drive de midias
-- classificadas com tags relacionadas a interacoes ecologicas.
-- Utiliza INNER JOIN, IN, DISTINCT e ORDER BY.

SELECT DISTINCT
    m.id_midia,
    m.nome_original,
    m.caminho_arquivo AS link_drive,
    m.data_captura,
    l.descricao AS localidade
FROM registro_midia AS m
INNER JOIN midia_tag AS mt
    ON m.id_midia = mt.id_midia
INNER JOIN local AS l
    ON m.id_local = l.id_local
WHERE mt.id_tag IN ('interacao', 'presa', 'predador')
ORDER BY m.data_captura DESC, m.id_midia ASC;
