CREATE DATABASE GNV_Solutions;
USE GNV_Solutions;


CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR (40),
cnpj CHAR(18),
dtCadastro DATE,
senha VARCHAR (20),
cdEmail VARCHAR (60) UNIQUE
);

INSERT INTO Usuario VALUES
	(DEFAULT, 'João Felipe','00.000.000/0000-01', '2025-01-23','URUBU100', 'petrobras.123@gmail.com'),
	(DEFAULT, 'Giovanni Kayke', '00.000.000/0000-02', '2025-01-25', 'URUBU200', 'shell.321@gmail.com');
    
SELECT * FROM Usuario;
    
/*-------------------*/

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
numeroSensor INT
);

INSERT INTO Sensor VALUES
	(DEFAULT, '01'),
	(DEFAULT, '02'),
	(DEFAULT, '03'),
	(DEFAULT, '04');
    
SELECT * FROM Sensor;

/*-------------------*/
    
CREATE TABLE Registro (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
porcentagemGas FLOAT,
dataAlerta DATETIME
);

INSERT INTO Registro VALUES
	(default, 00.00, '2025-09-12 12:00:00'),
	(default, 01.00, '2025-09-12 12:00:01'),
	(default, 02.00, '2025-09-12 12:00:02'),
	(default, 13.00, '2025-09-12 12:00:03');
    
SELECT * FROM Registro;

/*-------------------*/
    
CREATE TABLE ManutencaoSensor (
    idManutencao INT PRIMARY KEY AUTO_INCREMENT,
    dataManutencao DATE,
    tipoManutencao VARCHAR(50)
);

INSERT INTO ManutencaoSensor VALUES
	(default, '2025-09-28', 'Substituição'),
	(default, '2025-09-30', 'Limpeza'),
	(default, '2025-10-02', 'Calibração');
    
SELECT * FROM ManutencaoSensor;