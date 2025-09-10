 create database GnvSolutions;
 
 use GnvSolutions;
 
 
 -- TABELA 1 (Usuário)
 
 create table Usuario (
 idUsuario INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(30),
 sobrenome VARCHAR(50),
 telefone VARCHAR(15),
 email VARCHAR(60),
 senha VARCHAR(20)
 );
 
insert into Usuario (nome, sobrenome, telefone, email, senha) values
	('Carlos', 'Alberto Jr', '11977837322', 'carlos.gerente@xmail.com', 'PostoCarlos123'),
	('Enrico', 'Rico', '11940028922', 'rico.postos@xmail.com', 'Ricocombustiveis321'),
	('Alexandre', 'Sandrini', '11998366411', 'postos.ale@xmail.com', 'Posto.ale.famoso');
    
select * from Usuario;

select concat(nome, ' ', sobrenome) as 'Nome Completo'
	from Usuario;
    
alter table Usuario add column tipoUsuario VARCHAR(15);

alter table Usuario add constraint chkTipo
	check (tipoUsuario IN('cliente', 'funcionario'));
    
update Usuario set tipoUsuario = 'cliente'
	where id = '1';
    
update Usuario set tipoUsuario = 'cliente'
	where id = '2';

update Usuario set tipoUsuario = 'cliente'
	where id = '3';

insert into Usuario (nome, sobrenome, telefone, email, senha, tipoUsuario) values
	('José', 'Aragão', '11915775132', 'josetecnico123@xmail.com', 'Jose.Arduino2025', 'funcionario');
    
select CONCAT(nome, ' ', sobrenome) as 'Nome de usuário',
    case
        when tipoUsuario = 'cliente' then 'Posto'
        when tipoUsuario = 'funcionario' then 'Técnico'
    end as 'Tipo de usuário'
from Usuario;
    
    
-- TABELA 2 (Sensor)

create table Sensor (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
numeroSensor INT,
porcentagemGas FLOAT,
horario TIME,
dia DATE
);

insert into Sensor (numeroSensor, porcentagemGas, horario, dia) values
	(1, 28.01, '11:00:01', '2025-10-07'),
	(2, 27.01, '11:00:01', '2025-10-07'),
	(3, 29.01, '11:00:01', '2025-10-07'),
	(1, 31.01, '11:00:02', '2025-10-07'),
	(2, 30.01, '11:00:02', '2025-10-07');
    
select * from Sensor;

insert into Sensor (numeroSensor, porcentagemGas, horario, dia) values
	(3, 22.46, '11:02:10', '2025-10-07'),
	(1, 59.00, '11:02:11', '2025-10-07'),
	(2, 35.07, '11:02:11', '2025-10-07'),
	(3, 21.09, '11:02:11', '2025-10-07');
    
select 
    numeroSensor as 'n° do sensor',
	case 
		when porcentagemGas > 0 and porcentagemGas <= 25 then 'Baixo'
		when porcentagemGas > 25 and porcentagemGas <= 35 then 'Médio'
		when porcentagemGas > 35 then 'Grave'
    end as 'risco',
    horario,
    dia
from Sensor;

update Sensor set porcentagemGas = 59.41
	where idRegistro = '7';

desc Sensor;


-- TABELA 3 (Logística)

create table Logistica(
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto VARCHAR(25),
quantidade INT,
dataCompra DATE,
estado VARCHAR(15)
constraint chkEstado
	check (estado in('em estoque', 'em atividade', 'em manutenção'))
);

insert into Logistica (nomeProduto, quantidade, dataCompra, estado) values 
	('sensor mq-2', '1', '2025-09-08', 'em estoque'),
	('arduino', '1', '2025-09-08', 'em estoque'),
	('jumpers', '3', '2025-09-08', 'em estoque'),
	('case do sensor', '1', '2025-09-08', 'em estoque');
    
select * from Logistica;

update Logistica set estado = 'em atividade'
	where idProduto = '1';

update Logistica set estado = 'em atividade'
	where idProduto = '2';

update Logistica set estado = 'em atividade'
	where idProduto = '3';	

update Logistica set estado = 'em atividade'
	where idProduto = '4';
    
select concat(nomeProduto, ' ', estado) as 'Produto'
from Logistica;

update Logistica set estado = 'em manutenção'
	where idProduto = '2';

insert into Logistica (nomeProduto, quantidade, dataCompra, estado) values 
	('sensor mq-2', '1', '2025-09-11', 'em estoque'),
	('arduino', '1', '2025-09-11', 'em estoque');
    
select 
	nomeProduto as 'Produto',
    quantidade as 'Quantidade',
    dataCompra as 'Data da compra',
    case
    when estado = 'em estoque' then 'Bora vender!'
    when estado = 'em atividade' then 'Vendido :)'
    when estado = 'em manutenção' then 'Conserte logo >:('
    end as 'Status do Produto'
from Logistica;