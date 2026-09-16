-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes (
Id_Cliente int primary key auto_increment,
Nome vachar(250) not null,
Telefone vachar(20) not null,
CPF vachar(14) not null,
Email vachar(100) not null,
data_cadastro datetime not null,
PRIMARY KEY(Id_Cliente)
)

CREATE TABLE Prog_Fidelidade (
data_ultima_atualizacao datetime  not null,
saldo_pontos int not null,
Expiracao_Pontos date,
Checagem_Pontos date,
Id_Prog_Fidelidade int primary key auto_increment,
PRIMARY KEY(Id_Prog_Fidelidade)
)

CREATE TABLE Pedidos (
Data_hora datetime not null,
status vachar(200) not null,
Id_Pedido ont primary key auto_increment,
Valor_total decimal not null,
tipo_pedido vachar(100) not null,
status_Pagamento vachar(30) not null,
PRIMARY KEY(Id_Pedido)
)

CREATE TABLE Pagamento (
data_hora datetime not null,
forma_pagamento decimal not null,
Id_Pagamento int primary key auto_incremente,
data_hora_pagamento datetime not null,
valor_pago int nott null,
PRIMARY KEY(Id_Pagamento)
)

CREATE TABLE Delivery (
taxa_entrega  decimal(5,2) not null,
Id_Delivery int primary key auto_increment PRIMARY KEY,
data_hora_saida datetime not null,
status_entrega vachar(100),
endereco vachar(55) not null
PRIMARY KEY(Id_Delivery)
)

CREATE TABLE Funcionarios (
Id_funcionarios int primary key auto_incrment PRIMARY KEY,
Nome vachar(60) not null,
Data_admissao  datetime not null,
Salario decimal not null,
Cargo vachar(150) not null,
CPF vachar(14) not null
PRIMARY KEY(Id_Funcionarios)
)

CREATE TABLE Estoque (
Quantidade int not null,
nome_isumo vachar(30) not null,
Id_Estoque int primary key auto_increment PRIMARY KEY,
quantidade_minima int not null,
unidade_medida int not null
PRIMARY KEY(Id_Estoque)
)

CREATE TABLE Produtos (
Nome vachar(60) not null,
Preco_unitario decimal(10,2) not null,
descricao vachar(160) not null,
categoria vachar(100) not null,
Id_Produtos int primary key auto_invrement PRIMARY KEY,
Peso vachar(90) not null
PRIMARY KEY(Id_Produtos)
)

CREATE TABLE realiza (
Id_Pedido ont primary key auto_increment,
Id_Cliente int primary key auto_increment,
FOREIGN KEY(Id_Pedido) REFERENCES Pedido(Id_Pedido),
FOREIGN KEY(Id_Cliente) REFERENCES Clientes(Id_Cliente)
)

CREATE TABLE atende (
Id_funcionarios int ,
Id_Pedido int,
FOREIGN KEY(Id_funcionarios) REFERENCES Funcionarios(Id_funcionarios),
FOREIGN KEY(Id_Pedido) REFERENCES Pedido(Id_Pedido)
)

CREATE TABLE cont�m (
Id_Produtos int,
Id_Pedido int ,
FOREIGN KEY(Id_Produtos) REFERENCES Produtos (Id_Produtos),
FOREIGN KEY(Id_Pedido) REFERENCES Pedido(Id_Pedido)
)

CREATE TABLE entraga (
Id_Delivery int,
Id_funcionarios int,
FOREIGN KEY(Id_Delivery) REFERENCES Delivery (Id_Delivery),
FOREIGN KEY(Id_funcionarios) REFERENCES Funcionarios (Id_funcionarios)
)

CREATE TABLE consome (
Id_Estoque int ,
Id_Produtos int ,
FOREIGN KEY(Id_Estoque) REFERENCES Estoque (Id_Estoque),
FOREIGN KEY(Id_Produtos) REFERENCES Produtos (Id_Produtos)
)
