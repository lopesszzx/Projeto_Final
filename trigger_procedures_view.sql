use db_startup;

--- CRIACAO DE TRIGGERS PARA INSERÇÃO DE CLIENTES


DELIMITER //

create trigger tr_adicionar_clientes 
before insert on tb_cliente
for each row 

begin 
	
	set new.nome = UPPER(new.nome) ;
	set new.sobrenome = UPPER(new.sobrenome) ;
	set new.email = UPPER(new.email) ;


	
	if new.nome  regexp'[[:space:]]{2,}|[^A-Za-z ]' then 
	signal sqlstate '45000'
	set MESSAGE_TEXT = 'O nome não está de acordo com o padrão, verifique se a espaços adicionais,caracters especiais ou numeros
EX: JOAO PAULO' ;

end if ;

   if new.sobrenome  regexp'[[:space:]]{2,}|[^A-Za-z ]' then 
	signal sqlstate '45000'
	set MESSAGE_TEXT = 'O nome não está de acordo com o padrão, verifique se a espaços adicionais' ;

end if ;

   if new.email  not regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$' then 
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'Email invalido, por favor verifique novamente';
  
end if ;

   if new.CPF not regexp '^[0-9]' then
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'CPF invalido, digite apenas numeros';
  
  end if ;
 
   if new.CNPJ not regexp '^[0-9]' then
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'CNPJ invalido, digite apenas numeros';
 end if ;

   if new.dt_nascimento >= CURDATE() then
signal sqlstate '45000'
set MESSAGE_TEXT = 'DATA DE NASCIMENTO INVALIDA';

end if ;  

if new.dt_empresa >= CURDATE() then
signal sqlstate '45000'
set MESSAGE_TEXT = 'DATA DE CRIACAO INVALIDA';

end if ; 

end //

DELIMITER ;



-- DELETE  DE CLIENTES


DELIMITER //

CREATE TRIGGER tr_delete_cliente
BEFORE DELETE ON tb_cliente
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_cliente WHERE id = OLD.id;
   
end //

DELIMITER ;


-- UPDATE DE CLIENTES

DELIMITER //

create procedure sp_atualizar_cliente
(p_email VARCHAR(255),p_nome VARCHAR(255), p_sobrenome VARCHAR(255),p_filiacao VARCHAR(255),p_dt_nascimento DATE, p_dt_empresa DATE, p_CNPJ BIGINT, p_CPF BIGINT,  p_id INT)

begin 

	UPDATE tb_cliente
	set email = p_email,
	nome = p_nome,
	sobrenome = p_sobrenome,
    filiacao = p_filiacao,
    dt_nascimento = p_dt_nascimneto,
    dt_empresa = p_dt_empresa,
    CNPJ = p_CNPJ,
    CPF = p_CPF
	
	where id = p_id ; 
	 
 
end //

DELIMITER ;

--- CRIACAO DE TRIGGERS PARA INSERÇÃO DO ENDEREÇO


DELIMITER //

CREATE TRIGGER tr_adicionar_endereco
BEFORE INSERT ON tb_endereco
FOR EACH ROW

BEGIN
	set new.complemento = upper(new.complemento) ;
    set new.rua = upper(new.rua) ;  
   
   

    IF NEW.rua regexp '[[:space:]]{2,}|[^A-a-z ] | [0-9]' THEN
	signal SQLSTATE '45000'
	SET message_text = 'Verifique o numero da rua 
                        EX: Rua 08 ' ;
                       
   end if ;
  
   if new.numero not regexp '^[0-9]' then
   signal sqlstate '45000'
   set message_text = 'Digite apenas numeros';
 
 end if ; 


   if new.CEP not regexp '^[0-9]' then
   signal sqlstate '45000'
   set message_text = 'Digite apenas numeros, não pode conter pontos ' ;
  
  end if;	
 
 if new.complemento not regexp '[[:space:]]{2,}|[^A-a-z0-9.,;-]' then
 signal sqlstate '45000'
 set message_text = 'Algo deu errado, verifique novamente' ;
	
end if ;

END //

DELIMITER ;


-- DELETE  DO ENDEREÇO


DELIMITER //

CREATE TRIGGER tr_delete_endereco
BEFORE DELETE ON tb_endereco
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_endereco  WHERE id = OLD.id;
   
end //

DELIMITER ;


-- UPDATE DE ENDEREÇO



DELIMITER //

create procedure sp_atualizar_endereco
(p_rua VARCHAR(255),p_numero INT(11),p_CEP INT(11), p_complemento VARCHAR(255), p_id INT)

begin 

	UPDATE tb_endereco 
	set rua = p_rua,
	numero = p_numero,
	CEP = p_CEP,
    complemento = p_complemento
	
	where id = p_id ; 
	 
 
end //

DELIMITER ;


--- CRIACAO DE TRIGGERS PARA INSERÇÃO DO TIPO TELEFONE

DELIMITER //

create trigger tr_adicionar_tipo_numero
before insert on tb_tipo 
for each  row 

begin 
	
	set new.tipo = UPPER(new.tipo) ;


    if new.tipo regexp '[[:space:]]|[^A-Za-z ] ' then 
	signal sqlstate '45000'
	set message_text = 'DIGITE APENAS OS TIPOS:
                        TIPO 01: CELULAR,
                        TIPO 02: RESIDENCIAL' ;

end if ;

end // 


DELIMITER ;


-- DELETE  DO TIPO TELEFONE


DELIMITER //

CREATE TRIGGER tr_delete_tipo_telefone
BEFORE DELETE ON tb_tipo
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_tipo  WHERE id = OLD.id;
   
end //

DELIMITER ;


-- UPDATE DE TIPO TELEFONE



DELIMITER //

create procedure sp_atualizar_tipo_telefone
(p_tipo VARCHAR(255), p_id INT)

begin 

	UPDATE tb_tipo 
	set tipo= p_tipo
	
	where id = p_id ; 
	 
 
end //

DELIMITER ;

--- CRIACAO DE TRIGGER PARA INSERÇÃO DO TELEFONE



DELIMITER //

create trigger tr_adicionar_numero
before insert on tb_telefone 
for each  row 

begin 
    
if NEW.numero regexp '[^0-9]' then
signal sqlstate '45000'
set message_text = 'DIGITE APENAS NUMEROS';
	
end if ;

if NEW.DDD regexp '[^0-9]' then
signal sqlstate '45000'
set message_text ='INSIRA APENAS O DDD
EX: 061' ;

end if ;

end // 


DELIMITER ;


-- DELETE DO TELEFONE


DELIMITER //

CREATE TRIGGER tr_delete_numero
BEFORE DELETE ON tb_telefone
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_telefone WHERE id = OLD.id;
   
end //

DELIMITER ;


-- UPDATE DE TELEFONE



DELIMITER //

create procedure sp_atualizar_telefone
(p_numero VARCHAR(255),p_DDD INT(3),p_id_tipo INT, p_id INT)

begin 

	UPDATE tb_telefone 
	set numero = p_numero,
	DDD = p_DDD,
	id_tipo = p_id_tipo
    
	
	where id = p_id ; 
	 
 
end //

DELIMITER ;


-- CRICAO DE TRIGGER PARA INSERÇÃO DO TIPO CONTA

DELIMITER //

create trigger tr_adicionar_tipo_conta
before insert on tb_tipo_conta 
for each  row 

begin 
    
	set new.descricao = UPPER(new.descricao);

if NEW.descricao regexp '[[:space:]]{2,}|[^A-Za-z ] ' then
signal sqlstate '45000'
set message_text = 'DIGITE APENAS OS TIPOS DE CONTAS:
EX: CONTA CORRENTE,
EX: POUPANÇA' ;
	
end if ;

end // 

DELIMITER ;


-- DELETE DO TIPO CONTA


DELIMITER //

CREATE TRIGGER tr_delete_tipo_conta
BEFORE DELETE ON tb_tipo_conta
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_tipo_conta WHERE id = OLD.id;
   
end //

DELIMITER ;


-- UPDATE DE TIPO CONTA



DELIMITER //

create procedure sp_atualizar_tipo_conta
(p_descricao VARCHAR(255),p_id INT)

begin 

	UPDATE tb_tipo_conta 
	set descricao = p_descricao
    
	
	where id = p_id ; 
	 
 
end //

DELIMITER ;

-- CRIAÇÃO DE TRIGGER PARA INSERÇÃO DA CONTA


DELIMITER //


create trigger tr_adicionar_conta
before insert on tb_conta
for each row 

begin 
	
	set new.status = UPPER(new.status) ;
	

	
	if new.numero_conta  not regexp '^[0-9]' then 
	signal sqlstate '45000'
	set MESSAGE_TEXT = 'DIGITE APENAS NUMEROS NA CONTA' ;

end if ;

   if new.agencia  not regexp '^[0-9]' then 
	signal sqlstate '45000'
	set MESSAGE_TEXT = 'DIGITE APENAS NUMEROS NA AGENCIA' ;

end if ;

   if new.saldo  not regexp '^[0-9]' then 
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'DIGITE APENAS NUMEROS NO SALDO';
  
end if ;

   if new.status regexp '[[:space:]]|[^A-Za-z ] ' then
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'STATUS APENAS:
   EX: ATIVO,
   EX: INATIVO';
  
  end if ;
 
end //

DELIMITER ;


-- DELETE DA CONTA


DELIMITER //

CREATE TRIGGER tr_delete_conta
BEFORE DELETE ON tb_conta
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_conta WHERE id = OLD.id;
   
end //

DELIMITER ;

-- CRIAÇÃO DE TRIGGER PARA INSERÇÃO DO TIPO TRANSAÇÃO

DELIMITER //


	create trigger tr_adicionar_tipo_transacao
	before insert on tb_tipo_transacao
	for each row 
	
	begin 
		
		set new.descricao = UPPER(new.descricao);
		
		
		if new.descricao regexp '[[:space:]]|[^A-Za-z ] ' then
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'TIPO TRANSIÇÃO APENAS:
   EX: PIX,
   EX: BOLTEO,
   EX: TRANSFERENCIA';
  
  end if ;
 
 
	end //
	
DELIMITER ;


-- DELETE DO TIPO TRANSAÇÃO


DELIMITER //

CREATE TRIGGER tr_delete_tipo_transacao
BEFORE DELETE ON tb_tipo_transacao
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_tipo_transacao  WHERE id = OLD.id;
   
end //

DELIMITER ;

 
-- CRIAÇÃO DE TRIGGER PARA INSERÇÃO DA TRANSFERENCIA


DELIMITER //


	create trigger tr_adicionar_transacao
	before insert on tb_transacao
	for each row 
	
	begin 
		
		
		
		
		if new.valor not regexp '^[0-9]' then
   signal sqlstate '45000'
   set MESSAGE_TEXT = 'DIGITE APENAS NUMEROS';
  
  end if ;
 
      if new.ct_destino not regexp '^[0-9]' then
      signal sqlstate '45000'
      set MESSAGE_TEXT = 'DIGITE APENAS NUMEROS';
     
     
  end if ;
 
 
	end //
	
DELIMITER ;

-- DELETE DA TRANSFERENCIA


DELIMITER //

CREATE TRIGGER tr_delete_transacao
BEFORE DELETE ON tb_transacao
FOR EACH ROW
BEGIN
   
    DELETE FROM tb_transacao  WHERE id = OLD.id;
   
end //

DELIMITER ;


-- CRIAÇÃO DA PROCEDURE PARA ATUALIZAÇAÕ DE SALDO


DELIMITER //

CREATE PROCEDURE AtualizarSaldoCliente(IN conta_id INT, IN transacao_valor DECIMAL(10,8))
BEGIN
    DECLARE cliente_id INT;
    DECLARE cliente_saldo DECIMAL(10,2);
    
    SELECT id_cl, saldo INTO cliente_id, cliente_saldo FROM tb_conta WHERE id = conta_id;
    
    IF cliente_id IS NOT NULL THEN
        UPDATE tb_conta SET saldo = cliente_saldo - transacao_valor WHERE id = conta_id;
    END IF;
END //

DELIMITER ;

-- CRIAÇÃO DE VIEW PARA VISUALIZAR DADOS DO CLIENTE
   
  
CREATE VIEW vw_cliente_info AS
select

c.nome as NOME,
c.sobrenome as SOBRENOME,
c.email as EMAIL,
c.dt_nascimento as DATA_NASCIMENTO,
c.dt_empresa as CRIAÇÃO_EMPRESA,
c.filiacao as FILIAÇÃO,
e.rua as RUA,
e.CEP as CEP,
t.DDD as DDD,
t.numero as numero,
co.numero_conta as NUMERO_CONTA,
co.agencia as AGENCIA,
co.saldo as SALDO,
ttc.descricao as TIPO_CONTA

from 

tb_cliente as c

left join
tb_endereco as e  
on e.id = c.id_endereco 
left join 
tb_telefone_cliente as tc
on c.id = tc.id_cliente
left join
tb_telefone as t ON tc.id_telefone = t.id 
left join
tb_conta  as co ON c.id = co.id_cl
left join
tb_tipo_conta  as ttc ON co.id_tipo_conta = ttc.id;



-- CRIAÇÃO DE VIEW PARA VISUALIZAR TRANSAÇÕES ENTRE CLIENTES

CREATE VIEW vw_cliente_transacoes AS
SELECT c.nome AS Nome, c.CPF AS CPF,c.CNPJ as CNPJ, t.valor AS Valor, tt.descricao AS TipoTransacao
FROM tb_cliente c
INNER JOIN tb_conta ct ON c.id = ct.id_cl
INNER JOIN tb_transacao t ON ct.id = t.id_conta
INNER JOIN tb_tipo_transacao tt ON t.id_tt = tt.id;



   
