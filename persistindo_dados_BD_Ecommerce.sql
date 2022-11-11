-- INICIA O DB e_commerce
USE e_commerce;

-- LISTA AS TABELAS
SHOW TABLES;

-- EXCLUIR A PARTE DAQUI PRA BAIXO ANTES DE ENVIAR PARA O GITHUB
-- DESATIVA A VERIFICAÇÃO DA CHAVE ESTRAGEIRA
SET FOREIGN_KEY_CHECKS=0;

-- EXCLUI OS DADOS DAS TABELAS
TRUNCATE clients;
TRUNCATE creditcard;
TRUNCATE orders;
TRUNCATE payments;
TRUNCATE product;
TRUNCATE productorder;
TRUNCATE productseller;
TRUNCATE productstorage;
TRUNCATE productsupplier;
TRUNCATE seller;
TRUNCATE storagelocation;
TRUNCATE supplier;

-- ATIVA A VERIFICAÇÃO DE CHAVE ESTRAGEIRA
SET FOREIGN_KEY_CHECKS=1;
-- /EXCLUIR ATÉ AQUI, INCLUSIVE ESSE COMENTARIO

-- ADICIONA OS CLIENTES: PRIMEIRO NOME, NOME DO MEIO, SOBRENOME, CPF, ENDEREÇO E DATA DE NASCIMENTO
INSERT INTO clients (Fname, Mname, Lname, CPF, Adress, birthDate) VALUES
('Maria', 'Rodrigues', 'Souza', 12345678911, 'rua Olegario Mac 29, Centro - Rio de Janeiro', '2022-11-06'),
('Joao', 'Silva', 'Baiao', 12345678912, 'rua Floriano 30, Jardim - Sao Paulo', '2022-11-06'),
('Jose', 'Barbosa', 'Cruz', 12345678913, 'rua Predisente 31, Lourdes - Belo Horizonte', '2022-11-06'),
('Ana', 'Oliveira', 'Castro', 12345678914, 'rua Flores 29, Centro - Santos', '2022-11-06'),
('Pedro', 'Maia', 'Luna', 12345678915, 'rua Carangola 109, Itu - Viçosa', '2022-11-06');

-- VISUALIZA DETALHES DA TABELA clients
DESC clients;

-- ADICIONA OS PRODUTOS: NOME DO PRODUTO, CLASSIFICAÇÃO INFANTIL, CATEGORIA, AVALIAÇÃO E TAMANHO
-- CATEGORIAS: eletronico, vestimenta, brinquedos, alimentos, moveis)
INSERT INTO product (Pname, classification_kids, category, avaliacao, size) VALUES
('fone de ouvido', false, 'eletronico', '4', null),
('camiseta', false, 'vestimenta', '3', null),
('barbie', true, 'brinquedos', '4', null),
('bola', true, 'brinquedos', '2', null),
('sofa', false, 'moveis', '3', '1x2x3');

-- VISUALIZA DETALHES DA TABELA PRODUTOS
DESC product;

-- ADICIONA OS PEDIDOS: ID DO PEDIDO, STATUS, DESCRIÇÃO, VALOR DO FRETE, TIPO DE PAGAMENTO
-- Status: cancelado, confirmado, em processamento
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
(1, default, 'compra via aplicativo', null, 1),
(2, default, 'compra via aplicativo', 50, 0),
(3, 'confirmado', null, null, 1),
(4, default, 'compra via web site', 150, 0);

-- ADICIONA PRODUTOS NAS LISTAS DE PEDIDOS: ID DO PRODUTO, ID DO PEDIDO, QUANTIDADE, STATUS
-- Status: disponível, sem estoque
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
(5,1,2,'disponivel'),
(5,2,1,'disponivel'),
(3,4,1,'disponivel');
                        
-- ADICIONA ITENS NO Estoque DE ACORDO COM A LOCALIZAÇÃO: ESTADO, QUANTIDADE
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('Sao Paulo', 10),
('Sao Paulo', 100),
('Sao Paulo', 10);
                            
-- ADICIONA A LOCALIZAÇÃO DO ESTOQUE: ID DO PRODUTO, ID DA LOCALIZAÇÃO, ESTADO ABREVIADO
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1,2,'RJ'),
(2,5,'SP');
                            
-- ADICIONA FORNECEDORES: NOME FANTASIA, CNPJ, TELEFONE DE CONTATO
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Almeida e filhos', 123456789123456, '21985474'),
('Eletrônicos Silva', 123456789123457, '21985475'),
('Eletrônicos João', 123456789123459, '21985476');

-- ADICIONA OS PRODUTOS COM OS FORNECEDORES: ID DO FORNECEDOR, ID DO PRODUTO, QUANTIDADE
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1,1,500),
(2,2,600),
(3,3,700);
                            
-- ADICIONA OS VENDEDORES: NOME FANTASIA, NOME ABSTRATO, CNPJ, CPF, ESTADO, TELEFONE DE CONTATO
INSERT INTO seller (SocialName, AbstractName, CNPJ, CPF, location, contact) VALUES
('Tech eletronics', null, 123456789123456, null, 'Rio de Janeiro', 123456789),
('Botique Durgas', null, null, 12345678912, 'Rio de Janeiro', 123456788),
('Kids World', null, 1234566789012, null, 'São Paulo', 123456788);

-- ADICIONA OS VENDEDORES COM OS PRODUTOS: ID DO VENDEDOR, ID DO PRODUTO, QUANTIDADE
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
(1,5,80),
(2,4,10);