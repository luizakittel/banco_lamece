-- Consulta 02: Identificar localidades com pelo menos duas midias cadastradas.
-- Utiliza LEFT JOIN, COUNT, HAVING e ordenacao decrescente.
SELECT l.descricao AS localidade, COUNT(m.id_midia) AS total_midias
FROM local AS l
LEFT JOIN registro_midia AS m ON l.id_local = m.id_local
GROUP BY l.id_local, l.descricao
HAVING COUNT(m.id_midia) >= 2
ORDER BY total_midias DESC, localidade ASC;
