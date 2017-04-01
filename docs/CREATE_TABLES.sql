

CREATE TABLE endereco(
   idEndereco 	INT PRIMARY KEY NOT NULL,
   logradouro 	varchar(150)	NOT NULL,
   cep		varchar(9)	NOT NULL,
   numero	integer		NOT NULL,
   complemento  varchar(100),
   bairro       varchar(100)	NOT NULL,
   cidade       varchar(50)	NOT NULL,
   estado       varchar(2)	NOT NULL
)

CREATE TABLE categoria(
   idCategoria 	INT PRIMARY KEY NOT NULL,
   nome 	varchar(100)	NOT NULL
)

CREATE TABLE cartao(
   idCartao 		INT PRIMARY KEY NOT NULL,
   numero 		integer		NOT NULL,
   nomeImpresso		varchar(100)	NOT NULL,
   validade		date		NOT NULL,
   codigoSeguranca  	integer		NOT NULL
)

CREATE TABLE produto(
   idProduto 		INT PRIMARY KEY NOT NULL,
   codigo 		varchar(100)	NOT NULL,
   nome			varchar(100)	NOT NULL,
   preco		float		NOT NULL,
   imagem		varchar(1000)	NOT NULL,
   precoCusto		float		NOT NULL,
   precoVenda		float		NOT NULL,
   idCategoria		integer		references categoria(idCategoria)
)

CREATE TABLE carrinho(
   idCarrinho 		INT PRIMARY KEY NOT NULL,
   quantidade 		integer		NOT NULL,
   idProduto		integer		references produto(idProduto),
   finalizado		boolean		NOT NULL default false
)

CREATE TABLE cliente(
   idCliente 		INT PRIMARY KEY NOT NULL,
   email 		varchar(100)	NOT NULL,
   senha		varchar(50)	NOT NULL,
   nome			varchar(150)	NOT NULL,
   sexo			char(1)		NOT NULL,
   cpf			varchar(11)	NOT NULL,
   dataNascimento	date		NOT NULL,
   telefone		varchar(11)	NOT NULL,
   idEndereco		integer		references endereco(idEndereco),
   idCarrinho		integer		references carrinho(idCarrinho)
)

CREATE TABLE compra(
   idCompra 		INT PRIMARY KEY NOT NULL,
   idCliente 		integer		references cliente(idCliente),
   dataCompra		date		NOT NULL,
   parcelas		integer		NOT NULL
)

