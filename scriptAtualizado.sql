USE [ecommerce]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 05/23/2017 15:35:06 ******/
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
/****** Object:  Table [dbo].[cartao]    Script Date: 05/23/2017 15:35:06 ******/
SET IDENTITY_INSERT [dbo].[cartao] ON
INSERT [dbo].[cartao] ([idCartao], [numero], [nomeImpresso], [validade], [codigoSeguranca]) VALUES (1, N'111111111111111', N'Bil', CAST(0xC23C0B00 AS Date), 123)
INSERT [dbo].[cartao] ([idCartao], [numero], [nomeImpresso], [validade], [codigoSeguranca]) VALUES (2, N'5555666644441111', N'Bill da Let', CAST(0xF2410B00 AS Date), 690)
SET IDENTITY_INSERT [dbo].[cartao] OFF
/****** Object:  Table [dbo].[endereco]    Script Date: 05/23/2017 15:35:06 ******/
SET IDENTITY_INSERT [dbo].[endereco] ON
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (1, N'Rua Hiléia Amazônica', N'03245000', 352, N'', N'Jardim Panorama', N'São Paulo', N'SP')
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (2, N'Rua Hiléia Amazônica', N'03245000', 900, N'casa2', N'Jardim Panorama', N'São Paulo', N'SP')
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (3, N'Avenida Santo Afonso', N'04426000', 5, N'casa', N'Jardim Miriam', N'São Paulo', N'SP')
INSERT [dbo].[endereco] ([idEndereco], [logradouro], [cep], [numero], [complemento], [bairro], [cidade], [estado]) VALUES (4, N'Avenida Santo Afonso', N'04426000', 5, N'casa', N'Jardim Miriam', N'São Paulo', N'SP')
SET IDENTITY_INSERT [dbo].[endereco] OFF
/****** Object:  Table [dbo].[cliente]    Script Date: 05/23/2017 15:35:06 ******/
SET IDENTITY_INSERT [dbo].[cliente] ON
INSERT [dbo].[cliente] ([idCliente], [email], [senha], [nome], [sexo], [cpf], [dataNascimento], [telefone], [idEndereco], [idCartao]) VALUES (1, N'ninoreggae@gmail.com', N'202CB962AC59075B964B07152D234B70', N'Cesar Quadros', N'M', N'37765289829', CAST(0xB0130B00 AS Date), N'1156214658', 1, 1)
INSERT [dbo].[cliente] ([idCliente], [email], [senha], [nome], [sexo], [cpf], [dataNascimento], [telefone], [idEndereco], [idCartao]) VALUES (2, N'bill@gmail.com', N'DF6D2338B2B8FCE1EC2F6DDA0A630EB0', N'Bill', N'M', N'12345678909', CAST(0xB1130B00 AS Date), N'1156245896', 2, 2)
INSERT [dbo].[cliente] ([idCliente], [email], [senha], [nome], [sexo], [cpf], [dataNascimento], [telefone], [idEndereco], [idCartao]) VALUES (4, N'eldao@gmail.com', N'15DE21C670AE7C3F6F3F1F37029303C9', N'Elder Henrique', N'M', N'55555555555', CAST(0x22250B00 AS Date), N'1152528989', 4, NULL)
SET IDENTITY_INSERT [dbo].[cliente] OFF
/****** Object:  Table [dbo].[carrinho_compra]    Script Date: 05/23/2017 15:35:06 ******/
/****** Object:  Table [dbo].[produto]    Script Date: 05/23/2017 15:35:06 ******/
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
SET IDENTITY_INSERT [dbo].[produto] OFF
/****** Object:  Table [dbo].[itens_carrinho]    Script Date: 05/23/2017 15:35:06 ******/
SET IDENTITY_INSERT [dbo].[itens_carrinho] ON
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado]) VALUES (1, 1, 3, NULL, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado]) VALUES (2, 2, 3, NULL, 0)
INSERT [dbo].[itens_carrinho] ([idItem], [idCliente], [idProduto], [idCompra], [finalizado]) VALUES (3, 4, 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[itens_carrinho] OFF
