-- Banco de Dados da GNV SOLUTIONS
CREATE DATABASE GNV_Solutions;
USE GNV_Solutions;

-- CADASTRO USUARIO
CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
rzSocial VARCHAR (40),
num_Cadastro INT,
dtRegistro DATETIME,
senha VARCHAR (20),
email VARCHAR (60),
cnpj VARCHAR(14)
) AUTO_INCREMENT = 100
;

DESC Usuario;


drop table Usuario;


INSERT INTO Usuario VALUES
	(DEFAULT,'Petrobrás', 1,'2025-01-23','URUBU100', 'petrobras@gmail.com','34242413213367'),
	(DEFAULT,'Shell', 2,'2025-01-25','uRUBU200', 'shell@gmail.com','36774829193214'),
	(DEFAULT,'BOXTER', 3,'2025-01-25','uRUBU300', 'boxter@gmail.com','67223345666733'),
	(DEFAULT,'Grall', 4,'2025-01-25','uRUBU400', 'grall@gmail.com','32112413219967');
    
SELECT * FROM Usuario;

    -- Adcionando mais um dado    
	INSERT INTO Usuario VALUES
	(DEFAULT,'Ipiranga', 5,'2024-01-11','Ipiri20', 'Ipiri@gmail.com',44325678943567);
    
    
-- EXIBINDO DADOS ESPECIFICOS(NOME EMPRESA, CNPJ, NOME RESPONSÁVEL
	SELECT rzSocial, cnpj, nomeResp FROM Usuario;
    
--  ORDEM ALFABÉTICA USUÁRIO (crescente e decrescente) 
    SELECT * FROM Usuario  ORDER BY rzSocial ASC;
    SELECT * FROM Usuario  ORDER BY rzSocial DESC;
    
--  EXIBIR EMAIL CONTATO DA EMPRESA
    SELECT CONCAT('A empresa ', rzSocial,
	' possui o contato email:  ', cdEmail, '!') AS 'Contato da Empresa'
	FROM Usuario;
    
    
-- Limpeza de dados
TRUNCATE TABLE Usuario;
    
    
-- LEITURA DO ARDUINO
CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
local_sensor VARCHAR(40),
num_sensor INT 
) AUTO_INCREMENT = 100;

INSERT INTO sensor VALUES
	(DEFAULT, '01'),
	(DEFAULT, '02'),
	(DEFAULT, '03');
    
DESC sensor;

DELETE FROM sensor
	WHERE id = 1;
 
-- ALERTA!
CREATE TABLE Alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
nomeAlert VARCHAR(40),
	CONSTRAINT chkAlerta
		CHECK(nomeAlert IN ('Baixa','Média','Alta')),
local_alerta VARCHAR(40),
dtAlert DATETIME
)auto_increment = 10 ;

DESC Alerta;

INSERT INTO Alerta VALUES
	(default, 'Média','Dispenser A' ,'2025-02-12 12:00:00' ),
	(default,'Alta','Dispenser B' ,'2025-01-12 12:00:02' ),
	(default,'Baixa','Dispenser C' ,'2025-03-12 12:00:04' ),
	(default, 'Baixa','Dispenser D' ,'2025-04-12 12:00:06');
    
SELECT * FROM Alerta;
 
 -- OBSERVAÇÃO GERAL --
 
 SHOW TABLES; 
 
 drop table alerta;