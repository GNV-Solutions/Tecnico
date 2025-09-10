create database Projeto_Inovacao;
use Projeto_Inovacao;

create table Usuario(
	idUsuario int primary key auto_increment, /* vai pegar nome, email, cnpj, senha, tipo_usuario*/
    nome varchar(40),
    email varchar(40),
    cnpj varchar(20),
    senha varchar(15),
    tipo_usuario varchar(15)
);

create table Endereco(
	idEndereco int primary key auto_increment, /*vai pegar cep, rua, uf, bairro, cidade*/
    cep varchar(9),
    rua varchar(30),
    uf char(2),
    bairro varchar(20),
    cidade varchar(15)
);

create table Sensor(
	idSensor int primary key auto_increment, /*vai pegar nome do sensor, modelo do sensor(MQ-2), local da instalação,data da instalação e o status do sensor(funcionando ou não)*/
    nome_sensor varchar(20),
    modelo_sensor varchar(15), 
    local_instalacao varchar (30),
    data_instalacao date,
    status_sensor boolean
);

create table Leitura_sensor(
	id_leitura int primary key auto_increment, /*vai pegar a porcentagem que o sensor vai capiturar e a data e hora que foi capiturado a leitura*/
    porcentagem int,
    dt_hora datetime
);

create table Alerta(
	id_alerta int primary key auto_increment, /* vai pegar o nivel do alerta(baixo, medio, alto), data e hora do alerta, status do alerta(se esta ativo ou se ja foi resolvido) e mensagem(informações do vazamento ou de manutenção)*/
    nivel_alerta varchar(15),
    dt_hora datetime, 
    status_alerta boolean,
    mensagem varchar(50)
);

create table Posto (
	id_posto int primary key auto_increment, /* vai informar o nome do posto e o gerente do local*/
    nome_posto varchar(40),
    gerente_posto varchar(40)
);

create table Cilindro(
	id_cilindro int primary key auto_increment, /* vai informar o número do cilindro ou a numeração dele*/
    numero_cilindro int
);

create table Bomba(
	id_bomba int primary key auto_increment, /* vai informar o número da bomba ou do nome*/
    numero_bomba int
);