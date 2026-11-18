-- Consulta 08: Resumir midias por genero, incluindo midias sem genero identificado.
-- Utiliza CTE, CASE e IS NULL.
WITH midias_classificadas AS (
    SELECT CASE WHEN id_genero IS NULL THEN 'nao_identificado'
                ELSE id_genero END AS genero
    FROM registro_midia
)
SELECT genero, COUNT(*) AS total_midias
FROM midias_classificadas
GROUP BY genero
ORDER BY total_midias DESC, genero ASC;
