-- CONSULTA OS REGISTROS DA TABELA CLIENTES ORDENANDO O NOME PARA ORDEM CRESCENTE
SELECT * FROM clients ORDER BY Fname;

-- CONSULTA OS REGISTROS DA TABELA PRODUTOS
SELECT * FROM product;

-- CONSULTA OS REGISTROS DA TABELA PEDIDOS
SELECT * FROM orders;

-- CONSULTA OS FORNECEDORES                    
SELECT * FROM supplier;

-- CONSULTA OS VENDEDORES                    
SELECT * FROM seller;

-- CONSULTA OS VENDEDORES RELACIONADOS COM OS PRODUTOS
SELECT * FROM productSeller;

-- RECUPERA OS CLIENTES QUE FIZERAM OS PEDIDOS
SELECT count(*) FROM clients c, orders o WHERE c.idClient = idOrderClient;
  
-- RECUPERAR QUANTOS PEDIDOS FORAM REALIZADOS PELOS CLIENTES
SELECT c.idClient, Fname, count(*) AS Number_of_orders FROM clients c
INNER JOIN orders o ON c.idClient = o.idOrderClient
INNER JOIN productOrder p ON p.idPOorder = o.idOrder
GROUP BY idClient;

-- VERIFICA SE ALGUM VENDEDOR TAMBÉM É FORNECEDOR
SELECT s.socialName, s.abstractName, s.cnpj, s.cpf, f.socialName, f.cnpj FROM seller s, supplier f
WHERE s.cnpj = f.cnpj;

-- RECUPERA OS PRODUTOS QUE TEM MENOS DE 50 UNIDADES NO ESTOQUE PARA FAZER REPOSIÇAO
SELECT Pname 
FROM product
INNER JOIN productstorage
ON idProduct=idProdStorage
HAVING quantity < 50
ORDER BY quantity;
	

