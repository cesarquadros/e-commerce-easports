USE [master]
GO
/****** Object:  Database [ecommerce]    Script Date: 05/31/2017 21:23:31 ******/
CREATE DATABASE [ecommerce] ON  PRIMARY 
( NAME = N'ecommerce', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ecommerce.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecommerce_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ecommerce_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecommerce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ecommerce] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ecommerce] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ecommerce] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ecommerce] SET ARITHABORT OFF
GO
ALTER DATABASE [ecommerce] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ecommerce] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ecommerce] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ecommerce] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ecommerce] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ecommerce] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ecommerce] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ecommerce] SET  DISABLE_BROKER
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ecommerce] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ecommerce] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ecommerce] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ecommerce] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ecommerce] SET  READ_WRITE
GO
ALTER DATABASE [ecommerce] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ecommerce] SET  MULTI_USER
GO
ALTER DATABASE [ecommerce] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ecommerce] SET DB_CHAINING OFF
GO
USE [ecommerce]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
SET IDENTITY_INSERT [dbo].[categoria] OFF
/****** Object:  Table [dbo].[cartao]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cartao](
	[idCartao] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](100) NOT NULL,
	[nomeImpresso] [varchar](100) NOT NULL,
	[validade] [date] NOT NULL,
	[codigoSeguranca] [int] NOT NULL,
 CONSTRAINT [PK_CARTAO] PRIMARY KEY CLUSTERED 
(
	[idCartao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cartao] ON
INSERT [dbo].[cartao] ([idCartao], [numero], [nomeImpresso], [validade], [codigoSeguranca]) VALUES (1, N'3652145785469854', N'Diego H Fernadnes', CAST(0x99420B00 AS Date), 579)
INSERT [dbo].[cartao] ([idCartao], [numero], [nomeImpresso], [validade], [codigoSeguranca]) VALUES (2, N'1234987645634569', N'Ashy', CAST(0xAB410B00 AS Date), 666)
SET IDENTITY_INSERT [dbo].[cartao] OFF
/****** Object:  Table [dbo].[endereco]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[endereco](
	[idEndereco] [int] IDENTITY(1,1) NOT NULL,
	[logradouro] [varchar](150) NOT NULL,
	[cep] [varchar](9) NOT NULL,
	[numero] [int] NOT NULL,
	[complemento] [varchar](100) NULL,
	[bairro] [varchar](100) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](2) NOT NULL,
 CONSTRAINT [PK_ENDERECO] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[endereco] ON
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (1, N'Rua Hiléia Amazônica', N'03245000', 352, N'Bloco Tulipa', N'Jardim Panorama', N'São Paulo', N'SP')
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (2, N'Avenida Piauí', N'06852000', 218, N'casa 1', N'Parque Paraíso', N'Itapecerica da Serra', N'SP')
SET IDENTITY_INSERT [dbo].[endereco] OFF
/****** Object:  Table [dbo].[cliente]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[senha] [varchar](50) NOT NULL,
	[nome] [varchar](150) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[telefone] [varchar](11) NOT NULL,
	[idEndereco] [int] NULL,
	[idCartao] [int] NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON
INSERT [dbo].[cliente] ([idCliente], [email], [senha], [nome], [sexo], [cpf], [dataNascimento], [telefone], [idEndereco], [idCartao]) VALUES (1, N'diegofernandes88@hotmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', N'Diego', N'M', N'36521547854', CAST(0xB0130B00 AS Date), N'1132547854', 1, 1)
INSERT [dbo].[cliente] ([idCliente], [email], [senha], [nome], [sexo], [cpf], [dataNascimento], [telefone], [idEndereco], [idCartao]) VALUES (2, N'ninoreggae@gmail.com', N'202CB962AC59075B964B07152D234B70', N'Cesar Quadros', N'M', N'36521547854', CAST(0xB0130B00 AS Date), N'1132547854', 2, 2)
SET IDENTITY_INSERT [dbo].[cliente] OFF
/****** Object:  Table [dbo].[carrinho_compra]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrinho_compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[dataCompra] [date] NOT NULL,
	[parcelas] [int] NOT NULL,
	[idCartao] [int] NULL,
	[tipoPagamento] [varchar](10) NULL,
 CONSTRAINT [PK_COMPRA] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[carrinho_compra] ON
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (1, CAST(0xDB3C0B00 AS Date), 1, NULL, N'boleto')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (2, CAST(0xDB3C0B00 AS Date), 1, NULL, N'boleto')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (3, CAST(0xDB3C0B00 AS Date), 1, 1, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (4, CAST(0xDB3C0B00 AS Date), 1, 1, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (5, CAST(0xDB3C0B00 AS Date), 1, 1, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (6, CAST(0xDB3C0B00 AS Date), 1, 1, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (7, CAST(0xDB3C0B00 AS Date), 5, 2, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (8, CAST(0xDB3C0B00 AS Date), 1, 2, N'cartao')
INSERT [dbo].[carrinho_compra] ([idCompra], [dataCompra], [parcelas], [idCartao], [tipoPagamento]) VALUES (9, CAST(0xDB3C0B00 AS Date), 1, NULL, N'boleto')
SET IDENTITY_INSERT [dbo].[carrinho_compra] OFF
/****** Object:  Table [dbo].[produto]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[produto](
	[idProduto] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](100) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[imagem] [varchar](1000) NOT NULL,
	[precoCusto] [float] NOT NULL,
	[precoVenda] [float] NOT NULL,
	[idCategoria] [int] NULL,
	[origem] [varchar](100) NULL,
	[dimensoes] [varchar](100) NULL,
	[peso] [varchar](100) NULL,
	[garantia] [varchar](100) NULL,
	[descricao] [varchar](1000) NULL,
	[quantidade] [int] NOT NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[produto] ON
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (1, N'B003', N'Bola de basket Penalty Nike', N'a600013b-e4ab-40dc-805d-80dcb4dc8aac.jpg', 70, 110, 23, N'Nacional', N'29x44x14 (LxAxP) cm', N'300g', N'12 Meses', N'Bola Redonda', 8)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (2, N'R001', N'Relogio adidas', N'517d0034-df87-4396-9c32-16ecb5b750ff.jpg', 100, 170, 26, N'Importado', N'29x44x14 (LxAxP) cm', N'60g', N'12 Meses', N'Marca hora', 15)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (3, N'M001', N'Mochila Nike', N'62c65374-3211-4062-9a9f-752c3fc1e2db.jpg', 120, 180, 26, N'Importado', N'29x44x14 (LxAxP) cm', N'700g', N'12 Meses', N'O visual moderno da Mochila Nike Brasília é a opção perfeita para transportar seus pertences no dia a dia. Ela oferece um ótimo espaço interno, bolsos laterais e com alça ajustável.', 6)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (4, N'B006', N'Bolas de têniss', N'00bdce78-4ea2-4dc0-9f23-4b28cf65019d.jpg', 20, 35, 20, N'Nacional', N'29x44x14 (LxAxP) cm', N'50g', N'12 Meses', N'Bola Redonda', 7)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (5, N'R001', N'Raquete De Tennis', N'b964a1b8-5687-4e2c-be1e-6af539fa6694.jpg', 60, 1200, 20, N'Nacional', N'', N'', N'12 meses', N'Raquete De Tennis Wilson Us Open 25 Infantil', 9)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (6, N'P001', N'Prancha de Surf', N'79abf544-a604-430e-bf17-c1e0ba8e8bd5.jpg', 160, 320, 19, N'Importado', N'', N'1,5kg', N'12 meses', N'Prancha de Snowboard para o Jão das Neves', 11)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (7, N'S005', N'Skate Hello Muchacho', N'6b20a50c-90d7-482a-b163-3a6d27c8a457.jpg', 60, 80, 22, N'Nacional', N'60x25x25(LxAxC)', N'', N'Contra Defeito de Fabricação', N'O Saco de Pancada Punch 60cm foi confeccionado para que você tenha os melhores treinos de artes marciais. Feito de lona sintética de alta resistência, tem enchimento para melhor absorção de impactos. Tudo isso com a qualidade Punch que você já conhece. Vale a pena conferir!', 3)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (8, N'S006', N'Bola de Rugby Nike Max 02', N'0d7ca72e-beba-413c-8cfc-0bf2d18fbd7f.jpg', 85, 125, 25, N'Importado', N'', N'', N'', N'', 20)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (9, N'S007', N'Bola de Rugby Nike Turbo Max', N'4d6d77a3-c772-443b-8f5a-e6a3e2348d15.jpg', 95, 139, 25, N'Importado', N'', N'', N'', N'', 37)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (10, N'S36', N'Bola de Tênis c/03 unidades', N'453fef6d-8dbb-4743-95ba-2c3499fb5d35.jpg', 9, 18.9, 20, N'Nacional', N'', N'', N'', N'', 24)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (12, N'D057', N'Óculos de Natação Speedo WindForce', N'5f60d18d-006f-4734-8004-c19a5f557800.jpg', 12.5, 25, 18, N'Nacional', N'', N'', N'', N'', 18)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (13, N'G036', N'Óculos de Natação Nike Blair', N'1c609863-6475-4f83-8f5a-b052df70c6c6.jpg', 20, 35, 18, N'Importado', N'', N'', N'', N'', 6)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (14, N'C096', N'Capacete de Rugby Netler Bug', N'54d7eb58-1636-4a19-ac19-c3840502ea23.jpg', 120, 369, 25, N'Importado', N'', N'', N'', N'', 13)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (15, N'U035', N'Bicicleta Caloi ForceGear 6 Marchas', N'f6e05938-3b9e-413a-80b6-7849cc24edda.jpg', 680, 1350, 24, N'Importado', N'', N'', N'', N'', 14)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (16, N'G758', N'Bola de Basquete Wilson Revolution', N'954ec5be-22cf-4c68-9e63-4a049c3b45dc.jpg', 60, 95, 23, N'Nacional', N'', N'', N'', N'', 10)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (17, N'G074', N'Bola de Basquete Penalty Indoor', N'e414cff0-1ff1-41ee-9b17-520a2d2334e5.jpg', 80, 109, 23, N'Importado', N'', N'', N'', N'', 6)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (22, N'F960', N'Bola de Futebol Nike Zoom', N'4e7a8faa-3b42-41f3-850b-cae884a13ee7.jpg', 80, 135, 17, N'Importado', N'', N'', N'', N'', 9)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (24, N'V345', N'Bola Futebol Society Penalty Turbo', N'188e93a9-c9ea-49b9-9f23-a60f5e26c0e7.jpg', 75, 120, 17, N'Importado', N'', N'', N'', N'', 13)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (25, N'K945', N'Bola de Vôlei Penalty Zoom Max', N'b9817155-94b8-4660-a970-d77c8f7c92fe.jpg', 70, 125, 21, N'Importado', N'', N'', N'', N'', 21)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (26, N'B364', N'Bola de Futebol Penalty Corsair', N'8261d8a9-99db-485b-ba86-00f97f4f23c7.jpg', 75, 140, 17, N'Importado', N'', N'', N'', N'', 0)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (27, N'L846', N'Bicicleta Caloi EarForce 6 Marchas', N'bd219639-4b85-48c0-ac8d-7f36fb6ffcee.jpg', 1250, 1895, 24, N'Importado', N'', N'', N'', N'', 0)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (28, N'C938', N'Prancha de Surfe Anix Weir', N'33488628-9f14-4384-bf36-f0fecb80b5b9.jpg', 40, 120, 19, N'Nacional', N'', N'', N'', N'', 0)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (33, N'B306', N'Snorkel Speedo InWater', N'cab2fea0-46a4-4b07-8c19-5c50087ba764.jpg', 45, 112, 18, N'Nacional', N'', N'', N'', N'', 0)
INSERT [dbo].[produto] ([idProduto], [codigo], [nome], [imagem], [precoCusto], [precoVenda], [idCategoria], [origem], [dimensoes], [peso], [garantia], [descricao], [quantidade]) VALUES (34, N'V386', N'Capacete de Rugby Jords Alvner', N'84711d69-eba7-4a8a-a7da-81861de6814b.jpg', 240, 385, 25, N'Importado', N'', N'', N'', N'', 0)
SET IDENTITY_INSERT [dbo].[produto] OFF
/****** Object:  Table [dbo].[itens_carrinho]    Script Date: 05/31/2017 21:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itens_carrinho](
	[idItem] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idProduto] [int] NULL,
	[idCompra] [int] NULL,
	[finalizado] [bit] NOT NULL,
	[removido] [bit] NOT NULL,
 CONSTRAINT [PK_CARRINHO] PRIMARY KEY CLUSTERED 
(
	[idItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[itens_carrinho] ON
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (24, 1, 17, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (25, 1, 10, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (26, 1, 5, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (27, 1, 1, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (28, 1, 8, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (29, 1, 1, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (30, 1, 1, NULL, 0, 1)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (31, 1, 8, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (32, 1, 8, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (33, 1, 8, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (34, 1, 8, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (35, 1, 2, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (36, 1, 7, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (37, 1, 7, NULL, 0, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado], [removido]) VALUES (38, 1, 7, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[itens_carrinho] OFF
/****** Object:  Default [DF__produto__quantid__2B3F6F97]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[produto] ADD  DEFAULT ((0)) FOR [quantidade]
GO
/****** Object:  Default [DF__itens_car__final__403A8C7D]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[itens_carrinho] ADD  DEFAULT ((0)) FOR [finalizado]
GO
/****** Object:  Default [DF__itens_car__remov__412EB0B6]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[itens_carrinho] ADD  DEFAULT ((0)) FOR [removido]
GO
/****** Object:  ForeignKey [FK__cliente__idCarta__33D4B598]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([idCartao])
REFERENCES [dbo].[cartao] ([idCartao])
GO
/****** Object:  ForeignKey [FK__cliente__idEnder__32E0915F]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([idEndereco])
REFERENCES [dbo].[endereco] ([idEndereco])
GO
/****** Object:  ForeignKey [FK__carrinho___idCar__36B12243]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD FOREIGN KEY([idCartao])
REFERENCES [dbo].[cartao] ([idCartao])
GO
/****** Object:  ForeignKey [FK__produto__idCateg__2C3393D0]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[produto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categoria] ([idCategoria])
GO
/****** Object:  ForeignKey [FK__itens_car__idCli__4222D4EF]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[itens_carrinho]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
/****** Object:  ForeignKey [FK__itens_car__idCom__440B1D61]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[itens_carrinho]  WITH CHECK ADD FOREIGN KEY([idCompra])
REFERENCES [dbo].[carrinho_compra] ([idCompra])
GO
/****** Object:  ForeignKey [FK__itens_car__idPro__4316F928]    Script Date: 05/31/2017 21:23:32 ******/
ALTER TABLE [dbo].[itens_carrinho]  WITH CHECK ADD FOREIGN KEY([idProduto])
REFERENCES [dbo].[produto] ([idProduto])
GO
