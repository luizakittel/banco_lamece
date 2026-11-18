-- Consulta 03: Calcular a profundidade media, minima e maxima dos avistamentos por especie identificada.
-- Utiliza AVG, MIN, MAX e ROUND.
SELECT e.id_especie AS especie,
       ROUND(AVG(r.profundidade_m), 2) AS profundidade_media_m,
       MIN(r.profundidade_m) AS profundidade_minima_m,
       MAX(r.profundidade_m) AS profundidade_maxima_m
FROM registro_campo AS r
INNER JOIN especie AS e ON r.id_especie = e.id_especie
WHERE r.profundidade_m IS NOT NULL
GROUP BY e.id_especie
ORDER BY profundidade_media_m DESC;
