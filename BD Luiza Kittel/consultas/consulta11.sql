-- Consulta 11: Atribuir lotes apenas a midias da mesma localidade e data de captura.
-- Os lotes representam agrupamentos didaticos; mesma data/local nao comprova mesmo contexto ambiental.
-- Lote 1: Trindade, 2025-11-02 (296, 297).
-- Lote 2: Trindade, 2026-08-31 (336, 342, 343).
-- Lote 3: Trindade, 2026-09-04 (344, 345).
-- Lote 4: Trindade, 2026-09-15 (347, 348, 349).
-- As midias 195 e 226 permanecem sem lote por falta de contexto compartilhado confirmado.
-- Execute no banco de trabalho; COMMIT torna as atribuicoes permanentes.
BEGIN TRANSACTION;
UPDATE registro_midia SET id_lote = 1
WHERE id_midia IN (296, 297) AND id_local = 'praia_das_andradas' AND data_captura = '2025-11-02';
UPDATE registro_midia SET id_lote = 2
WHERE id_midia IN (336, 342, 343) AND id_local = 'praia_das_andradas' AND data_captura = '2026-08-31';
UPDATE registro_midia SET id_lote = 3
WHERE id_midia IN (344, 345) AND id_local = 'praia_das_andradas' AND data_captura = '2026-09-04';
UPDATE registro_midia SET id_lote = 4
WHERE id_midia IN (347, 348, 349) AND id_local = 'praia_das_andradas' AND data_captura = '2026-09-15';
COMMIT;
SELECT id_lote, COUNT(*) AS total_midias
FROM registro_midia
GROUP BY id_lote
ORDER BY id_lote ASC;
