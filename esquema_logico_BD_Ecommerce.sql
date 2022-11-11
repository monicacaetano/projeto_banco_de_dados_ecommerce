-- criação do banco de dados para o cenário de E-commerce
-- drop database e_commerce;
 create database e_commerce;
 use e_commerce;
 
 -- criar tabela cliente  
 create table clients(
	idClient int auto_increment primary key,
    Fname varchar (45) not null,
    Mname varchar(45),
    Lname varchar(45),
    cpf char(11),
    cnpj char(15),
    adress varchar(45),
    birthDate date not null,
    constraint unique_cpf_clients unique (cpf),
	constraint unique_cnpj_clients unique (cnpj)
);

 alter table clients auto_increment=1;
 
 -- desc clients;
 
 -- criar tabela produto
 -- size = dimensão do produto
 create table product(
	idProduct int auto_increment primary key,
	Pname varchar(45) not null,
	classification_kids bool default false,
	category enum('eletronico', 'vestimenta', 'brinquedos', 'alimentos', 'moveis') not null,
	avaliacao float default 0,
	size varchar(10)
);

alter table clients auto_increment=1;
-- desc product;

-- criar tabela pedido
 create table orders(
 idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('cancelado', 'confirmado', 'em processamento') default 'em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false, 
    constraint fk_orders_client foreign key (idOrderClient) references clients (idClient)
		on update cascade
  );

alter table clients auto_increment=1;
-- desc orders;	

-- criar tabela pagamento
create table payments(
idPayment int auto_increment primary key,
idPOrder int,
idPClient int,
typePayment enum('boleto', 'pix', 'cartao'), 
limitAvailable float,
constraint fk_payments_order foreign key (idPOrder) references orders (idOrder),
constraint fk_payments_client foreign key (idPClient) references clients (idClient)
);

alter table clients auto_increment=1;

-- criar tabela cartao de credito
create table creditCard(
 idCcard int auto_increment primary key,
	idCcardPayment int,
	CcardNumber char(16),
    expiration char(4),
    verifCode char(3),
    constraint fk_creditCard_payments foreign key (idCcardPayment) references payments(idPayment)
  );

alter table clients auto_increment=1;

 -- criar tabela estoque
 create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantity int default 0
 );
 
 alter table clients auto_increment=1;
 
 -- criar tabela fornecedor
 CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(45) NOT NULL,
    cnpj CHAR(15) NOT NULL,
    contact VARCHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (cnpj)
);

alter table clients auto_increment=1;    

-- desc supplier;
    
 -- criar tabela vendedor
 create table seller(
 idSeller int auto_increment primary key,
	socialName varchar(45) not null,
    abstractName varchar(45),
    cnpj char(15),
    cpf char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
 );

alter table clients auto_increment=1;
	
create table productSeller(
idPseller int, 
idPproduct int,
prodQuantity int default 1,
primary key (idPseller, idPproduct), 
constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

desc productSeller;

create table productOrder(
idPOproduct int, 
idPOorder int,
poQuantity int default 1,
poStatus enum('disponivel', 'sem_estoque') default 'disponivel',
primary key(idPOproduct, idPOorder), 
constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
idLproduct int, 
idLstorage int,
location varchar(45) not null,
primary key (idLproduct, idLstorage), 
constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
idPsSupplier int, 
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct), 
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key (idPsSupplier) references product(idProduct)
);

desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';