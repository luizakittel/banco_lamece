-- Consulta 09: Encontrar integrantes de expedicoes que nao aparecem como autores de nenhum relatorio.
-- Utiliza LEFT JOIN e IS NULL.
SELECT DISTINCT i.id_integrante, i.instituicao
FROM integrante AS i
INNER JOIN expedicao_integrante AS ei ON ei.id_integrante = i.id_integrante
LEFT JOIN relatorio_autor AS ra ON ra.id_integrante = i.id_integrante
WHERE ra.id_integrante IS NULL
ORDER BY i.id_integrante ASC;
