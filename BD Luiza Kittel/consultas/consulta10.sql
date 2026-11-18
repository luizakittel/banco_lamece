-- Consulta 10: Listar midias com tags ligadas a interacoes, presas ou predadores.
-- Utiliza INNER JOIN entre tres tabelas e IN.
SELECT m.id_midia, m.nome_original, t.id_tag AS tag
FROM registro_midia AS m
INNER JOIN midia_tag AS mt ON mt.id_midia = m.id_midia
INNER JOIN tag AS t ON t.id_tag = mt.id_tag
WHERE t.id_tag IN ('interacao', 'presa', 'predador')
ORDER BY m.id_midia ASC, t.id_tag ASC;
