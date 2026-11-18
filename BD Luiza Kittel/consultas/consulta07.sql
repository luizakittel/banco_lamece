-- Consulta 07: Reunir todos os registros de campo identificados como Macrotritopus cf. defilippi.
-- Utiliza subconsulta IN para selecionar a especie e ordenacao por data.
SELECT r.*
FROM registro_campo AS r
WHERE r.id_especie IN (
    SELECT e.id_especie
    FROM especie AS e
    WHERE e.id_especie = 'macrotritopus_cf_defilippi'
)
ORDER BY r.data_avistamento ASC, r.id_registro ASC;
