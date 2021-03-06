/* TI_BD_FISICO: */
CREATE DATABASE cms;

USE cms;

CREATE TABLE USUARIO
    (
      COD_USUARIO INTEGER PRIMARY KEY AUTO_INCREMENT ,
      LOGIN NVARCHAR(20) NOT NULL ,
      SENHA NVARCHAR(20) NOT NULL ,
      COD_PERFIL_USUARIO INTEGER NULL ,
      COD_PESSOA INTEGER NOT NULL
    ); 

CREATE TABLE PERFIL_USUARIO
    (
      COD_PERFIL_USUARIO INTEGER PRIMARY KEY AUTO_INCREMENT ,
      DSC_PERFIL_USUARIO NVARCHAR(20) NOT NULL
    );

CREATE TABLE PROFESSOR
    (
      COD_PROFESSOR INTEGER PRIMARY KEY AUTO_INCREMENT ,
      COD_PESSOA INTEGER NULL
    );

CREATE TABLE PESSOA
    (
      COD_PESSOA INTEGER PRIMARY KEY AUTO_INCREMENT ,
      COD_CPF NVARCHAR(11) NOT NULL ,
      NOME_PESSOA NVARCHAR(100) NOT NULL ,
      EMAIL NVARCHAR(100) NOT NULL
    );

CREATE TABLE ALUNO
    (
      COD_ALUNO INTEGER PRIMARY KEY  AUTO_INCREMENT,
      COD_PESSOA INTEGER NULL
    );

CREATE TABLE DISCIPLINA
    (
      COD_DISCIPLINA INTEGER PRIMARY KEY AUTO_INCREMENT ,
      NOME_DISCIPLINA NVARCHAR(30) ,
      QTD_CARGA_HORARIA INTEGER ,
      COD_HORARIO INTEGER ,
      COD_PROFESSOR INTEGER ,
      COD_PERIODO INTEGER
    );

CREATE TABLE HORARIO
    (
      COD_HORARIO INTEGER PRIMARY KEY  AUTO_INCREMENT,
      NUM_HORARIO NVARCHAR(10) ,
      COD_DIA_SEMANA INTEGER
    );

CREATE TABLE DIA_SEMANA
    (
      COD_DIA_SEMANA INTEGER PRIMARY KEY AUTO_INCREMENT ,
      NOME_DIA_SEMANA NVARCHAR(20)
    );

CREATE TABLE PERIODO
    (
      COD_PERIODO INTEGER PRIMARY KEY  AUTO_INCREMENT,
      NUM_PERIODO INTEGER
    );

CREATE TABLE AULA
    (
      COD_ALUNO INTEGER ,
      COD_DISCIPLINA INTEGER
    );
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_1
FOREIGN KEY (COD_PERFIL_USUARIO)
REFERENCES PERFIL_USUARIO (COD_PERFIL_USUARIO)
ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_2
FOREIGN KEY (COD_PESSOA)
REFERENCES PESSOA (COD_PESSOA)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE DISCIPLINA ADD CONSTRAINT FK_DISCIPLINA_1
FOREIGN KEY (COD_HORARIO)
REFERENCES HORARIO (COD_HORARIO)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE DISCIPLINA ADD CONSTRAINT FK_DISCIPLINA_2
FOREIGN KEY (COD_PROFESSOR)
REFERENCES PROFESSOR (COD_PROFESSOR)
ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE DISCIPLINA ADD CONSTRAINT FK_DISCIPLINA_3
FOREIGN KEY (COD_PERIODO)
REFERENCES PERIODO (COD_PERIODO)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_1
FOREIGN KEY (COD_DIA_SEMANA)
REFERENCES DIA_SEMANA (COD_DIA_SEMANA)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE PROFESSOR ADD CONSTRAINT FK_PROFESSOR_1
FOREIGN KEY (COD_PESSOA)
REFERENCES PESSOA (COD_PESSOA)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_1
FOREIGN KEY (COD_PESSOA)
REFERENCES PESSOA (COD_PESSOA)
ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE AULA ADD CONSTRAINT FK_AULA_0
FOREIGN KEY (COD_ALUNO)
REFERENCES ALUNO (COD_ALUNO)
ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE AULA ADD CONSTRAINT FK_AULA_1
FOREIGN KEY (COD_DISCIPLINA)
REFERENCES DISCIPLINA (COD_DISCIPLINA)
ON DELETE SET NULL;

INSERT  INTO PERFIL_USUARIO
        ( DSC_PERFIL_USUARIO )
VALUES  ( 'Administrador' );
INSERT  INTO PERFIL_USUARIO
        ( DSC_PERFIL_USUARIO )
VALUES  ( 'Aluno' );
INSERT  INTO PERFIL_USUARIO
        ( DSC_PERFIL_USUARIO )
VALUES  ( 'Professor' );
 
INSERT  INTO PESSOA
        ( COD_CPF ,
          NOME_PESSOA ,
          EMAIL
        )
VALUES  ( '88343970020' ,
          'HENRIQUE' ,
          'NAOTENHO@NGMTEM.COM'
        );
INSERT  INTO PESSOA
        ( COD_CPF ,
          NOME_PESSOA ,
          EMAIL
        )
VALUES  ( '30819728098' ,
          'ARTHUR' ,
          'NAOTENHO@NGMTEM.COM'
        );
INSERT  INTO PESSOA
        ( COD_CPF ,
          NOME_PESSOA ,
          EMAIL
        )
VALUES  ( '20974055093' ,
          'LUCAS' ,
          'NAOTENHO@NGMTEM.COM'
        );
 
INSERT  INTO USUARIO
        ( LOGIN ,
          SENHA ,
          COD_PERFIL_USUARIO ,
          COD_PESSOA
        )
VALUES  ( 'hkirschke' ,
          'hk1234' ,
          ( SELECT  COD_PERFIL_USUARIO
            FROM    PERFIL_USUARIO
            WHERE   DSC_PERFIL_USUARIO = 'Administrador'
          ) ,
          ( SELECT  COD_PESSOA
            FROM    PESSOA
            WHERE   NOME_PESSOA = 'HENRIQUE'
          )
        );
INSERT  INTO USUARIO
        ( LOGIN ,
          SENHA ,
          COD_PERFIL_USUARIO ,
          COD_PESSOA
        )
VALUES  ( 'arthur' ,
          'senha#123' ,
          ( SELECT  COD_PERFIL_USUARIO
            FROM    PERFIL_USUARIO
            WHERE   DSC_PERFIL_USUARIO = 'Administrador'
          ) ,
          ( SELECT  COD_PESSOA
            FROM    PESSOA
            WHERE   NOME_PESSOA = 'ARTHUR'
          )
        );
INSERT  INTO USUARIO
        ( LOGIN ,
          SENHA ,
          COD_PERFIL_USUARIO ,
          COD_PESSOA
        )
VALUES  ( 'lucas' ,
          'senha#123' ,
          ( SELECT  COD_PERFIL_USUARIO
            FROM    PERFIL_USUARIO
            WHERE   DSC_PERFIL_USUARIO = 'Administrador'
          ) ,
          ( SELECT  COD_PESSOA
            FROM    PESSOA
            WHERE   NOME_PESSOA = 'LUCAS'
          )
        ); 
INSERT  INTO USUARIO
        ( LOGIN ,
          SENHA ,
          COD_PERFIL_USUARIO ,
          COD_PESSOA
        )
VALUES  ( 'hAluno' ,
          'hk1234' ,
          ( SELECT  COD_PERFIL_USUARIO
            FROM    PERFIL_USUARIO
            WHERE   DSC_PERFIL_USUARIO = 'Aluno'
          ) ,
          ( SELECT  COD_PESSOA
            FROM    PESSOA
            WHERE   NOME_PESSOA = 'HENRIQUE'
          )
        );
INSERT  INTO USUARIO
        ( LOGIN ,
          SENHA ,
          COD_PERFIL_USUARIO ,
          COD_PESSOA
        )
VALUES  ( 'hProfessor' ,
          'hk1234' ,
          ( SELECT  COD_PERFIL_USUARIO
            FROM    PERFIL_USUARIO
            WHERE   DSC_PERFIL_USUARIO = 'Professor'
          ) ,
          ( SELECT  COD_PESSOA
            FROM    PESSOA
            WHERE   NOME_PESSOA = 'HENRIQUE'
          )
        ); 
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'SEGUNDA-FEIRA' );
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'TERÇA-FEIRA' );
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'QUARTA-FEIRA' );
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'QUINTA-FEIRA' );
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'SEXTA-FEIRA' );
INSERT  INTO DIA_SEMANA
        ( NOME_DIA_SEMANA )
VALUES  ( 'SÁBADO' );

DELIMITER $$ 
CREATE PROCEDURE SPCARREGA_PERFIL()
BEGIN
	SELECT COD_PERFIL_USUARIO ID ,DSC_PERFIL_USUARIO DSC FROM PERFIL_USUARIO;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE  SPCONSULTA_USUARIO (  IN sLogin VARCHAR(20) ,   IN pkUsuario VARCHAR(4) ,    IN sNomePessoa VARCHAR(100) ,  IN sCpf VARCHAR(100)   )
BEGIN
	 SET pkUsuario = IFNULL(pkUsuario, '');
	 SET sLogin = IFNULL(sLogin, '');
	 SET sNomePessoa = IFNULL(sNomePessoa, '');
	 SET sCpf = IFNULL(sCpf, '');  
	 SET @sSql = 'SELECT  U.COD_USUARIO ID ,
            U.LOGIN LOGIN ,
            PU.DSC_PERFIL_USUARIO PERFIL ,
            P.NOME_PESSOA,
 	        P.COD_CPF,
	        P.EMAIL,
			P.COD_PESSOA,
			PU.COD_PERFIL_USUARIO,
			U.SENHA
    FROM    USUARIO U
            LEFT JOIN PERFIL_USUARIO PU ON PU.COD_PERFIL_USUARIO = U.COD_PERFIL_USUARIO
            LEFT JOIN PESSOA P ON P.COD_PESSOA = U.COD_PESSOA WHERE 1=1 ';
    IF (pkUsuario <> '')  THEN 
            SET @sSql = @sSql + ' AND U.COD_USUARIO = ' + pkUsuario; 	
         END IF;
    IF (sLogin <> '' ) THEN 
            SET @sSql = @sSql + ' AND U.NOME_USUARIO LIKE ''' + sLogin + '%''';
         END IF;
    IF (sNomePessoa <> '')  THEN 
            SET @sSql = @sSql + ' AND P.NOME_PESSOA LIKE ''' + sNomePessoa + '%''';
         END IF;
    IF (sCpf <> '') THEN 
            SET @sSql  = @sSql + ' AND P.COD_CPF = ''' + sCpf + '''';
            END IF;
	PREPARE myquery FROM @sSql;
    EXECUTE myquery; 
	DEALLOCATE PREPARE myquery;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE  SPCRIA_ACESSO (
    sNome  VARCHAR(100) ,
    sCpf  VARCHAR(11) ,
    sEmail  VARCHAR(100)  ,
    sLoginUS  VARCHAR(20) ,
    sSenhaUS  VARCHAR(20) ,
    pkPerfilUS INTEGER)
BEGIN
	SET sEmail = IFNULL(sEmail, '');
    SET @PKPESSOA = ( SELECT COD_PESSOA
                                     FROM   PESSOA
                                     WHERE  COD_CPF = sCpf
                                   );
	SET @PKPESSOA = IFNULL(@PKPESSOA, 0);                            
    IF (@PKPESSOA = 0) THEN 
         CALL SPCRIA_PESSOA (  sNome,   sCpf,  sEmail);
        END IF;
    SET @PKPESSOA = ( SELECT    COD_PESSOA
                      FROM      PESSOA
                      WHERE     COD_CPF = sCpf
                    );
    CALL SPINSERI_USUARIO ( sLoginUS,  sSenhaUS,
        pkPerfilUS,  @PKPESSOA);
END $$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE  SPCRIA_PESSOA(
   IN sNomePessoa VARCHAR(100),
   IN	sCpfPessoa VARCHAR(11),
   IN sEmailPessoa VARCHAR(100)  
    )
BEGIN
		SET sEmailPessoa = IFNULL(sEmailPessoa, '');
			INSERT INTO PESSOA
					( NOME_PESSOA ,
					 COD_CPF,
					 EMAIL)
				VALUES(sNomePessoa ,sCpfPessoa ,sEmailPessoa); 
 END $$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE SPDELETA_PERFIL( pkPerfil   INTEGER)
BEGIN
    UPDATE  USUARIO
    SET     COD_PERFIL_USUARIO = NULL
    WHERE   COD_PERFIL_USUARIO = pkPerfil;
	DELETE FROM PERFIL_USUARIO 
WHERE
    COD_PERFIL_USUARIO = pkPerfil;
END $$
DELIMITER ;

 DELIMITER $$ 
CREATE PROCEDURE SPDELETA_USUARIO (IN pkUsuario INT)
BEGIN
  DELETE  FROM USUARIO
    WHERE   COD_USUARIO = pkUsuario;
END;
 $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE  SPGRAVA_DADOS_USUARIO(
   IN sNome   VARCHAR(255) ,
   IN sCpf   VARCHAR(11) ,
   IN sEmail   VARCHAR(255)   ,
   IN sLoginUS   VARCHAR(20) ,
   IN sSenhaUS   VARCHAR(20) ,
   IN pkPerfilUS   INTEGER ,
   IN pkUsuario   INTEGER
    )
BEGIN
 SET sEmail = IFNULL(sEmail, '');
    SET @PKPESSOA  = 0; 
    SET @PKPESSOA = ( SELECT    COD_PESSOA
                      FROM      USUARIO U
                      WHERE     U.COD_USUARIO = pkUsuario
                    );
                     
UPDATE USUARIO U 
SET 
    U.COD_PERFIL_USUARIO = pkPerfilUS,
    U.SENHA = sSenhaUS,
    U.LOGIN = sLoginUS
WHERE
    U.COD_USUARIO = pkUsuario;
UPDATE PESSOA P 
SET 
    P.EMAIL = sEmail,
    P.NOME_PESSOA = sNome,
    P.COD_CPF = sCpf,
    P.EMAIL = sEmail
WHERE
    P.COD_PESSOA = @PKPESSOA; 
END $$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE SPINSERI_USUARIO(
   IN sLogin  VARCHAR(20) ,
   IN sSenha  VARCHAR(20) ,
   IN pkPerfil VARCHAR(20) ,
   IN pkPessoa  INTEGER)
 BEGIN
    INSERT  INTO USUARIO
            ( LOGIN ,
              SENHA ,
              COD_PERFIL_USUARIO ,
              COD_PESSOA
            )
    VALUES  ( sLogin ,
              sSenha ,
              pkPerfil ,
              pkPessoa
            );
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SPVERIFICA_LOGIN(
   IN  sLogin   VARCHAR(255) ,
   IN sSenha   VARCHAR(255)
   )
BEGIN
    SELECT  U.COD_USUARIO
    FROM    USUARIO U
    WHERE   U.LOGIN = sLogin
            AND U.SENHA = sSenha;
END $$
DELIMITER ;

DELIMITER $$ 
CREATE   PROCEDURE SPVERIFICA_CPF (IN sCpfPessoa VARCHAR(11))
BEGIN 
    SELECT  P.COD_PESSOA
    FROM    PESSOA P
    WHERE   P.COD_CPF = sCpfPessoa;
END $$
DELIMITER ;