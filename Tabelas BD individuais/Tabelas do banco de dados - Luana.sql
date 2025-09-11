CREATE DATABASE GNV_Solution;
use GNV_Solution;

-- CADASTRO DO CLIENTE
CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEm VARCHAR (40),
qtdBombas int,
nomeResp VARCHAR (40),
dtRegistro DATETIME,
senha VARCHAR (20),
cdEmail VARCHAR (60)
);


-- SENSOR MQ2
CREATE TABLE sensor (
id_Sensor INT PRIMARY KEY AUTO_INCREMENT,
porcentagem_gas DECIMAL (3,1), 
tipo_gas VARCHAR (30),
dt_dia DATETIME
);

-- AVISO
CREATE TABLE Alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
nomeAlert VARCHAR (40),
	CONSTRAINT chkAlerta
		CHECK(nomeAlert IN ('Baixa','Média','Alta','Gravíssima')),
PorGas DECIMAL (3,1),
dtAlert DATETIME
);
