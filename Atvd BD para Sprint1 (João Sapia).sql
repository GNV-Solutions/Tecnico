-- Tabela Individual Contendo Dados do Projeto
CREATE DATABASE projetoPI;
USE projetoPI;
-- Tabela Para o Sensor
CREATE TABLE sensor(
IdSensor INT PRIMARY KEY AUTO_INCREMENT,
qtdGas FLOAT,
Dispenser INT
)AUTO_INCREMENT = 1;

INSERT INTO sensor VALUES
	(default,325.7,1),
	(default,957.4,3),
	(default,820.3,2);

DESCRIBE sensor;

SELECT * FROM sensor;

SELECT qtdGas, Dispenser FROM sensor
	WHERE qtdGas >= 800 ;

SELECT CONCAT(' Dispenser: ', Dispenser, ' Está com: ', qtdGas, ' de gás') AS Dispensers_em_Risco FROM sensor
	WHERE qtdGas >= 800;

-- Tabela Para os Usuários
CREATE TABLE usuario(
IdUsuário INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(30) NOT NULL,
Email VARCHAR(40) NOT NULL UNIQUE,
Senha CHAR(6) NOT NULL UNIQUE,
Cargo VARCHAR(40)
)AUTO_INCREMENT = 1;

ALTER TABLE usuario ADD CONSTRAINT chkCargo CHECK(Cargo IN("Frentista", "Gerente", "Supervisor"));
ALTER TABLE usuario RENAME COLUMN IdUsuário to idUsuario;

INSERT INTO usuario VALUES
	(default,'Jonhatan Joestar','JonhatanJoestar@gmail.com','JOBROS','Supervisor'),
	(default,'Jolyne Kujo','StoneOcean@gmail.com','HEAVEN','Gerente'),
	(default,'Jotaro Kujo','StarPlatinum@gmail.com','KUJOJO','Frentista');

UPDATE usuario SET Senha = 'CHERRY' 
	WHERE Nome LIKE '%ro %jo';

SELECT * FROM usuario;

SELECT CONCAT(Nome,' - ', Cargo) AS Membro_Do_Posto FROM usuario;

DESCRIBE usuario;     

-- Tabela Para Notificação 
CREATE TABLE notificar(
IdNotificar INT PRIMARY KEY AUTO_INCREMENT,
Nivel VARCHAR (20) CONSTRAINT chkNivel CHECK(Nivel IN ('Baixo','Médio','Alto','Grave')))AUTO_INCREMENT = 1;

INSERT INTO notificar VALUES
	(default,'Baixo'),
	(default,'Alto');
	
SELECT Nivel,
		CASE
	WHEN Nivel = 'Baixo' THEN 'Tudo tranquilo, existem baixos riscos de explosão'
	WHEN Nivel = 'Alto' THEN 'Cuidado, existem altos riscos de explosão'
    END AS 'Chance de Explosão'
    FROM notificar;
    
TRUNCATE TABLE notificar;

INSERT INTO notificar VALUES
	(default,'Grave'),
	(default,'Alto'),
	(default,'Médio'),
	(default,'Baixo');

SELECT Nivel FROM notificar
	WHERE Nivel LIKE '%O';

DELETE FROM notificar
	WHERE idNotificar = 2;

SELECT * FROM notificar;

DROP TABLE notificar;

