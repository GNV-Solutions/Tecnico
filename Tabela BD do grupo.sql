CREATE DATABASE GNV_Solution;
use GNV_Solution;

-- CADASTRO USUARIO
CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeResp VARCHAR (40),
dtRegistro DATETIME,
senha VARCHAR (20),
cdEmail VARCHAR (60)
);

INSERT INTO Usuario VALUES
	(DEFAULT,'Petrobrás', 10,'João Felipe','2025-01-23','URUBU100', 'petrobras.123@gmail.com'),
	(DEFAULT,'Shell', 5,'João Giovanni','2025-01-25','URUBU200', 'shell.321@gmail.com');
    
SELECT CONCAT('O empresário ' , nomeResp, dtRegistro , '. Senha do registro ' , senha , '. Contado da empresa' , cdEmail, '') as 'Cadastro das Empresas' FROM usuario;
SELECT CONCAT(' Senha do registro ' , senha , '. Contado da empresa' , cdEmail, '') AS 'Contato da empresa' FROM usuario;


    
SELECT * FROM Usuario;

-- leitura arduino
CREATE TABLE sensor (
id_Sensor INT PRIMARY KEY AUTO_INCREMENT,
num_sensor int
);

INSERT INTO sensor VALUES
	(DEFAULT, '01'),
	(DEFAULT, '02'),
	(DEFAULT, '09');
    
SELECT idSensor AS 'N° do sensor', 
	num_gas AS 'N° do sensor'; 
	 
SELECT * FROM sensor;

DESC sensor;


-- ALERTA! LED COMO INDICADOR DA PORCENTAGEM
CREATE TABLE Alerta (
id_Alerta INT PRIMARY KEY AUTO_INCREMENT,
nomeAlert VARCHAR (40),
	CONSTRAINT chkAlerta
		CHECK(nomeAlert IN ('Baixa','Média','Alta','Gravíssima')),
dt_alert DATETIME
);

INSERT INTO Alerta VALUES
	(default, 'Média', '2025-02-12 12:00:00' ),
	(default,'Alta', '2025-01-12 12:00:02' ),
	(default,'Baixa','2025-03-12 12:00:04' ),
	(default, 'Baixa','2025-04-12 12:00:06'),
	(default, 'Gravíssima', '2025-04-12 12:00:07' );
    
-- MOSTRAR UMA CONCATENAÇÃO
SELECT CONCAT(nomeAlert, ' - ', PorGas, '% de gás') AS info FROM Alerta;

-- MOSTRAR OUTRA CONCATENAÇÃO
SELECT CONCAT('Nível de alerta: ', nomeAlert) AS nível FROM Alerta;

SELECT * FROM Alert;
    
SELECT id_Alert AS 'Registro', 
	Por_gas AS 'Porcentagem do gás', 
	tipo AS 'Tipo do sensor', 
	dtHora AS 'Horário do registro',
	numSensor AS 'N° do Sensor',
	CASE
        WHEN Por_gas > 66 THEN 'Evacue o local, agora!!!!'
        WHEN Por_gas > 33 AND Por_gas <= 66  THEN 'Atenção, procure a origem do vazamento'
        ELSE 'Sem risco'
	END AS 'Periculosidade'
FROM Alert;


-- ESTOQUE NA NOSSA EMPRESA SOBRE O SENSOR
create table Estoque(
	id_estoque int primary key auto_increment,
    sensor int,
    arduino int,
    sensor_manutencao boolean,
    arduino_manutencao boolean
    );
    
DESC Estoque;

INSERT INTO Estoque VALUES
	(DEFAULT,45,98,true,false),
	(DEFAULT,7,10,false,true);
    
SELECT 
    id_estoque AS 'ID Estoque',
    sensor AS 'Sensores Disponíveis',
    arduino AS 'Arduinos Disponíveis',
    sensor_manutencao AS 'Sensores em Manutenção',
    arduino_manutencao AS 'Arduinos em Manutenção',
    CONCAT(
        'Estoque ID ', id_estoque, ': ',
        sensor, ' sensores, ',
        arduino, ' arduinos. ',
        'Sensores manutenção: ', sensor_manutencao, 
        ', Arduinos manutenção: ', arduino_manutencao
    ) AS 'Resumo do Estoque'
FROM Estoque;

DROP TABLE Estoque;

SELECT * FROM Alert;

CREATE TABLE Manutencao_Sensores (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor INT,
    data_manutencao DATE,
    tipo_manutencao VARCHAR(50),
    responsavel VARCHAR(100)
);

-- Manutenção em um sensor qualquer
INSERT INTO Manutencao_Sensores (id_sensor, data_manutencao, tipo_manutencao, responsavel) VALUES 
	(1, '2025-08-01', 'Calibração', 'Saori Eberli'),
	(2, '2025-08-10', 'Limpeza', 'Marcelo Marcanzoni'),
	(3, '2025-08-15', 'Substituição', 'Rai Jonas'),
	(4, '2025-08-20', 'Calibração', 'Eduardo Abreu'),
	(5, '2025-08-25', 'Revisão completa', 'Livia Gabrielly');

select * from Manutencao_Sensores;

SELECT * FROM Manutencao_Sensores
	WHERE responsavel = 'Saori Eberli';

SELECT * FROM Manutencao_Sensores
	WHERE data_manutencao > '2025-08-15';

SELECT 
    id_manutencao AS Codigo,
    tipo_manutencao AS Tipo,
    responsavel AS Tecnico
FROM Manutencao_Sensores;

SELECT 
    id_manutencao,
    tipo_manutencao,
    CASE 
        WHEN tipo_manutencao = 'Calibração' THEN 'Ajuste técnico'
        WHEN tipo_manutencao = 'Limpeza' THEN 'Preventiva'
        WHEN tipo_manutencao = 'Substituição' THEN 'Corretiva'
        ELSE 'Outro tipo'
    END AS Categoria
FROM Manutencao_Sensores;

TRUNCATE Manutencao_Sensores;

show tables;
    
CREATE TABLE Registro (
idRegistro int primary key auto_increment,
porcentagemGas float,
dtHora datetime,
numDispenser int
);
;