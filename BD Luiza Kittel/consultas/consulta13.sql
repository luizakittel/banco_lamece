-- Consulta 13: Confirmar uma alteracao e desfazer outra dentro da mesma transacao.
-- Demonstra SAVEPOINT, ROLLBACK TO, RELEASE e COMMIT.
-- A primeira alteracao permanece; a segunda e revertida.
BEGIN TRANSACTION;
UPDATE tag SET ativa = 0 WHERE id_tag = 'barco';
SAVEPOINT teste_tag;
UPDATE tag SET ativa = 0 WHERE id_tag = 'habitat';
ROLLBACK TO SAVEPOINT teste_tag;
RELEASE SAVEPOINT teste_tag;
COMMIT;
SELECT id_tag, ativa FROM tag WHERE id_tag IN ('barco', 'habitat') ORDER BY id_tag;
