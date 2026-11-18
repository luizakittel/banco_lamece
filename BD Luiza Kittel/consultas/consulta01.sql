-- Consulta 01: Contar os avistamentos por local e genero, mostrando apenas grupos com pelo menos dois registros.
-- Utiliza INNER JOIN, COUNT, GROUP BY com duas colunas e HAVING.
SELECT l.descricao AS localidade, g.id_genero AS genero, COUNT(*) AS total_avistamentos
FROM registro_campo AS r
INNER JOIN local AS l ON r.id_local = l.id_local
INNER JOIN genero AS g ON r.id_genero = g.id_genero
GROUP BY l.id_local, g.id_genero
HAVING COUNT(*) >= 2
ORDER BY total_avistamentos DESC, localidade ASC;
