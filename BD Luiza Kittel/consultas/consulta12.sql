-- Consulta 12: Testar uma mudanca na descricao de um local e desfaze-la completamente.
-- Demonstra BEGIN, UPDATE e ROLLBACK; nenhuma mudanca e mantida.
BEGIN TRANSACTION;
UPDATE local SET descricao = 'Descricao temporaria para teste'
WHERE id_local = 'praia_do_forno';
SELECT id_local, descricao FROM local WHERE id_local = 'praia_do_forno';
ROLLBACK;
SELECT id_local, descricao FROM local WHERE id_local = 'praia_do_forno';
