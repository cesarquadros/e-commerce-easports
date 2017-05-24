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
INSERT INTO categoria VALUES ('Surf');
INSERT INTO categoria VALUES ('Tênis');
INSERT INTO categoria VALUES ('Vôlei');
INSERT INTO categoria VALUES ('Skate');
INSERT INTO categoria VALUES ('Basquete');
INSERT INTO categoria VALUES ('Ciclismo');
INSERT INTO categoria VALUES ('Rugby');
INSERT INTO categoria VALUES ('Running');

INSERT INTO cartao VALUES (8888444466662222,'Cesar','10-10-2020',666);

INSERT INTO carrinho_compra VALUES ('17-05-2017 17:31:10','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 17:32:32','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:33:52','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:44:11','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 21:54:31','6',3,'cartao');
INSERT INTO carrinho_compra VALUES ('17-05-2017 22:01:29','6',3,'boleto');

SET IDENTITY_INSERT [dbo].[categoria] ON
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (17, N'Futebol')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (18, N'Natacao')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (19, N'Surf')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (20, N'Tenis')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (21, N'Volei')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (22, N'Skate')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (23, N'Basquete')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (24, N'Ciclismo')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (25, N'Rugby')
INSERT [dbo].[categoria] ([idCategoria], [nome]) VALUES (26, N'Running')


SET IDENTITY_INSERT [dbo].[produto] ON
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (2, N'B003', N'Bola de basket Penalty Nike', N'a600013b-e4ab-40dc-805d-80dcb4dc8aac.jpg', 70, 110, 23, N'Nacional', N'29x44x14 (LxAxP) cm', N'300g', N'12 Meses', N'Bola Redonda')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (3, N'R001', N'Relogio adidas', N'517d0034-df87-4396-9c32-16ecb5b750ff.jpg', 100, 170, 26, N'Importado', N'29x44x14 (LxAxP) cm', N'60g', N'12 Meses', N'Marca hora')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (4, N'M001', N'Mochila Nike', N'62c65374-3211-4062-9a9f-752c3fc1e2db.jpg', 120, 180, 26, N'Importado', N'29x44x14 (LxAxP) cm', N'700g', N'12 Meses', N'O visual moderno da Mochila Nike Brasília é a opção perfeita para transportar seus pertences no dia a dia. Ela oferece um ótimo espaço interno, bolsos laterais e com alça ajustável.')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (5, N'B006', N'Bolas de têniss', N'00bdce78-4ea2-4dc0-9f23-4b28cf65019d.jpg', 20, 35, 20, N'Nacional', N'29x44x14 (LxAxP) cm', N'50g', N'12 Meses', N'Bola Redonda')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (6, N'R001', N'Raquete De Tennis', N'b964a1b8-5687-4e2c-be1e-6af539fa6694.jpg', 60, 1200, 20, N'Nacional', N'', N'', N'12 meses', N'Raquete De Tennis Wilson Us Open 25 Infantil')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (7, N'P001', N'Prancha de Surf', N'79abf544-a604-430e-bf17-c1e0ba8e8bd5.jpg', 160, 320, 19, N'Importado', N'', N'1,5kg', N'12 meses', N'Prancha de Snowboard para o Jão das Neves')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (8, N'S005', N'Skate Hello Muchacho', N'6b20a50c-90d7-482a-b163-3a6d27c8a457.jpg', 60, 80, 22, N'Nacional', N'60x25x25(LxAxC)', N'', N'Contra Defeito de Fabricação', N'O Saco de Pancada Punch 60cm foi confeccionado para que você tenha os melhores treinos de artes marciais. Feito de lona sintética de alta resistência, tem enchimento para melhor absorção de impactos. Tudo isso com a qualidade Punch que você já conhece. Vale a pena conferir!')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (9, N'S006', N'Bola de Rugby Nike Max 02', N'0d7ca72e-beba-413c-8cfc-0bf2d18fbd7f.jpg', 85, 125, 25, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (10, N'S007', N'Bola de Rugby Nike Turbo Max', N'4d6d77a3-c772-443b-8f5a-e6a3e2348d15.jpg', 95, 139, 25, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (11, N'S36', N'Bola de Tênis c/03 unidades', N'453fef6d-8dbb-4743-95ba-2c3499fb5d35.jpg', 9, 18.9, 20, N'Nacional', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (13, N'D057', N'Óculos de Natação Speedo WindForce', N'5f60d18d-006f-4734-8004-c19a5f557800.jpg', 12.5, 25, 18, N'Nacional', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (14, N'G036', N'Óculos de Natação Nike Blair', N'1c609863-6475-4f83-8f5a-b052df70c6c6.jpg', 20, 35, 18, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (15, N'C096', N'Capacete de Rugby Netler Bug', N'54d7eb58-1636-4a19-ac19-c3840502ea23.jpg', 120, 369, 25, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (16, N'U035', N'Bicicleta Caloi ForceGear 6 Marchas', N'f6e05938-3b9e-413a-80b6-7849cc24edda.jpg', 680, 1350, 24, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (17, N'G758', N'Bola de Basquete Wilson Revolution', N'954ec5be-22cf-4c68-9e63-4a049c3b45dc.jpg', 60, 95, 23, N'Nacional', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (18, N'G074', N'Bola de Basquete Penalty Indoor', N'e414cff0-1ff1-41ee-9b17-520a2d2334e5.jpg', 80, 109, 23, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (23, N'F960', N'Bola de Futebol Nike Zoom', N'4e7a8faa-3b42-41f3-850b-cae884a13ee7.jpg', 80, 135, 17, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (25, N'V345', N'Bola Futebol Society Penalty Turbo', N'188e93a9-c9ea-49b9-9f23-a60f5e26c0e7.jpg', 75, 120, 17, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (26, N'K945', N'Bola de Vôlei Penalty Zoom Max', N'b9817155-94b8-4660-a970-d77c8f7c92fe.jpg', 70, 125, 21, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (27, N'B364', N'Bola de Futebol Penalty Corsair', N'8261d8a9-99db-485b-ba86-00f97f4f23c7.jpg', 75, 140, 17, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (28, N'L846', N'Bicicleta Caloi EarForce 6 Marchas', N'bd219639-4b85-48c0-ac8d-7f36fb6ffcee.jpg', 1250, 1895, 24, N'Importado', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (29, N'C938', N'Prancha de Surfe Anix Weir', N'33488628-9f14-4384-bf36-f0fecb80b5b9.jpg', 40, 120, 19, N'Nacional', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (34, N'B306', N'Snorkel Speedo InWater', N'cab2fea0-46a4-4b07-8c19-5c50087ba764.jpg', 45, 112, 18, N'Nacional', N'', N'', N'', N'')
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao]) VALUES (35, N'V386', N'Capacete de Rugby Jords Alvner', N'84711d69-eba7-4a8a-a7da-81861de6814b.jpg', 240, 385, 25, N'Importado', N'', N'', N'', N'')