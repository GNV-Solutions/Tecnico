-- CRIAR DATABASE
CREATE DATABASE ProjetoGNV;

-- USAR DATABASE
USE ProjetoGNV;

-- CRIAR TABELA USUÁRIO
CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
senha VARCHAR(16) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- INSERIR USUÁRIOS
INSERT INTO Usuario (nome, email, senha) VALUES
('João Silva', 'joao@empresa.com', '123456'),
('Wagner Silva', 'wagner@empresa.com', 'senha123'),
('Felipe Souza', 'felipe@empresa.com', 'admin2025');

SELECT * FROM Usuario;

-- CRIAR TABELA POSTO
CREATE TABLE Posto (
idPosto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
endereco VARCHAR(80),
cidade VARCHAR(50),
estado CHAR(2),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Posto (nome, endereco, cidade, estado) VALUES
('Posto Central', 'Av. Paulista, 1000', 'São Paulo', 'SP'),
('Posto Rio', 'Av. Atlântica, 250', 'Rio de Janeiro', 'RJ');

SELECT * FROM Posto;

-- CRIAR TABELA SENSOR
CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(20) NOT NULL,
CONSTRAINT chk_tipo CHECK (tipo IN ('Analógico','Digital')),
localizacao VARCHAR(100),
dtInstalacao DATETIME,
status VARCHAR(20),
CONSTRAINT chk_status CHECK (status IN ('Ativo','Inativo','Manutenção'))
);

INSERT INTO Sensor (tipo, localizacao, dtInstalacao, status) VALUES
('Analógico', 'Área de abastecimento', '2025-01-15 10:00:00', 'Ativo'),
('Analógico', 'Área de abastecimento', '2025-02-05 14:30:00', 'Ativo'),
('Analógico', 'Área externa', '2025-03-20 09:15:00', 'Manutencao');

SELECT * FROM Sensor;

-- CRIAR TABELA LEITURA SENSOR
CREATE TABLE LeituraSensor (
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(4,2) NOT NULL,
dtLeitura DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO LeituraSensor (valor) VALUES
(20.50),
(30.75),
(80.20);

SELECT * FROM LeituraSensor;

-- CRIAR TABELA ALERTA
CREATE TABLE Alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
nivel VARCHAR(20) NOT NULL,
CONSTRAINT chkNivel CHECK (nivel IN ('Baixo','Moderado','Crítico')),
mensagem VARCHAR(100) NOT NULL,
CONSTRAINT chkMensagem CHECK (mensagem IN ('Fechar válvula de cilindro','Isolar local','Evacuar agora!!!')),
dtAlerta DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Alerta (nivel, mensagem, dtAlerta) VALUES
('Baixo', 'Fechar válvula de cilindro', '2025-09-10 08:05:00'),
('Moderado', 'Isolar local', '2025-09-10 08:15:00'),
('Critico', 'Evacuar agora!!!', '2025-09-10 08:20:00');

SELECT * FROM Alerta;