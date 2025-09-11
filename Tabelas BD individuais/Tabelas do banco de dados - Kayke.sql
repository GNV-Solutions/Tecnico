-- Banco de Dados 
CREATE DATABASE Sensor_gas;
use Sensor_gas;

-- CADASTRO USUARIO
CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEm VARCHAR (40),
qtdTanque int,
nomeResp VARCHAR (40),
dtRegistro DATETIME,
senha VARCHAR (20),
cdEmail VARCHAR (60)
);

DESC Usuario;

INSERT INTO Usuario VALUES
	(DEFAULT,'Petrobrás', 10,'João Felipe','2025-01-23','URUBU100', 'petrobras.123@gmail.com'),
	(DEFAULT,'Shell', 5,'João Giovanni','2025-01-25','uRUBU200', 'shell.321@gmail.com');
    
SELECT * FROM Usuario;
    
-- LEITURA DO ARDUINO
CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
Por_gas DECIMAL (3,1),
tipo VARCHAR (30),
dtHora DATETIME
);

DESC sensor;

INSERT INTO sensor VALUES
	(DEFAULT, '80', 'analógico', '2025-08-28 12:00:00'),
	(DEFAULT, '30', 'analógico', '2025-08-28 12:00:02'),
	(DEFAULT, '30', 'analógico', '2025-08-28 12:00:04');
    
SELECT * FROM sensor;

/* 
 A TABELA LEITURA DO ARDUINO ESTÁ INTERLIGADA COM A DO ALERTA
*/

-- ALERTA!
CREATE TABLE Alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
nomeAlert VARCHAR (40),
	CONSTRAINT chkAlerta
		CHECK(nomeAlert IN ('Baixa','Média','Alta','Gravíssima')),
PorGas DECIMAL (3,1),
dtAlert DATETIME
);

DESC Alerta;

INSERT INTO Alerta VALUES
	(default, 'Média','35.5', '2025-02-12 12:00:00' ),
	(default,'Alta','70.1', '2025-01-12 12:00:02' ),
	(default,'Baixa', '10.0','2025-03-12 12:00:04' ),
	(default, 'Baixa', '9.5', '2025-04-12 12:00:06'),
	(default, 'Gravíssima', '90.0', '2025-04-12 12:00:07' );
    
SELECT * FROM Alerta;

UPDATE Alerta SET PorGas = 
