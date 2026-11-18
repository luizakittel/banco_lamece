-- Consulta 06: Identificar usuarios que cadastraram midias com pelo menos um comentario de conferencia.
-- Utiliza subconsulta correlacionada com EXISTS.
SELECT u.id_usuario, u.login
FROM usuario AS u
WHERE EXISTS (
    SELECT 1
    FROM registro_midia AS m
    INNER JOIN comentario_midia AS c ON c.id_midia = m.id_midia
    WHERE m.id_usuario_cadastro = u.id_usuario
)
ORDER BY u.login ASC;
