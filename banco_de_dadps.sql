-- 1) banco de dados Comex

create table categorias(id bigint AUTO_INCREMENT PRIMARY KEY, nome varchar(100));

create table produto(id bigint AUTO_INCREMENT PRIMARY key, nome varchar(255), 
preco decimal(10,2), 
categoria_id bigint, 
FOREIGN KEY (categoria_id) REFERENCES categorias(id)); 

create table cliente(id bigint AUTO_INCREMENT PRIMARY KEY, nome varchar (255));

create table pedido(id bigint AUTO_INCREMENT PRIMARY KEY, 
data datetime, 
cliente_id bigint, 
FOREIGN KEY (cliente_id) REFERENCES cliente(id));

create table item_pedido(id bigint AUTO_INCREMENT PRIMARY KEY, 
pedido_id bigint, 
produto_id bigint, 
preco_unitario decimal(10,2), 
quantidade integer, 
FOREIGN KEY(pedido_id) REFERENCES pedido(id), 
FOREIGN KEY(produto_id) REFERENCES produto(id));