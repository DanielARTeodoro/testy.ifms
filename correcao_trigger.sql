-- 1
use empresa_x;

ALTER TABLE pessoa ADD classificacao VARCHAR(50);

DELIMITER $$
CREATE TRIGGER gerar_class BEFORE INSERT ON pessoa
FOR EACH ROW 
BEGIN 
	IF NEW.idade < 10 THEN SET NEW.classificacao = 'Crianca';
    ELSEIF NEW.idade>=10 AND NEW.idade < 20 THEN SET NEW.classificacao = 'Adolescente';
    ELSEIF NEW.idade>=20 AND NEW.idade < 60 THEN SET NEW.classificacao = 'Adulto';
    ELSEIF NEW.idade>=60 THEN SET NEW.classificacao = 'Idoso';
    END IF;
END $$
DELIMITER ; 


INSERT INTO pessoa (cpf, nome, idade, renda_familiar, id_endereco, id_area_atuacao)
VALUE ('34234234234', 'Claudia Fernandes', 30, 4000, 1, 2),
('32312312332', 'Eduardo Ferrari', 18, 10000, 2, 1);

SELECT * FROM pessoa;


-- 2
use vendas;

DELIMITER $$
CREATE TRIGGER inserir_valor BEFORE INSERT ON itensvenda
FOR EACH ROW
BEGIN
	SET NEW.preco_total = NEW.quantidade * (SELECT preco FROM produtos WHERE cod_barras = NEW.fkproduto_cod);
END $$
DELIMITER ;


INSERT INTO itensvenda(id, fkproduto_cod, quantidade) VALUES
(1,'42342343243', 2),
(2,'87687687687', 1),
(3,'90190190190', 4),
(4,'42342343243', 1);

SELECT * FROM itensvenda;

TRUNCATE itensvenda;

DROP TRIGGER inserir_valor;

-- 3
DELIMITER $$
CREATE TRIGGER inserir_valor BEFORE INSERT ON itensvenda
FOR EACH ROW
BEGIN
	SET NEW.preco_total = NEW.quantidade * (SELECT preco FROM produtos WHERE cod_barras = NEW.fkproduto_cod);
    IF(NEW.preco_total > 1000) THEN SET NEW.desconto = NEW.preco_total * 0.1;
    ELSE SET NEW.desconto = 0;
    END IF;
END $$
DELIMITER ;


INSERT INTO itensvenda(id, fkproduto_cod, quantidade) VALUES
(1,'42342343243', 2),
(2,'87687687687', 100),
(3,'90190190190', 4),
(4,'42342343243', 1);

SELECT * FROM itensvenda;

TRUNCATE itensvenda;

DROP TRIGGER inserir_valor;

-- 4
DELIMITER $$
CREATE TRIGGER inserir_valor BEFORE INSERT ON itensvenda
FOR EACH ROW
BEGIN
    IF	((SELECT estoque FROM produtos WHERE cod_barras = NEW.fkproduto_cod)< NEW.quantidade) THEN
		SIGNAL SQLSTATE '45000' set message_text = 'Não há estoque';
	ELSE 
		SET NEW.preco_total = NEW.quantidade * (SELECT preco FROM produtos WHERE cod_barras = NEW.fkproduto_cod);
		IF(NEW.preco_total > 1000) THEN SET NEW.desconto = NEW.preco_total * 0.1;
		ELSE SET NEW.desconto = 0;
		END IF;
    END IF;
END $$
DELIMITER ;


INSERT INTO itensvenda(id, fkproduto_cod, quantidade) VALUES
(1,'42342343243', 2),
(2,'87687687687', 2),
(3,'90190190190', 4),
(4,'42342343243', 1); -- Ao rodar esse código deve aparecer o erro: 'ERROR CODE: 1644. NÃO HÁ ESTOQUE'.

SELECT * FROM itensvenda;

