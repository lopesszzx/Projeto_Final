CREATE DATABASE IF NOT EXISTS db_startup COLLATE utf8mb4_general_ci CHARSET utf8mb4;

use db_startup;



create table if not exists tb_endereco (

id INT  primary key auto_increment,
rua VARCHAR(255) not null,
numero INT not null,
CEP INT not null,
complemento VARCHAR(255) not null


);



create table if not exists tb_tipo (

id INT primary key auto_increment,
tipo VARCHAR (45) not NULL

);



create table if not exists tb_telefone (

id INT primary key auto_increment,
numero VARCHAR(9) not null,
DDD INT (3) not null,

id_tipo INT,

constraint fk_id_tipo foreign key(id_tipo) references tb_tipo(id)

);


create table if not exists tb_cliente(

id INT primary key auto_increment,
nome VARCHAR(255) not null,
sobrenome VARCHAR(255) ,
email VARCHAR(255) not null,
filiacao VARCHAR(255) not null,
dt_nascimento DATE ,
dt_empresa DATE,
CPF INT(20),
CNPJ INT(20),


id_endereco INT,

constraint fk_id_endereco foreign key(id_endereco) references tb_endereco(id)

);

create table if not exists tb_telefone_cliente (

id_telefone INT,
id_cliente INT,
primary key(id_telefone,id_cliente),

constraint fk_id_telefone foreign key(id_telefone) references tb_telefone(id),
constraint fk_id_cliente foreign key(id_cliente) references tb_cliente(id)



);


create table if not exists tb_tipo_conta (

id INT primary key auto_increment,
descricao VARCHAR(45) not null

);

create table if not exists tb_conta(

id INT primary key auto_increment,
numero_conta INT not null,
agencia INT not null,
saldo DECIMAL(10,2) not null,
status VARCHAR(40) not null,


id_tipo_conta INT,
id_cl INT,

constraint fk_id_tipo_conta foreign key(id_tipo_conta) references tb_tipo_conta(id),
constraint fk_id_cl foreign key(id_cl) references tb_cliente(id)


);

create table if not exists tb_tipo_transacao (

id INT primary key auto_increment,
descricao VARCHAR(45) not null


);

create table if not exists tb_transacao (

id INT primary key auto_increment,
valor DECIMAL(10,8) not null,
ct_destino INT not null,

id_conta INT,
id_tt INT,


constraint fk_id_conta foreign key (id_conta) references tb_conta (id),
constraint fk_id_tt foreign key (id_tt) references tb_tipo_transferencia (id)


);

ALTER TABLE tb_transacao
DROP CONSTRAINT fk_id_tt;

ALTER TABLE tb_transacao
ADD CONSTRAINT fk_id_tt FOREIGN KEY (id_tt) REFERENCES tb_tipo_transacao (id);





