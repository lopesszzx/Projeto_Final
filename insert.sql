-- INSERT PARA TB_CLIENTE

INSERT INTO tb_cliente (nome, sobrenome, email, filiacao, dt_nascimento,dt_empresa, CPF, CNPJ, id_endereco)
VALUES
('Joao', 'Silva', 'joao.silva@gmail.com', 'Pessoa Física', '1980-01-01',null, 12345678901, NULL, 1),

('Maria', 'Santos', 'maria.santos@gmail.com', 'Pessoa Física', '1985-02-02',null, 23456789012, NULL, 2),

('Jose', 'Oliveira', 'jose.oliveira@gmail.com', 'Pessoa Física', '1990-03-03',null, 34567890123, NULL, 3),

('Ana', 'Souza', 'ana.souza@gmail.com', 'Pessoa Física', '1995-04-04',null, 45678901234, NULL, 4),

('Carlos', 'Rodrigues', 'carlos.rodrigues@gmail.com', 'Pessoa Física', '2000-05-05',null, 56789012345, NULL, 5),

('Lucas', 'Alves', 'lucas.alves@gmail.com', 'Pessoa Física', '2005-06-06',null, 67890123456, NULL, 6),

('Fernanda', 'Ferreira', 'fernanda.ferreira@gmail.com', 'Pessoa Física', '2010-07-07',null, 78901234567, NULL, 7),

('Pedro Ltda', NULL, 'pedro.ltda@gmail.com', 'Pessoa Jurídica', NULL,'1981-02-17' ,NULL, 12345678901234, 8),

('Maria Ltda', NULL, 'maria.ltda@gmail.com', 'Pessoa Jurídica', NULL,'2015-07-19', NULL, 23456789012345, 9),

('Jose Ltda', NULL, 'jose.ltda@gmail.com', 'Pessoa Jurídica', NULL,'2020-12-12', NULL, 34567890123456, 10),

('Ana Ltda', NULL, 'ana.ltda@gmail.com', 'Pessoa Jurídica',NULL,'2019-09-28',NULL ,45678901234567 ,8),

('Carlos Ltda', NULL, 'carlos.ltda@gmail.com','Pessoa Jurídica',NULL,'2002-10-04',NULL ,56789012345678 ,9),

('Lucas Ltda',NULL, 'lucas.ltda@gmail.com','Pessoa Jurídica',NULL,'2007-08-17',NULL ,67890123456789 ,10),

('Fernanda Ltda',NULL, 'fernanda.ltda@gmail.com','Pessoa Jurídica',NULL,'2008-10-14',NULL ,78901234567890 ,8),

('Joao Ltda', NULL, 'joao.ltda@gmail.com','Pessoa Jurídica',NULL,'1998-12-22',NULL ,89012345678901 ,9);



-- insert para endereço

INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Rua Alegria', 123, 12345 , 'Bloco A, Apt. 101');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Avenida da Paz', 456, 54321, 'Casa Azul');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Rua das Flores', 789, 67890, 'Andar 2, Sala 3');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Rua da Esperança', 1011, 11223, 'Lote 5');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Avenida Principal', 1314, 44556, 'Fundos, numero 1314');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Travessa das Árvores', 1516, 66777, 'Apto. 7B');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Rua da Liberdade', 1718, 88999, 'Casa Amarela, casa 1718');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Avenida do Sol', 1920, 99000, 'Loja 25');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Praça Central', 2122, 11222, 'Casa 67');
INSERT INTO tb_endereco (rua, numero, CEP, complemento) VALUES ('Alameda dos Sonhos', 2324, 33445, 'Torre B, Andar 4');


-- insert para TB_TIPO


INSERT INTO tb_tipo (tipo) VALUES ('celular');
INSERT INTO tb_tipo (tipo) VALUES ('residencial');
INSERT INTO tb_tipo (tipo) VALUES ('empresarial');


-- insert para TB_TELEFONE



INSERT INTO tb_telefone (numero, DDD, id_tipo) VALUES
    ('998874321', 61, 1), 
    ('997654321', 62, 2), 
    ('999876543', 63, 3), 
    ('998123456', 64, 1),
    ('996789012', 65, 2),
    ('992345678', 66, 3),
    ('991234567', 67, 1),
    ('998765432', 68, 2),
    ('993456789', 69, 3),
    ('995678901', 71, 1),
    ('997890123', 72, 2),
    ('999012345', 73, 3),
    ('994567890', 74, 1),
    ('996789012', 75, 2),
    ('992345678', 76, 3),
    ('998874321', 77, 1),
    ('997654321', 78, 2),
    ('999876543', 79, 3),
    ('998123456', 81, 1),
    ('996789012', 82, 2);
    
   
   
   -- INSERT PARA TB_TELEFONE_CLIENTE
   
   
   INSERT INTO tb_telefone_cliente (id_telefone, id_cliente) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 1),
    (17, 2),
    (18, 3),
    (19, 4),
    (20, 5);


    -- INSERT PARA TB_TIPO_CONTA
   
   insert into tb_tipo_conta (descricao) values
   
   ('conta corrente'),
   ('poupanca');
  

    -- INSERT PARA TB_CONTA
  
  INSERT INTO tb_conta (numero_conta, agencia, saldo, status, id_tipo_conta, id_cl) VALUES
    (123456, 7890, 150000, 'ativo', 1, 1),
    (234567, 4567, 250000, 'INATIVO', 2, 2),
    (345678, 1234, 300000, 'ativo', 1, 3),
    (456789, 2345, 50000, 'ativo', 2, 4),
    (567890, 3456, 2000000, 'INATIVO', 1, 5),
    (678901, 5678, 75000, 'ativo', 2, 6),
    (789012, 6789, 1000000, 'INATIVO', 1, 7),
    (890123, 8901, 800000, 'ativo', 2, 8),
    (901234, 9012, 15000, 'INATIVO', 1, 9),
    (102345, 1230, 400000, 'ativo', 2, 10),
    (112345, 2340, 60000, 'INATIVO', 1, 11),
    (122345, 3450, 20000, 'ativo', 2, 12),
    (132345, 4560, 10000, 'INATIVO', 1, 13),
    (142345, 5670, 500000, 'ativo', 2, 14),
    (152345, 6780, 30000, 'ativo', 1, 15);

    -- INSERT PARA TB_TIPO_TRANSACAO
   
   INSERT INTO tb_tipo_transacao (descricao) VALUES
    ('PIX'),
    ('BOLETO'),
    ('TRANSFERENCIA');
    
   
   -- INSERT PARA TB_TRANSAÇÃO
   
   INSERT INTO tb_transacao (valor, ct_destino, id_conta, id_tt) VALUES
    (100.12345678, 2,  1,  1),
    (500.98765432, 3,  2,  2),
    (250.34567890, 4,  3,  3),
    (800.12345678, 5,  4,  1),
    (120.98765432, 6,  5,  2),
    (1000.34567890,7,  6,  3),
    (50.12345678,  8,  7,  1),
    (300.98765432, 9,  8,  2),
    (75.34567890,  10, 9,  3),
    (200.12345678, 11, 10, 1),
    (700.98765432, 12, 11, 2),
    (150.34567890, 13, 12, 3),
    (50.12345678,  14, 13, 1),
    (450.98765432, 15, 14, 2),
    (600.34567890, 1,  15, 3);