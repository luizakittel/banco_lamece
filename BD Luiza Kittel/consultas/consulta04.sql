-- Consulta 04: Comparar a quantidade de avistamentos dentro e fora de tocas por tipo de mergulho.
-- Utiliza COUNT, SUM com CASE, GROUP BY e ordenacao ascendente.
SELECT tipo_amostragem,
       COUNT(*) AS total_avistamentos,
       SUM(CASE WHEN dentro_toca = 1 THEN 1 ELSE 0 END) AS avistamentos_na_toca,
       SUM(CASE WHEN dentro_toca = 0 THEN 1 ELSE 0 END) AS avistamentos_fora_da_toca
FROM registro_campo
WHERE tipo_amostragem IS NOT NULL
GROUP BY tipo_amostragem
ORDER BY tipo_amostragem ASC;
