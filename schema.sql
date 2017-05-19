BEGIN TRANSACTION;

drop table itens_carrinho;
drop table produto;
drop table cliente;
drop table endereco;
drop table cartao;
drop table carrinho_compra;
drop table compra;
drop table categoria;


CREATE TABLE categoria(
   idCategoria 	INT IDENTITY(1,1) NOT NULL,
   nome 	varchar(100)	NOT NULL
   CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY (idCategoria)
);

CREATE TABLE produto (
	idProduto	INT IDENTITY(1,1) NOT NULL,
	codigo	varchar(100) NOT NULL,
	nome	varchar(100) NOT NULL,
	imagem	varchar(1000) NOT NULL,
	precoCusto	float NOT NULL,
	precoVenda	float NOT NULL,
	idCategoria	integer,
	origem varchar(100),
	dimensoes	varchar(100),
	peso	varchar(100),
	garantia	varchar(100),
	descricao	varchar(1000)
	CONSTRAINT [PK_PRODUTO] PRIMARY KEY (idProduto),
	FOREIGN KEY(idCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE endereco(
   idEndereco 	INT IDENTITY(1,1) NOT NULL,
   logradouro 	varchar(150)	NOT NULL,
   cep		varchar(9)	NOT NULL,
   numero	integer		NOT NULL,
   complemento  varchar(100),
   bairro       varchar(100)	NOT NULL,
   cidade       varchar(50)	NOT NULL,
   estado       varchar(2)	NOT NULL
   CONSTRAINT [PK_ENDERECO] PRIMARY KEY (idEndereco)
);

CREATE TABLE cartao(
   idCartao 		INT IDENTITY(1,1) NOT NULL,
   numero 			varchar(100)		NOT NULL,
   nomeImpresso		varchar(100)	NOT NULL,
   validade		date		NOT NULL,
   codigoSeguranca  	integer		NOT NULL
   CONSTRAINT [PK_CARTAO] PRIMARY KEY (idCartao)
);

CREATE TABLE cliente (
	idCliente	INT IDENTITY(1,1) NOT NULL,
	email	varchar(100) NOT NULL,
	senha	varchar(50) NOT NULL,
	nome	varchar(150) NOT NULL,
	sexo	char(1) NOT NULL,
	cpf		varchar(11) NOT NULL,
	dataNascimento	date NOT NULL,
	telefone	varchar(11) NOT NULL,
	idEndereco	INTEGER,
	idCartao	INTEGER,
	CONSTRAINT [PK_CLIENTE] PRIMARY KEY (idCliente),
	FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco),
	FOREIGN KEY(idCartao) REFERENCES cartao(idCartao)
);

CREATE TABLE carrinho_compra (
	idCompra	INT IDENTITY(1,1) NOT NULL,
	dataCompra	date NOT NULL,
	parcelas	integer NOT NULL,
	idCartao	integer,
	tipoPagamento	varchar(10),
	CONSTRAINT [PK_COMPRA] PRIMARY KEY (idCompra),
	FOREIGN KEY(idCartao) REFERENCES cartao(idCartao)
);

CREATE TABLE itens_carrinho (
	idItem		INT IDENTITY(1,1) NOT NULL,
	idCliente	integer,
	idProduto	integer,
	idCompra	INTEGER,
	finalizado	INTEGER NOT NULL DEFAULT 0,
	CONSTRAINT [PK_CARRINHO] PRIMARY KEY (idItem),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
	FOREIGN KEY(idCompra) REFERENCES carrinho_compra(idCompra)
);

select * from produto;
select * from cliente;
select * from cartao;
select * from categoria;
select * from carrinho_compra;
select * from itens_carrinho;
select * from endereco;

delete from produto;

SELECT count(*) as quantidade
(SELECT P.nome, P.precoVenda 
FROM ITENS_CARRINHO IC INNER JOIN PRODUTO P ON IC.IDPRODUTO = P.IDPRODUTO 
WHERE IC.FINALIZADO = 0 and idCliente = 1) AS 'QTD'
FROM ITENS_CARRINHO;


SELECT 
	P.NOME, P.PRECOVENDA,
(SELECT  
	COUNT(*) AS CONT FROM ITENS_CARRINHO IC 
WHERE 
	P.IDPRODUTO = IC.IDPRODUTO and IC.FINALIZADO = 0 and idCliente = 1) AS 'QUANTIDADE' 
FROM 
	PRODUTO P;




SELECT 
	P.NOME, P.PRECOVENDA 
FROM
	ITENS_CARRINHO IC
INNER JOIN 
	produto P 
ON 
	P.idProduto = IC.idProduto;
	

	
	
	

	

INSERT INTO produto VALUES ('B002','Bola de futebol oval Wilson','91a4a02b-5b19-4762-96f8-7a8e3bc258bb.jpg',60.0,100.0,1,'Importado','29x44x14 (LxAxP) cm','150g','12 Meses','Bola Oval');
INSERT INTO produto VALUES ('B003','Bola de basket Penalty Nike','a600013b-e4ab-40dc-805d-80dcb4dc8aac.jpg',70.0,110.0,4,'Nacional','29x44x14 (LxAxP) cm','300g','12 Meses','Bola Redonda');
INSERT INTO produto VALUES ('R001','Relogio adidas','517d0034-df87-4396-9c32-16ecb5b750ff.jpg',100.0,170.0,4,'Importado','29x44x14 (LxAxP) cm','60g','12 Meses','Marca hora');
INSERT INTO produto VALUES ('M001','Mochila Nike','62c65374-3211-4062-9a9f-752c3fc1e2db.jpg',120.0,180.0,1,'Importado','29x44x14 (LxAxP) cm','700g','12 Meses','O visual moderno da Mochila Nike Brasília é a opção perfeita para transportar seus pertences no dia a dia. Ela oferece um ótimo espaço interno, bolsos laterais e com alça ajustável.');
INSERT INTO produto VALUES ('B006','Bolas de têniss','00bdce78-4ea2-4dc0-9f23-4b28cf65019d.jpg',20.0,35.0,4,'Nacional','29x44x14 (LxAxP) cm','50g','12 Meses','Bola Redonda');
INSERT INTO produto VALUES ('R001','Raquete De Tennis','b964a1b8-5687-4e2c-be1e-6af539fa6694.jpg',60.0,1200.0,4,'Nacional','','','12 meses','Raquete De Tennis Wilson Us Open 25 Infantil');
INSERT INTO produto VALUES ('P001','Prancha de Snowboard','79abf544-a604-430e-bf17-c1e0ba8e8bd5.jpg',160.0,320.0,3,'Importado','','1,5kg','12 meses','Prancha de Snowboard para o Jão das Neves');
INSERT INTO produto VALUES ('S005','SACO DE PANCADA','6b20a50c-90d7-482a-b163-3a6d27c8a457.jpg',60.0,80.0,4,'Nacional','60x25x25(LxAxC)','','Contra Defeito de Fabricação','O Saco de Pancada Punch 60cm foi confeccionado para que você tenha os melhores treinos de artes marciais. Feito de lona sintética de alta resistência, tem enchimento para melhor absorção de impactos. Tudo isso com a qualidade Punch que você já conhece. Vale a pena conferir!');

INSERT INTO cliente VALUES ('ninoreggae@gmail.com','77369E37B2AA1404F416275183AB055F','Cesar Quadros','M','37765289829','19-07-1988','1156214658',9,NULL,6);
INSERT INTO cliente VALUES ('ronaldo@fen.com','202CB962AC59075B964B07152D234B70','Ronaldo fenomeno','M','12345678909','20-02-1988','1155651327',1,1);

INSERT INTO categoria VALUES ('Futebol');
INSERT INTO categoria VALUES ('Natação');
INSERT INTO categoria VALUES ('Snowboard');
INSERT INTO categoria VALUES ('Tênis');
INSERT INTO categoria VALUES ('Vôlei');

INSERT INTO cartao VALUES (8888444466662222,'Cesar','10-10-2020',666);

INSERT INTO carrinho_compra VALUES ('17-05-2017 17:31:10','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 17:32:32','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:33:52','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:44:11','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:54:31','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 22:01:29','6',3,'boleto');

