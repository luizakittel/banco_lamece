-- Consulta 05: Encontrar midias cuja profundidade supera a media de todas as midias com profundidade informada.
-- Utiliza subconsulta escalar e tratamento de NULL.
SELECT id_midia, nome_original, profundidade_m
FROM registro_midia
WHERE profundidade_m IS NOT NULL
  AND profundidade_m > (SELECT AVG(profundidade_m) FROM registro_midia WHERE profundidade_m IS NOT NULL)
ORDER BY profundidade_m DESC;
