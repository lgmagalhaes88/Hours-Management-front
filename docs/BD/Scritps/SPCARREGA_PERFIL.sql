DELIMITER $$ 
CREATE PROCEDURE SPCARREGA_PERFIL()
BEGIN
	SELECT COD_PERFIL_USUARIO ID ,DSC_PERFIL_USUARIO DSC FROM PERFIL_USUARIO;
END $$
DELIMITER ;