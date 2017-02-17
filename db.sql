-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(150) NOT NULL,
  `tags` TEXT NOT NULL,
  `categories` TEXT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `variants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `variants` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `price` FLOAT NOT NULL,
  `price_old` FLOAT NULL,
  `quantity` INT NOT NULL,
  `active` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  INDEX `fk_variants_products_idx` (`product_id` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `images` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `variant_id` INT UNSIGNED NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_variants1_idx` (`variant_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `status_id` TINYINT UNSIGNED NOT NULL,
  `created` DATETIME NOT NULL,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`user_id` ASC),
  INDEX `fk_orders_status1_idx` (`status_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `variant_id` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`, `order_id`),
  INDEX `fk_order_items_orders1_idx` (`order_id` ASC),
  INDEX `fk_order_items_variants1_idx` (`variant_id` ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `users`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES (1, 'Usuario Teste 1', 'usuario.teste1@teste.com', '123456');
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES (2, 'Usuario Teste 2', 'usuario.teste2@teste.com', '123456');
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES (3, 'Usuario Teste 3', 'usuario.teste3@teste.com', '123456');

COMMIT;


-- -----------------------------------------------------
-- Data for table `products`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (1, 'Colar Renne', 'colar-renne', 'BIJOUX>COLARES>INDEFINIDO', 'noite,casual,lazer,informal,brilhante,moderno,chic,dourado,metal,delicado,pedras,quadrado,colar,fecho,p', 'Um único acessório pode garantir o sucesso do look. Investir em itens que fazem a diferença como o Colar Renne garantem um up nas produções.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (2, 'Colar Arrow', 'colar-arrow', 'BIJOUX>COLARES>INDEFINIDO', 'casual,informal,moderno,chic,dourado,pesado,metal,prata,pedras,strass,colar,fecho,bijoux,colares,indefinido', 'A extravagância e a riqueza de detalhes dos acessórios inspira o Colar Arrow. Opção incrível para complementar looks que vão do casual ao sofisticado.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (3, 'Saia Recortes Lirio', 'saia-recortes-lirio', 'ROUPAS>SAIAS>SAIAS CURTAS', 'justo,liso,chic,prata,cor ', 'Com modelagem que valoriza a silhueta, invista na Saia Recortes Lirio. Com o tecido nobre, vai deixa sua produção ainda mais cool!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (4, 'Saia Cipriani', 'saia-cipriani', 'ROUPAS>SAIAS>SAIAS CURTAS', 'sexy,sensual,liso,casual,leve,z', 'Com a Saia Cipriani, o básico também é elegante e super feminino. Não deixe de ter esse item must-have para produções ultra versáteis e cheias de estilo.\n\nSaia de tecido leve.Com forro e zíper invisível na parte posterior. Fenda fechada.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (5, 'Vestido Voyage', 'vestido-voyage', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'decote,sexy,estampado,casual,macio,leve,estampas,curto,moderno,dia-a-dia,girlie,elegante,feminino,alcinha,preto,decote costas,laranja,coral,azul claro,navy,tangerina,romantico,passeio,flu', 'Um vestidinho leve e solto para você montar um look fácil e cheio de charme.\n\nDecote nas costas, elástico na cintura.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (6, 'Vestido Knot', 'vestido-knot', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'estampado,casual,macio,leve,estampas,curto,moderno,chique,elegante,feminino,cetim,pink,solto,laranja,reto,navy,n', 'Um vestido must-have absoluto com detalhe em nós nos ombros e caimento perfeito. Leve e fresquinho para o verão.\n\nVestido leve com detalhes de tecido nas alças, não removíveis.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (7, 'Camisa Boyfriend', 'camisa-boyfriend', 'ROUPAS>BLUSAS>CAMISAS', 'manga longa,liso,trabalho,macio,leve,cl', 'A Camisa Boyfriend é feita de seda e resulta em um tecido leve, brilhante e macio. Uma peça delicada e de qualidade superior para ter no seu guarda-roupas e garantir uma produção elegante e sofisticada.\n\nCamisa com botões na parte frontal e mangas. Lenço removível acompanha a camisa.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (8, 'Top Lights', 'top-lights', 'ROUPAS>BLUSAS>REGATAS', 'body,noite,balada,largo,decote v,texturizado,brilhante,moderno,chique,elegante,dourado,solto,sofisticado,cool,fino,jantar,evento,mole,night out,abertura entre pernas,roupas,blusas,regatas', 'O Top Lights é perfeito para quem procura modernidade e muito estilo em uma única peça. Combine-o com peças mais justas para contrapor e saia arrasando.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (9, 'Vestido Drapeado Velvet', 'vestido-drapeado-velvet', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'justo,estampado,decote v,estampas,z', 'O Vestido Velvet já vem pronto para fazer da sua produção única. Em modelagem diferenciada, ele vai te fazer arrasar na noite.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (10, 'Jaqueta Diamante', 'jaqueta-diamante', 'ROUPAS>CASACOS>BLAZERS', 'noite,balada,manga longa,macio,assim', 'A Jaqueta Diamante garante modernidade ao look, com pontas assimétricas e muito brilho.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (11, 'Brinco Longo Medalha', 'brinco-longo-medalha', 'BIJOUX>BRINCOS>INDEFINIDO', 'casual,longo,vazado,boho,dourado,metal,prata,cascata,festa,metalico,maxi,folk,passeio,gypsy,festival,moedas,tarraxa,evento,bar,aplica', 'O Brinco Longo Medalha traz duas super tendências: maxi brincos e o estilo Boho. É perfeito para dar um ar gypsy ao seu look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (12, 'ANEL PIRÂMIDE CALAFATE', 'anel-piramide-calafate', 'BIJOUX>ANEIS>', 'noite,balada,ousado,brilhante,dourado,metal,strass,grande,cool,passeio,festival,texturas,show,bijoux,aneis', 'Os maxi anéis tem o poder de deixar a produção mais descolada, moderna e elegante.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (13, 'ANEL GARRAS', 'anel-garras', 'BIJOUX>ANEIS>', 'noite,balada,ousado,brilhante,dourado,metal,strass,', 'Acessórios agregam personalidade ao look. O Anel Garras é para aquelas que gostam de um toque ousado na produção. You\'re gonna roar!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (14, 'BRINCO PENAS POÁ', 'brinco-penas-poa', 'BIJOUX>BRINCOS>', 'macio,colorido,dourado,pena,', 'O Brinco Penas Poá é perfeito para agregar um ar beachstyle ao seu look. Combinam perfeitamente com um estilo folk e são ultra descolados.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (15, 'ANEL ESPINHO', 'anel-espinho', 'BIJOUX>ANEIS>', 'rock,rocker,ousado,dourado,metal,strass,grande,festival,texturas,spikes,diferenciado,show,bijoux,aneis', 'Acessórios agregam personalidade ao look. O Anel Espinho é cheio de estilo e traz um ar rock à produção.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (16, 'PULSEIRA DOIS METAIS', 'pulseira-dois-metais', 'BIJOUX>PULSEIRAS>', 'texturizado,moderno,metal,redondo,festa,vermelho,metalizado,', 'Elaborada manualmente por atesãos tibetanos em Nova Déli, a Pulseira Dois Metais é um dos produtos exclusivos da coleção especialmente criada para celebrar a vida. Celebre você também com os ares do oriente no seu look!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (17, 'PULSEIRA OVAL', 'pulseira-oval', 'BIJOUX>PULSEIRAS>', 'liso,el', 'Elaborada manualmente por atesãos tibetanos em Nova Déli, a Pulseira Oval é um dos produtos exclusivos da coleção especialmente criada para celebrar a vida. Celebre você também com os ares do oriente no seu look!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (18, 'PULSEIRA QUATRO FIOS', 'pulseira-quatro-fios', 'BIJOUX>PULSEIRAS>', 'texturizado,moderno,colorido,metal,vermelho,metalizado,', 'Elaborada manualmente por atesãos tibetanos em Nova Déli, a Pulseira Quatro Fios é um dos produtos exclusivos da coleção especialmente criada para celebrar a vida. Celebre você também com os ares do oriente no seu look!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (19, 'CHAPÉU FLOPPY TREND', 'chapeu-floppy-trend', 'ACESSORIOS>CHAPEUS>', 'b', 'Chapéus são ótimos para um \'bad hair day\', além de proteger do frio ou do sol. O modelo Floppy é o que faz sucesso entre as it-girls.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (20, 'CAMISA ROMANTIQUE', 'camisa-romantique', 'ROUPAS>BLUSAS>BLUSAS MANGA LONGA', 'trabalho,casual,transparente,moderno,chic,transpassado,delicado,preto,solto,coral,workwear,branco,marinho,romantico,descolado,dia a dia,essentials,decote transpassado,soft white,roupas,blusas,blusas manga longa', 'Item essencial no guarda-roupas feminino, a camisa ganha charme com detalhes diferenciados como tecidos nobres e modelagens que valorizam o corpo.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (21, 'BRACELETE WOOD', 'bracelete-wood', 'BIJOUX>PULSEIRAS>', 'liso,metal,redondo,metalizado,shopping,marrom,r', 'Peças com elementos naturais são must-have. Compões looks atuais e agregam charme à produção.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (22, 'PULSEIRA SELA', 'pulseira-sela', 'BIJOUX>PULSEIRAS>', 'casual,bicolor,textura,redondo,natural,shopping,marrom,resina,osso,passeio,dia a dia,despojado,almo', 'Acessórios com aparência rústica e elementos naturais porém com detalhes que dão um toque sofisticado são ótimos para um visual despojado.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (23, 'CASACO MILITARY', 'casaco-military', 'ROUPAS>CASACOS>CASACOS', 'balada,justo,casual,macio,moderno,acinturado,elegante,preto,festa,cor ', 'O Militarismo presente mais uma vez!  O CASACO MILITARY é peça imponente, confeccionada em tecido encorpado. Seu comprimento alongado é ideal para dias de muito frio. Contraste entre um visual feminino e forte em qualquer ocasião.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (24, 'COLAR DARK', 'colar-dark', 'BIJOUX>COLARES>', 'longo,boho,elegante,dourado,metal,festa,metalizado,passeio,texturas,dia a dia,fecho regul', 'O boho ganha sofisticação e elegância no Colar Dark. Combine com camisas para um visual clássico ou com t-shirts para um look');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (25, 'COLAR THREE WAVES', 'colar-three-waves', 'BIJOUX>COLARES>', 'liso,casual,moderno,dourado,metal,prata,metalizado,triangular,shopping,passeio,dia a dia,fecho regul', 'Versátil, descolado e moderno, o Colar Three Waves complementa perfeitamente seus looks.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (26, 'COLAR WITCH', 'colar-witch', 'BIJOUX>COLARES>', 'liso,longo,boho,moderno,dourado,metal,metalizado,passeio,dia a dia,fecho regul', 'Com inspirações místicas, aposte no Colar Witch para enfeitiçar.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (27, 'PULSEIRA FACETADA METAL', 'pulseira-facetada-metal', 'BIJOUX>PULSEIRAS>', 'balada,largo,texturizado,moderno,chique,dourado,metal,prata,festa,metalizado,grande,cinema,futurista,abertura,bijoux,pulseiras', 'Invista em acessórios nada óbvios. Com a Pulseira Facetada Metal, seus looks ganham um toque futurista e super estiloso!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (28, 'PULSEIRA FIO COM PEDRAS', 'pulseira-fio-com-pedras', 'BIJOUX>PULSEIRAS>', 'colorido,prata,pedras,redondo,cord', 'O delicado e o rústico ganham forma no Pulseira Fio com Pedras. Aposte para agregar cor ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (29, 'T-SHIRT LEATHER GLOSSY', 't-shirt-leather-glossy', 'ROUPAS>BLUSAS>BLUSAS MANGA CURTA', 'balada,sexy,liso,couro,z', 'Queridinha das fashionistas para o inverno, a T-shirt em leather é uma ótima opção para variar o look do escritório á balada. Aposte em um look total leather para um visual moderno e sexy.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (30, 'BRINCO ARGOLA COM PINGENTES MARINA', 'brinco-argola-com-pingentes-marina', 'BIJOUX>BRINCOS>', 'casual,moderno,dourado,metal,prata,navy,cool,passeio,texturas,tarraxa,detalhado,dia a dia,almo', 'Argolas são um clássico que ganha charme com mix de elementos que remetem à tendência Navy.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (31, 'BRACELETE CASCALHOS ', 'bracelete-cascalhos', 'BIJOUX>PULSEIRAS>', 'pedras,redondo,coral,cool,hippie,passeio,mi', 'Quanto mais melhor. Invista no bracelete de cascalhos para deixar um toque mais Boho no seu visual.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (32, 'BRINCO BANCO DE CORAIS', 'brinco-banco-de-corais', 'BIJOUX>BRINCOS>', 'moderno,chique,colorido,coral,navy,turquesa,resina,passeio,texturas,tarraxa,dia a dia,ex', 'Mergulhe na trendy navy com o Brinco Banco de Corais! Hit entre as fashionistas, aposte para dar destaque ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (33, 'BRINCO LONGO CONCHAS E ESTRELAS', 'brinco-longo-conchas-e-estrelas', 'BIJOUX>BRINCOS>', 'casual,longo,moderno,dourado,metal,metalizado,estrela,passeio,texturas,tarraxa,detalhado,dia a dia,viagem,rebuscado,conchas,summer feelings,bijoux,brincos', 'Feels like a mermaid! Invista no Brinco Longo Conchas e Estrelas e mergulhe em um estilo único!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (34, 'BRINCO LEATHER MARINE', 'brinco-leather-marine', 'BIJOUX>BRINCOS>', 'casual,longo,couro,moderno,corrente,delicado,vermelho,caramelo,navy,n', 'Mergulhe na tendência Navy com o Brinco Leather Marine. Seus elementos remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (35, 'BRINCO LONGO CONCHIGLIA', 'brinco-longo-conchiglia', 'BIJOUX>BRINCOS>', 'longo,moderno,dourado,prata,metalizado,navy,passeio,texturas,descolado,tarraxa,dia a dia,almo', 'Mergulhe na tendência Navy com o Brinco Longo Conchiglia. Seus elementos remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (36, 'CAFTAN MAXI FENDAS', 'caftan-maxi-fendas', 'ROUPAS>BEACHWEAR>SAIDAS DE PRAIA', 'liso,casual,longo,macio,moderno,chique,elegante,fendas,off-white,praia,dia a dia,viagem,vers', 'Elegante e versátil, o Caftan compõe looks da praia à cidade! Abuse das sobreposições e dos acessórios para um look único.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (37, 'CALCINHA LACINHO DUPLA', 'calcinha-lacinho-dupla', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'casual,moderno,feminino,pink,la', 'Com a cara do verão, invista nos biquínis estampados, básicos, detalhados e cheio de estilo!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (38, 'CALCINHA LACINHO FRU FRU', 'calcinha-lacinho-fru-fru', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'casual,macio,feminino,estampa,praia,piscina,la', 'Invista na calcinha de amarrar valoriza qualquer silhueta e é cara do verão!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (39, 'CALCINHA LAÇO ARGOLAS', 'calcinha-laco-argolas', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'casual,moderno,pink,preto,verde ', 'Invista nos biquínis com design arrojado e detalhes diferenciados.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (40, 'CALCINHA PUSH-UP FRU FRU', 'calcinha-push-up-fru-fru', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'casual,moderno,preto,azul,cor ', 'Com a cara do verão, invista nos biquínis com design arrojado e cheio de estilo!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (41, 'CALCINHA SPORT MALIBU', 'calcinha-sport-malibu', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'liso,casual,moderno,preto,praia,ver', 'Com a cara do verão, invista nos biquínis com design arrojado e cheio de estilo!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (42, 'CALCINHA VIÉS COLOR', 'calcinha-vies-color', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'casual,moderno,neoprene,amarelo,lycra,cool,praia,ver', 'Com a cara do verão, invista nos biquínis com design arrojado e cheio de estilo!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (43, 'CALÇA ALTA ALFAIATARIA', 'calca-alta-alfaiataria', 'ROUPAS>CALÇAS>RETA', 'trabalho,casual,macio,z', 'As calças alfaiataria, essenciais no guarda roupa da mulher moderna. Utilize acessórios poderosos para dar um up na produção.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (44, 'CALÇA CULOTTE ELASTIC', 'calca-culotte-elastic', 'ROUPAS>CALÇAS>RETA', 'estampado,largo,macio,estampas,moderno,reto,amarra', 'Tendencia no Street Style, as calças culottes, serão o hit desta temporada. Um belo salto e uma cropped e você está pronta para arrasar!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (45, 'CALÇA CULOTTE TAILOR', 'calca-culotte-tailor', 'ROUPAS>CALÇAS>RETA', 'largo,z', 'Tendência no Street Style, as calças culottes, serão o hit desta temporada. Um belo salto e uma cropped e você está pronta para arrasar!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (46, 'CALÇA MAXI MARINE', 'calca-maxi-marine', 'ROUPAS>CALÇAS>RETA', 'estampado,casual,largo,moderno,', 'Conforto aliado com toque fashion das estampas, a Calça Maxi Marine é a pedida perfeita para sair da rotina nos dias quentes.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (47, 'CALÇA SKINNY CRUISE', 'calca-skinny-cruise', 'ROUPAS>CALÇAS>SKINNY', 'estampado,casual,macio,z', 'Um toque fashion para a alfaiataria, a estampa da Calça Cruise dá o destaque necessário para o seu look casual.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (48, 'CAMISA COULISSE VOIL', 'camisa-coulisse-voil', 'ROUPAS>BLUSAS>CAMISAS', 'casual,macio,leve,moderno,preto,cor ', 'Descolada e estilosa a Camisa Coulisse Voil é o item que dá um toque moderno ao look. Combine com calças estampadas e acessórios para um look com ainda mais personalidade.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (49, 'CHAPÉU PALHA ABA ', 'chapeu-palha-aba', 'ACESSORIOS>CHAPEUS>', 'casual,texturizado,moderno,corrente,palha,cor ', 'Chapéus são ótimos para proteger do sol e, de quebra, são estilosos. Aposte nos modelos Floppy para um look fashion da praia à cidade.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (50, 'CINTO CORDÃO MARE', 'cinto-cordao-mare', 'ACESSORIOS>CINTOS>', 'casual,moderno,preto,corda,redondo,off-white,navy,fino,passeio,fecho,cordas,texturas,dia a dia,viagem,clean,acessorios,cintos', 'Mergulhe na tendência Navy com acessórios que agregam vida ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (51, 'COLAR DE PÉROLAS NÁUTICO', 'colar-de-perolas-nautico', 'BIJOUX>COLARES>', 'casual,curto,moderno,dourado,delicado,passeio,fecho,texturas,p', 'Mergulhe na tendência Navy com o Colar de Pérolas Náutico. Seus elementos remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (52, 'COLAR ELOS CONCHA', 'colar-elos-concha', 'BIJOUX>COLARES>', 'casual,longo,cl', 'Mergulhe na tendência Navy com o Colar Elos Concha. Suas pérolas e conchas remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (53, 'COLAR LEATHER MARINE', 'colar-leather-marine', 'BIJOUX>COLARES>', 'casual,longo,couro,moderno,corrente,delicado,vermelho,caramelo,navy,n', 'Mergulhe na tendência Navy com o Colar Leather Marine. Seus elementos remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (54, 'COLAR LONGO CRISTALLI', 'colar-longo-cristalli', 'BIJOUX>COLARES>', 'casual,longo,colorido,verde,grafite,tassel,franjas,passeio,pingentes,texturas,descolado,dia a dia,despojado,viagem,bijoux,colares', 'O Colar Longo Cristalli é moderno e super cool, perfeito para os dias de produções mais básicas e despojadas.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (55, 'COLAR LONGO PÚGLIA', 'colar-longo-puglia', 'BIJOUX>COLARES>', 'casual,longo,metalizado,navy,ouro velho,passeio,fecho,texturas,p', 'Mergulhe na tendência Navy com o Colar Longo Púglia. Suas pérolas e elementos náuticos remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (56, 'COLAR LONGO SHELLY', 'colar-longo-shelly', 'BIJOUX>COLARES>', 'casual,longo,moderno,dourado,delicado,navy,passeio,texturas,p', 'Mergulhe na tendência Navy com o Colar Longo Shelly. Suas pérolas e conchas remetem a trend do momento.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (57, 'COLAR LONGO TERZO', 'colar-longo-terzo', 'BIJOUX>COLARES>', 'casual,longo,colorido,grafite,passeio,mi', 'O Colar Longo Terzo é moderno e super cool, perfeito para os dias de produções mais básicas e despojadas.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (58, 'COLAR TRANÇA DE PÉROLAS', 'colar-tranca-de-perolas', 'BIJOUX>COLARES>', 'casual,texturizado,moderno,dourado,corda,redondo,tran', 'Mergulhe na tendência navy com acessórios descolados. Com miçangas, tranças e pérolas, o Colar Trança de Pérolas é aposta certa para a tendência.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (59, 'HOT PANT SLIM', 'hot-pant-slim', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'estampado,liso,casual,moderno,cintura alta,preto,cor ', 'Com uma pegada retrô, os Hot Pants voltaram com tudo! Inspire-se nas Pin-up\'s para um look trendy!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (60, 'KIT DE PULSEIRA MARMO', 'kit-de-pulseira-marmo', 'BIJOUX>PULSEIRAS>', 'casual,b', 'Peças com elementos do mar são perfeitos para dar um up no look nos dias mais quentes.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (61, 'MAIÔ ZÍPER AUSSIE', 'maio-ziper-aussie', 'ROUPAS>BEACHWEAR>MAIOS', 'macio,z', 'O Maiô Zíper Aussie desperta mais ousadia e sensualidade, super indicado para mulheres de personalidade. O zíper frontal e o decote tomara que caia fazem dele uma peça única e indispensável.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (62, 'MINI VEST NAVAL', 'mini-vest-naval', 'ROUPAS>BLUSAS>BLUSAS MANGA CURTA', 'liso,casual,moderno,acinturado,elegante,cor ', 'Feminino e descolado, o Mini Vest Naval é perfeito para os dias mais quentes. Abuse dos acessórios para dar sua cara ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (63, 'PULSEIRA DE PÉROLAS NÁUTICO', 'pulseira-de-perolas-nautico', 'BIJOUX>PULSEIRAS>', 'balada,cl', 'As pérolas são sempre um clássico, na Pulseira de Pérolas Náutico , elas unidas com a tendência Navy hit da estação.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (64, 'SAIA MIDI BOTÕES', 'saia-midi-botoes', 'ROUPAS>SAIAS>SAIAS MIDI & MEDIAS', 'casual,midi,macio,feminino,cor ', 'O Jeans é a tendência da temporada. Aposte na Saia Midi Botões para um look atual e descolado.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (65, 'SHORTS TRICOT SUMMER', 'shorts-tricot-summer', 'ROUPAS>SHORTS>SHORTS', 'casual,confort', 'O Shorts Tricot Summer é uma peça confortável sem perder o toque fashion.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (66, 'SHORTS TWEED NAVY', 'shorts-tweed-navy', 'ROUPAS>SHORTS>SHORTS', 'macio,cl', 'Tweed + Navy = Indispensável!  O Shorts Tweed Navy remete à um visual balneário chic.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (67, 'TOP CORTININHA FRU FRU', 'top-cortininha-fru-fru', 'ROUPAS>BEACHWEAR>BIQUINIS TOPS', 'animal print,estampado,casual,leve,moderno,elegante,preto,cor ', 'Cortininha é um clássico que ganha charme com detalhes como o fru fru e o acabamento em tassel que estão super em alta.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (68, 'TOP FULL ARGOLAS', 'top-full-argolas', 'ROUPAS>BEACHWEAR>BIQUINIS TOPS', 'estampado,liso,casual,moderno,elegante,pink,preto,verde ', 'A elegância te acompanha até a areia com o Top Full Argolas.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (69, 'TOP TORCIDO SUN KISS', 'top-torcido-sun-kiss', 'ROUPAS>BEACHWEAR>BIQUINIS TOPS', 'estampado,casual,moderno,elegante,preto,verde ', 'A elegância te acompanha até a areia com o Top Torcido Sun Kiss.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (70, 'TOP TRANSPASSE DUPLO', 'top-transpasse-duplo', 'ROUPAS>BEACHWEAR>BIQUINIS TOPS', 'estampado,casual,estampas,moderno,elegante,ajustado,navy,estampa,la', 'A elegância te acompanha até a areia com o Top Transpasse Duplo.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (71, 'VESTIDO ALCINHA CRUISE', 'vestido-alcinha-cruise', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'liso,macio,z', 'Perfeito para os dias mais quentes, o Vestido Alcinha Cruise tem um caimento delicioso. Combine com diferentes acessórios para um look único.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (72, 'VESTIDO POLY NAVAL', 'vestido-poly-naval', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'estampado,casual,z', 'A amarração em corda do Vestido Poly Naval evidencia a tendência Navy, hit da estação. Um detalhe único que confere charme e bossa à peça.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (73, 'VESTIDO SHIFT TRICOT', 'vestido-shift-tricot', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'justo,casual,bicolor,tricot,macio,amarelo,vermelho,marinho,navy,listrado,passeio,dia a dia,almo', 'A tendência Navy será um hit nessa estação! Aposte em listras horizontais para arrasar!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (74, 'VESTIDO TRAPÉZIO ILHÓS', 'vestido-trapezio-ilhos', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'balada,liso,macio,estampas,couro,moderno,preto,off-white,forro,passeio,al', 'O clássico ganha modernidade com os detalhes únicos do Vestido Trapézio Ilhós. Aposte em acessórios para dar um up na produção.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (75, 'CALCINHA FENDA COLOR', 'calcinha-fenda-color', 'ROUPAS>BEACHWEAR>BIQUINIS BOTTOMS', 'bicolor,macio,moderno,preto,coral,branco,vinho,forro,lycra,cool,biquini,praia,ver', 'Com a cara do verão, invista nos biquínis coloridos, cheio de estilo!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (76, 'VESTIDO REGATA PESPONTO', 'vestido-regata-pesponto', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'liso,moderno,palha,coral,reto,militar,bolsos,estruturado,dia a dia,bot', 'O militarismo mais uma vez presente nessa estação! Além da modelagem evasê e bolsos frontais, o VESTIDO REGATA PESPONTO tem recorte vertical , alongando a silhueta.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (77, 'VESTIDO MÉDIO DECOTE', 'vestido-medio-decote', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'macio,estampas,z', 'O Vestido Médio Decote é perfeito para dias de calor, as estampas tem toques vivos e contrastantes. Vai do escritório ao Happy Hour. Invista em acessórios para dar um up no seu look!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (78, 'CALÇA FLARE AMAL', 'calca-flare-amal', 'ROUPAS>CALÇAS>FLARE', 'sexy,lazer,z', 'Must-have, a calça flare é versátil e perfeita para compor looks descolados.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (79, 'SHORTS COTTON GROSS', 'shorts-cotton-gross', 'ROUPAS>SHORTS>SHORTS', 'cl', 'O Shorts Cotton gross é uma versão de um tweed leve para o verão.  Faz o estilo clássico e moderno ao mesmo tempo. Atemporal é uma peça que não pode faltar no seu closet!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (80, 'CALÇA RECORTES LEATHER', 'calca-recortes-leather', 'ROUPAS>CALÇAS>SKINNY', 'recortes,sexy,couro,z', 'A Calça Recortes Leather é perfeita para quem tem atitude. O modelo skinny somado ao leather compõe um look de personalidade.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (81, 'VESTIDO TRANÇADO ARGOLAS', 'vestido-trancado-argolas', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'marinho,amarra', 'O detalhe da frente do Vestido Traçado Argolas dá um toque fashion ao look. O corte evasê veste bem em todos os biotipos.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (82, 'VESTIDO LEATHER ILHÓS', 'vestido-leather-ilhos', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'noite,balada,justo,couro,ousado,moderno,preto,amarelo,cor ', 'E o couro continua em alta mesmo nas estações mais quentes. Sofisticado e descolado o vestido leather ilhós é o aliado perfeito para a balada. Arrase!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (83, 'VESTIDO ALCINHA DESERTO', 'vestido-alcinha-deserto', 'ROUPAS>VESTIDOS>VESTIDOS CURTOS', 'recortes,casual,longo,informal,preto,solto,coral,romantico,passeio,praia,ver', 'O Vestido alcinha deserto transita entre a praia e a cidade, o volume e a leveza dão um charme a mais. Invista em acessórios para dar um up no look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (84, 'SAIA SUEDE BOTÃO', 'saia-suede-botao', 'ROUPAS>SAIAS>SAIAS MIDI & MEDIAS', 'casual,lazer,macio,moderno,chic,feminino,coral,taupe,evas', 'A Saia Suede botão tem o comprimento perfeito para todas as ocasiões. Além disso o seu modelo evasê com botões frontais transforma seu look num retrô repaginado.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (85, 'SAIA RODADA LINHO', 'saia-rodada-linho', 'ROUPAS>SAIAS>SAIAS CURTAS', 'b', 'Feita com linho e viscose, um tecido leve e natural a Saia Rodada Linho é perfeita para os dias mais quentes! Invista em acessórios para dar um up ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (86, 'BLUSA LENÇO MATTE', 'blusa-lenco-matte', 'ROUPAS>BLUSAS>REGATAS', 'trabalho,macio,feminino,regata,workwear,la', 'Elegante e feminina, a Blusa Lenço Matte deixa qualquer look digno da Corte.  Com acabamento na barra tipo lenço e costura inglesa na parte interna, a regata garante sofisticação e perfeição ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (87, 'BATA VOIL VISCOSE', 'bata-voil-viscose', 'ROUPAS>BLUSAS>BLUSAS MANGA LONGA', 'transpar', 'A Bata Voil Viscose é perfeita para os dias quentes. Estilosa as mangas são de um tecido leve e fluído que dão um toque boho ao look, mantendo o frescor e o conforto.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (88, 'CAMISA BOYFRIEND CREPE', 'camisa-boyfriend-crepe', 'ROUPAS>BLUSAS>CAMISAS', 'trabalho,lazer,gola,workwear,reto,shopping,militar,cool,bambu,descolado,bolsos,praia,almo', 'Perfeita para os dias mais quentes no escritório, a Camisa Boyfriend crepe é essencial no guarda roupa da mulher moderna. Invista em acessórios para dar um up ao look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (89, 'CALÇA CULOTTE POCKET', 'calca-culotte-pocket', 'ROUPAS>CALÇAS>RETA', 'lazer,moderno,palha,sofisticado,reto,shopping,militar,passeio,bolsos,fashion,jantar,estiloso,almo', 'Tendência no Street Style, as calças culottes, serão o hit desta temporada. Um belo salto e uma cropped e você está pronta para arrasar!');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (90, 'CALÇA PANTALONA LODGE', 'calca-pantalona-lodge', 'ROUPAS>CALÇAS>RETA', 'macio,estampas,z', 'Conforto aliado com toque fashion das estampas, a Calça Pantalona Lodge é a pedida perfeita para sair da rotina nos dias quentes.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (91, 'CALÇA SKINNY CLASSIC', 'calca-skinny-classic', 'ROUPAS>CALÇAS>SKINNY', 'estampas,cl', 'Uma calça com corte moderno e confortável para compor looks sofisticados e elegantes. Combine com uma sapatilha para um passeio ou um scarpin para o escritório.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (92, 'BERMUDA LEATHER TRESSÊ', 'bermuda-leather-tresse', 'ROUPAS>SHORTS>BERMUDAS', 'balada,sexy,lazer,couro,moderno,textura,bot', 'Uma variação da calça pantacourt, hit do verão, é a bermuda que segue a mesma base de modelagem e é ideal para dias mais quentes');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (93, 'SHORTS SAIA MILENE', 'shorts-saia-milene', 'ROUPAS>SHORTS>SHORTS', 'estampado,lazer,estampas,moderno,feminino,evas', 'O Shorts Saia Milene é uma peça versátil e confortável que alia a praticidade do shorts e a feminilidade da saia.Combine com uma T-Shirt ou uma camisa leve para dar um up no look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (94, 'SHORTS UTILITARY', 'shorts-utilitary', 'ROUPAS>SHORTS>SHORTS', 'casual,informal,texturizado,curto,moderno,off-white,militar,safari,poliester,passeio,bolsos,praia,bot', 'A trend militar está em alta, com o shorts utilitary você estará de acordo com as mais hot das tendências. Invista em acessórios para complementar o look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (95, 'REGATA TRICOT BASIC', 'regata-tricot-basic', 'ROUPAS>BLUSAS>REGATAS', 'trabalho,tricot,moderno,feminino,regata,preto,viscose,natural,off-white,cool,passeio,ver', 'A Regata Tricot Basic tem o toque suave, é leve e fluída,100% em viscose, perfeita para os dias mais quentes. Invista em acessórios para dar um up no look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (96, 'REGATA TRICOT GREG', 'regata-tricot-greg', 'ROUPAS>BLUSAS>REGATAS', 'sexy,macio,moderno,preto,festa,azul,coral,sofisticado,passeio,praia,feminina,night out,marsala,essentials,frente ', 'A Regata Tricot Greg é perfeita para dias quentes no escritório, a viscose da sua composição garante a suavidade e a leveza.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (97, 'REGATA TRICOT MULTI', 'regata-tricot-multi', 'ROUPAS>BLUSAS>REGATAS', 'casual,tricot,macio,moderno,textura,regata,palha,shopping,off-white,militar,cool,passeio,praia,almo', 'A Regata Tricot Multi tem o toque suave, é leve e fluído perfeito para os dias mais quentes. Invista em acessórios para dar um up no look.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (98, 'TOP TRICOT RAYON', 'top-tricot-rayon', 'ROUPAS>SUETERS & CARDIGANS>COLETES', 'justo,macio,cl', 'Top Tricot Rayon é perfeito para dias quentes no escritório, a viscose da sua composição garante a suavidade e a leveza.');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (99, 'ÓCULOS DE SOL GOLDEN', 'oculos-de-sol-golden', 'ACESSORIOS>OCULOS DE SOL>', 'cl', 'Os óculos são acessórios indispensáveis no dia-a-dia. Escolha o modelo e o estilo que mais gosta e aproveite');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `categories`, `description`) VALUES (100, 'BOLSA ENVELOPE BASIC', 'bolsa-envelope-basic', 'BOLSAS>BOLSAS MINI>', 'trabalho,lazer,moderno,chique,quadrado,sofisticado,caramelo,al', 'Moderna e cheia de detalhes, a Bolsa Envelope Basic é prática para o dia a dia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `variants`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (1, 1, 'Branca', 'qwerasdzxc', 15.9, NULL, 50, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (2, 1, 'Preta', 'qwerasdfzxc1', 15.9, NULL, 60, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (3, 1, 'Azul', 'qwerasdfzxc2', 15.9, NULL, 54, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (4, 1, 'Rosa', 'qwerasdfzxc3', 10, 15.9, 85, 0);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (5, 2, 'Azul', 'qwerasdfzxc4', 70, NULL, 48, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (6, 2, 'Preta', 'qwerasdfzxc5', 70, NULL, 52, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (7, 2, 'Rosa', 'qwerasdfzxc6', 70, NULL, 52, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (8, 3, 'Rosa', 'qwerasdfzxc7', 100, 150, 42, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (9, 3, 'Verde', 'qwerasdfzxc8', 100, 150, 12, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (10, 3, 'Preto', 'qwerasdfzxc9', 100, 150, 83, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (11, 4, 'Preto', 'qwerasdfzxc10', 250, 400, 40, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (12, 4, 'Vermelho', 'qwerasdfzxc11', 250, 400, 66, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (13, 5, 'Azul', 'qwerasdfzxc12', 79.9, NULL, 49, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (14, 6, 'Prata', 'qwerasdfzxc13', 59.9, NULL, 78, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (15, 6, 'Dourado', 'qwerasdfzxc14', 59.9, NULL, 81, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (16, 6, 'Preto', 'qwerasdfzxc15', 59.9, NULL, 24, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (17, 6, 'Verde', 'qwerasdfzxc16', 59.9, NULL, 48, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (18, 7, 'Couro sintético', 'qwerasdfzxc17', 160, NULL, 54, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (19, 7, 'Couro', 'qwerasdfzxc18', 200, NULL, 72, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (20, 7, 'Couro ecológico', 'qwerasdfzxc19', 150, 180, 39, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (21, 8, 'Preto', 'qwerasdfzxc20', 45, NULL, 98, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (22, 8, 'Verde', 'qwerasdfzxc21', 45, NULL, 26, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (23, 8, 'Vermelho', 'qwerasdfzxc22', 45, NULL, 69, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (24, 8, 'Azul', 'qwerasdfzxc23', 45, NULL, 24, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (25, 8, 'Prata', 'qwerasdfzxc24', 45, NULL, 52, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (26, 8, 'Dourado', 'qwerasdfzxc25', 45, NULL, 0, 0);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (27, 8, 'Rosa', 'qwerasdfzxc26', 45, NULL, 57, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (28, 9, 'Azul', 'qwerasdfzxc27', 130, 160, 41, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (29, 9, 'Prata', 'qwerasdfzxc28', 130, 160, 67, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (30, 9, 'Dourado', 'qwerasdfzxc29', 130, 160, 34, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (31, 9, 'Rosa', 'qwerasdfzxc30', 130, 160, 69, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (32, 17, 'Amarelo', 'qwerasdfzxc31', 136, NULL, 34, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (33, 28, 'Verde', 'qwerasdfzxc32', 75, NULL, 73, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (34, 42, 'Preto', 'qwerasdfzxc33', 154, NULL, 87, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (35, 61, 'Preto', 'qwerasdfzxc34', 99, NULL, 4, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (36, 14, 'Vermelho', 'qwerasdfzxc35', 86, NULL, 89, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (37, 28, 'Branco', 'qwerasdfzxc36', 154, NULL, 41, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (38, 62, 'Amarelo', 'qwerasdfzxc37', 20, NULL, 199, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (39, 68, 'Branco', 'qwerasdfzxc38', 67, NULL, 61, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (40, 62, 'Vermelho', 'qwerasdfzxc39', 184, NULL, 62, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (41, 57, 'Amarelo', 'qwerasdfzxc40', 117, NULL, 183, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (42, 59, 'Preto', 'qwerasdfzxc41', 76, NULL, 179, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (43, 69, 'Verde', 'qwerasdfzxc42', 126, NULL, 59, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (44, 87, 'Branco', 'qwerasdfzxc43', 44, NULL, 155, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (45, 78, 'Vermelho', 'qwerasdfzxc44', 55, NULL, 137, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (46, 44, 'Amarelo', 'qwerasdfzxc45', 109, NULL, 197, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (47, 20, 'Amarelo', 'qwerasdfzxc46', 188, NULL, 97, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (48, 98, 'Verde', 'qwerasdfzxc47', 171, NULL, 149, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (49, 64, 'Vermelho', 'qwerasdfzxc48', 167, NULL, 192, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (50, 99, 'Amarelo', 'qwerasdfzxc49', 47, NULL, 167, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (51, 14, 'Amarelo', 'qwerasdfzxc50', 174, NULL, 194, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (52, 88, 'Branco', 'qwerasdfzxc51', 155, NULL, 74, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (53, 33, 'Preto', 'qwerasdfzxc52', 81, NULL, 153, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (54, 73, 'Amarelo', 'qwerasdfzxc53', 199, NULL, 125, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (55, 47, 'Preto', 'qwerasdfzxc54', 85, NULL, 160, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (56, 56, 'Branco', 'qwerasdfzxc55', 177, NULL, 76, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (57, 24, 'Branco', 'qwerasdfzxc56', 82, NULL, 169, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (58, 76, 'Verde', 'qwerasdfzxc57', 22, NULL, 62, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (59, 24, 'Preto', 'qwerasdfzxc58', 49, NULL, 182, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (60, 17, 'Preto', 'qwerasdfzxc59', 71, NULL, 142, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (61, 88, 'Amarelo', 'qwerasdfzxc60', 148, NULL, 81, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (62, 28, 'Branco', 'qwerasdfzxc61', 154, NULL, 6, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (63, 25, 'Amarelo', 'qwerasdfzxc62', 95, NULL, 79, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (64, 57, 'Verde', 'qwerasdfzxc63', 168, NULL, 36, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (65, 32, 'Vermelho', 'qwerasdfzxc64', 78, NULL, 100, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (66, 23, 'Branco', 'qwerasdfzxc65', 162, NULL, 190, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (67, 96, 'Branco', 'qwerasdfzxc66', 188, NULL, 59, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (68, 68, 'Verde', 'qwerasdfzxc67', 155, NULL, 44, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (69, 19, 'Preto', 'qwerasdfzxc68', 121, NULL, 112, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (70, 98, 'Vermelho', 'qwerasdfzxc69', 71, NULL, 89, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (71, 28, 'Verde', 'qwerasdfzxc70', 105, NULL, 160, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (72, 94, 'Preto', 'qwerasdfzxc71', 25, NULL, 54, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (73, 12, 'Vermelho', 'qwerasdfzxc72', 185, NULL, 91, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (74, 75, 'Verde', 'qwerasdfzxc73', 71, NULL, 72, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (75, 96, 'Preto', 'qwerasdfzxc74', 36, NULL, 4, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (76, 95, 'Amarelo', 'qwerasdfzxc75', 36, NULL, 62, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (77, 76, 'Amarelo', 'qwerasdfzxc76', 105, NULL, 143, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (78, 17, 'Verde', 'qwerasdfzxc77', 125, NULL, 182, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (79, 69, 'Preto', 'qwerasdfzxc78', 139, NULL, 53, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (80, 86, 'Amarelo', 'qwerasdfzxc79', 114, NULL, 141, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (81, 31, 'Amarelo', 'qwerasdfzxc80', 118, NULL, 78, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (82, 10, 'Vermelho', 'qwerasdfzxc81', 99, NULL, 179, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (83, 41, 'Branco', 'qwerasdfzxc82', 41, NULL, 78, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (84, 44, 'Vermelho', 'qwerasdfzxc83', 167, NULL, 151, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (85, 62, 'Vermelho', 'qwerasdfzxc84', 136, NULL, 2, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (86, 91, 'Branco', 'qwerasdfzxc85', 79, NULL, 58, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (87, 45, 'Branco', 'qwerasdfzxc86', 176, NULL, 172, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (88, 93, 'Amarelo', 'qwerasdfzxc87', 65, NULL, 69, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (89, 71, 'Verde', 'qwerasdfzxc88', 137, NULL, 128, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (90, 67, 'Vermelho', 'qwerasdfzxc89', 47, NULL, 91, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (91, 70, 'Amarelo', 'qwerasdfzxc90', 179, NULL, 55, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (92, 87, 'Preto', 'qwerasdfzxc91', 171, NULL, 140, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (93, 13, 'Preto', 'qwerasdfzxc92', 131, NULL, 10, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (94, 71, 'Preto', 'qwerasdfzxc93', 66, NULL, 184, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (95, 66, 'Branco', 'qwerasdfzxc94', 199, NULL, 19, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (96, 56, 'Branco', 'qwerasdfzxc95', 125, NULL, 96, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (97, 97, 'Verde', 'qwerasdfzxc96', 35, NULL, 55, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (98, 74, 'Verde', 'qwerasdfzxc97', 89, NULL, 77, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (99, 66, 'Branco', 'qwerasdfzxc98', 111, NULL, 61, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (100, 78, 'Branco', 'qwerasdfzxc99', 118, NULL, 75, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (101, 54, 'Amarelo', 'qwerasdfzxc100', 74, NULL, 107, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (102, 30, 'Verde', 'qwerasdfzxc101', 150, NULL, 91, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (103, 17, 'Amarelo', 'qwerasdfzxc102', 67, NULL, 67, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (104, 59, 'Branco', 'qwerasdfzxc103', 141, NULL, 7, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (105, 46, 'Vermelho', 'qwerasdfzxc104', 170, NULL, 156, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (106, 87, 'Amarelo', 'qwerasdfzxc105', 85, NULL, 110, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (107, 41, 'Preto', 'qwerasdfzxc106', 128, NULL, 150, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (108, 95, 'Amarelo', 'qwerasdfzxc107', 41, NULL, 26, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (109, 67, 'Preto', 'qwerasdfzxc108', 118, NULL, 94, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (110, 88, 'Preto', 'qwerasdfzxc109', 22, NULL, 167, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (111, 59, 'Verde', 'qwerasdfzxc110', 110, NULL, 32, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (112, 73, 'Branco', 'qwerasdfzxc111', 85, NULL, 126, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (113, 76, 'Amarelo', 'qwerasdfzxc112', 155, NULL, 84, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (114, 81, 'Verde', 'qwerasdfzxc113', 187, NULL, 23, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (115, 22, 'Vermelho', 'qwerasdfzxc114', 88, NULL, 23, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (116, 96, 'Amarelo', 'qwerasdfzxc115', 128, NULL, 103, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (117, 70, 'Branco', 'qwerasdfzxc116', 126, NULL, 119, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (118, 88, 'Amarelo', 'qwerasdfzxc117', 43, NULL, 65, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (119, 40, 'Amarelo', 'qwerasdfzxc118', 126, NULL, 97, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (120, 49, 'Verde', 'qwerasdfzxc119', 163, NULL, 141, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (121, 24, 'Verde', 'qwerasdfzxc120', 97, NULL, 158, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (122, 35, 'Verde', 'qwerasdfzxc121', 94, NULL, 151, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (123, 18, 'Verde', 'qwerasdfzxc122', 139, NULL, 142, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (124, 62, 'Verde', 'qwerasdfzxc123', 67, NULL, 93, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (125, 74, 'Vermelho', 'qwerasdfzxc124', 44, NULL, 32, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (126, 94, 'Branco', 'qwerasdfzxc125', 177, NULL, 15, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (127, 30, 'Verde', 'qwerasdfzxc126', 158, NULL, 39, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (128, 79, 'Amarelo', 'qwerasdfzxc127', 164, NULL, 107, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (129, 73, 'Preto', 'qwerasdfzxc128', 107, NULL, 28, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (130, 81, 'Vermelho', 'qwerasdfzxc129', 126, NULL, 31, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (131, 66, 'Preto', 'qwerasdfzxc130', 158, NULL, 121, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (132, 50, 'Branco', 'qwerasdfzxc131', 60, NULL, 166, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (133, 93, 'Preto', 'qwerasdfzxc132', 20, NULL, 71, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (134, 82, 'Vermelho', 'qwerasdfzxc133', 128, NULL, 142, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (135, 70, 'Branco', 'qwerasdfzxc134', 63, NULL, 87, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (136, 12, 'Verde', 'qwerasdfzxc135', 155, NULL, 189, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (137, 15, 'Verde', 'qwerasdfzxc136', 160, NULL, 100, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (138, 17, 'Amarelo', 'qwerasdfzxc137', 116, NULL, 36, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (139, 63, 'Verde', 'qwerasdfzxc138', 153, NULL, 170, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (140, 29, 'Branco', 'qwerasdfzxc139', 108, NULL, 152, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (141, 27, 'Branco', 'qwerasdfzxc140', 91, NULL, 178, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (142, 76, 'Vermelho', 'qwerasdfzxc141', 200, NULL, 158, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (143, 48, 'Preto', 'qwerasdfzxc142', 86, NULL, 179, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (144, 88, 'Verde', 'qwerasdfzxc143', 130, NULL, 164, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (145, 50, 'Vermelho', 'qwerasdfzxc144', 99, NULL, 142, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (146, 79, 'Vermelho', 'qwerasdfzxc145', 109, NULL, 186, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (147, 54, 'Verde', 'qwerasdfzxc146', 99, NULL, 152, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (148, 62, 'Verde', 'qwerasdfzxc147', 143, NULL, 156, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (149, 49, 'Vermelho', 'qwerasdfzxc148', 90, NULL, 109, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (150, 45, 'Preto', 'qwerasdfzxc149', 130, NULL, 59, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (151, 26, 'Vermelho', 'qwerasdfzxc150', 103, NULL, 146, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (152, 25, 'Branco', 'qwerasdfzxc151', 40, NULL, 185, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (153, 86, 'Vermelho', 'qwerasdfzxc152', 144, NULL, 155, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (154, 51, 'Verde', 'qwerasdfzxc153', 38, NULL, 128, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (155, 11, 'Branco', 'qwerasdfzxc154', 103, NULL, 137, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (156, 24, 'Branco', 'qwerasdfzxc155', 72, NULL, 93, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (157, 76, 'Verde', 'qwerasdfzxc156', 53, NULL, 166, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (158, 76, 'Branco', 'qwerasdfzxc157', 37, NULL, 71, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (159, 35, 'Amarelo', 'qwerasdfzxc158', 156, NULL, 1, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (160, 100, 'Branco', 'qwerasdfzxc159', 97, NULL, 117, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (161, 98, 'Vermelho', 'qwerasdfzxc160', 154, NULL, 61, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (162, 99, 'Amarelo', 'qwerasdfzxc161', 102, NULL, 40, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (163, 89, 'Preto', 'qwerasdfzxc162', 178, NULL, 124, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (164, 16, 'Amarelo', 'qwerasdfzxc163', 51, NULL, 20, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (165, 100, 'Amarelo', 'qwerasdfzxc164', 37, NULL, 175, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (166, 61, 'Vermelho', 'qwerasdfzxc165', 96, NULL, 174, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (167, 14, 'Branco', 'qwerasdfzxc166', 80, NULL, 143, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (168, 35, 'Verde', 'qwerasdfzxc167', 175, NULL, 32, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (169, 84, 'Amarelo', 'qwerasdfzxc168', 101, NULL, 175, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (170, 98, 'Vermelho', 'qwerasdfzxc169', 198, NULL, 120, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (171, 77, 'Preto', 'qwerasdfzxc170', 70, NULL, 95, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (172, 64, 'Amarelo', 'qwerasdfzxc171', 119, NULL, 151, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (173, 85, 'Preto', 'qwerasdfzxc172', 103, NULL, 59, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (174, 17, 'Amarelo', 'qwerasdfzxc173', 89, NULL, 172, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (175, 32, 'Amarelo', 'qwerasdfzxc174', 186, NULL, 148, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (176, 20, 'Branco', 'qwerasdfzxc175', 57, NULL, 87, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (177, 42, 'Amarelo', 'qwerasdfzxc176', 81, NULL, 98, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (178, 58, 'Preto', 'qwerasdfzxc177', 48, NULL, 136, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (179, 70, 'Amarelo', 'qwerasdfzxc178', 141, NULL, 192, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (180, 36, 'Preto', 'qwerasdfzxc179', 168, NULL, 118, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (181, 70, 'Branco', 'qwerasdfzxc180', 180, NULL, 136, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (182, 53, 'Branco', 'qwerasdfzxc181', 70, NULL, 122, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (183, 57, 'Vermelho', 'qwerasdfzxc182', 164, NULL, 94, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (184, 95, 'Vermelho', 'qwerasdfzxc183', 194, NULL, 68, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (185, 97, 'Verde', 'qwerasdfzxc184', 56, NULL, 133, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (186, 11, 'Verde', 'qwerasdfzxc185', 69, NULL, 197, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (187, 43, 'Branco', 'qwerasdfzxc186', 29, NULL, 56, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (188, 63, 'Preto', 'qwerasdfzxc187', 185, NULL, 86, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (189, 65, 'Preto', 'qwerasdfzxc188', 111, NULL, 171, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (190, 49, 'Preto', 'qwerasdfzxc189', 124, NULL, 186, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (191, 100, 'Preto', 'qwerasdfzxc190', 96, NULL, 159, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (192, 73, 'Branco', 'qwerasdfzxc191', 117, NULL, 132, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (193, 74, 'Verde', 'qwerasdfzxc192', 113, NULL, 136, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (194, 21, 'Vermelho', 'qwerasdfzxc193', 38, NULL, 120, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (195, 24, 'Preto', 'qwerasdfzxc194', 182, NULL, 55, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (196, 60, 'Verde', 'qwerasdfzxc195', 25, NULL, 159, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (197, 37, 'Preto', 'qwerasdfzxc196', 48, NULL, 31, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (198, 19, 'Branco', 'qwerasdfzxc197', 173, NULL, 26, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (199, 34, 'Vermelho', 'qwerasdfzxc198', 71, NULL, 134, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (200, 18, 'Verde', 'qwerasdfzxc199', 26, NULL, 113, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (201, 45, 'Amarelo', 'qwerasdfzxc200', 57, NULL, 3, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (202, 72, 'Branco', 'qwerasdfzxc201', 199, NULL, 45, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (203, 61, 'Branco', 'qwerasdfzxc202', 164, NULL, 107, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (204, 46, 'Vermelho', 'qwerasdfzxc203', 180, NULL, 199, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (205, 84, 'Verde', 'qwerasdfzxc204', 148, NULL, 66, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (206, 92, 'Vermelho', 'qwerasdfzxc205', 100, NULL, 110, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (207, 73, 'Preto', 'qwerasdfzxc206', 66, NULL, 129, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (208, 32, 'Preto', 'qwerasdfzxc207', 84, NULL, 41, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (209, 96, 'Vermelho', 'qwerasdfzxc208', 127, NULL, 28, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (210, 86, 'Branco', 'qwerasdfzxc209', 146, NULL, 181, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (211, 77, 'Vermelho', 'qwerasdfzxc210', 191, NULL, 130, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (212, 14, 'Vermelho', 'qwerasdfzxc211', 190, NULL, 4, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (213, 58, 'Preto', 'qwerasdfzxc212', 182, NULL, 155, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (214, 29, 'Preto', 'qwerasdfzxc213', 111, NULL, 136, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (215, 45, 'Vermelho', 'qwerasdfzxc214', 94, NULL, 172, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (216, 58, 'Amarelo', 'qwerasdfzxc215', 139, NULL, 129, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (217, 93, 'Verde', 'qwerasdfzxc216', 119, NULL, 2, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (218, 83, 'Amarelo', 'qwerasdfzxc217', 53, NULL, 32, 1);
INSERT INTO `variants` (`id`, `product_id`, `name`, `slug`, `price`, `price_old`, `quantity`, `active`) VALUES (219, 38, 'Verde', 'qwerasdfzxc218', 64, NULL, 153, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `images`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (1, 1, 'assets/image1.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (2, 2, 'assets/image2.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (3, 3, 'assets/image3.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (4, 4, 'assets/image4.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (5, 5, 'assets/image5.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (6, 6, 'assets/image6.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (7, 7, 'assets/image7.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (8, 8, 'assets/image8.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (9, 9, 'assets/image9.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (10, 10, 'assets/image10.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (11, 11, 'assets/image11.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (12, 12, 'assets/image12.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (13, 13, 'assets/image13.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (14, 14, 'assets/image14.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (15, 15, 'assets/image15.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (16, 16, 'assets/image16.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (17, 17, 'assets/image17.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (18, 18, 'assets/image18.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (19, 19, 'assets/image19.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (20, 20, 'assets/image20.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (21, 21, 'assets/image21.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (22, 22, 'assets/image22.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (23, 23, 'assets/image23.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (24, 24, 'assets/image24.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (25, 25, 'assets/image25.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (26, 26, 'assets/image26.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (27, 27, 'assets/image27.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (28, 28, 'assets/image28.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (29, 29, 'assets/image29.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (30, 30, 'assets/image30.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (31, 31, 'assets/image31.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (32, 32, 'assets/image32.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (33, 33, 'assets/image33.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (34, 34, 'assets/image34.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (35, 35, 'assets/image35.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (36, 36, 'assets/image36.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (37, 37, 'assets/image37.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (38, 38, 'assets/image38.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (39, 39, 'assets/image39.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (40, 40, 'assets/image40.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (41, 41, 'assets/image41.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (42, 42, 'assets/image42.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (43, 43, 'assets/image43.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (44, 44, 'assets/image44.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (45, 45, 'assets/image45.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (46, 46, 'assets/image46.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (47, 47, 'assets/image47.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (48, 48, 'assets/image48.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (49, 49, 'assets/image49.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (50, 50, 'assets/image50.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (51, 51, 'assets/image51.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (52, 52, 'assets/image52.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (53, 53, 'assets/image53.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (54, 54, 'assets/image54.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (55, 55, 'assets/image55.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (56, 56, 'assets/image56.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (57, 57, 'assets/image57.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (58, 58, 'assets/image58.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (59, 59, 'assets/image59.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (60, 60, 'assets/image60.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (61, 61, 'assets/image61.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (62, 62, 'assets/image62.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (63, 63, 'assets/image63.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (64, 64, 'assets/image64.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (65, 65, 'assets/image65.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (66, 66, 'assets/image66.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (67, 67, 'assets/image67.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (68, 68, 'assets/image68.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (69, 69, 'assets/image69.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (70, 70, 'assets/image70.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (71, 71, 'assets/image71.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (72, 72, 'assets/image72.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (73, 73, 'assets/image73.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (74, 74, 'assets/image74.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (75, 75, 'assets/image75.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (76, 76, 'assets/image76.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (77, 77, 'assets/image77.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (78, 78, 'assets/image78.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (79, 79, 'assets/image79.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (80, 80, 'assets/image80.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (81, 81, 'assets/image81.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (82, 82, 'assets/image82.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (83, 83, 'assets/image83.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (84, 84, 'assets/image84.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (85, 85, 'assets/image85.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (86, 86, 'assets/image86.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (87, 87, 'assets/image87.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (88, 88, 'assets/image88.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (89, 89, 'assets/image89.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (90, 90, 'assets/image90.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (91, 91, 'assets/image91.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (92, 92, 'assets/image92.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (93, 93, 'assets/image93.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (94, 94, 'assets/image94.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (95, 95, 'assets/image95.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (96, 96, 'assets/image96.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (97, 97, 'assets/image97.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (98, 98, 'assets/image98.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (99, 99, 'assets/image99.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (100, 100, 'assets/image100.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (101, 101, 'assets/image101.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (102, 102, 'assets/image102.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (103, 103, 'assets/image103.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (104, 104, 'assets/image104.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (105, 105, 'assets/image105.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (106, 106, 'assets/image106.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (107, 107, 'assets/image107.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (108, 108, 'assets/image108.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (109, 109, 'assets/image109.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (110, 110, 'assets/image110.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (111, 111, 'assets/image111.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (112, 112, 'assets/image112.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (113, 113, 'assets/image113.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (114, 114, 'assets/image114.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (115, 115, 'assets/image115.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (116, 116, 'assets/image116.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (117, 117, 'assets/image117.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (118, 118, 'assets/image118.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (119, 119, 'assets/image119.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (120, 120, 'assets/image120.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (121, 121, 'assets/image121.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (122, 122, 'assets/image122.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (123, 123, 'assets/image123.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (124, 124, 'assets/image124.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (125, 125, 'assets/image125.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (126, 126, 'assets/image126.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (127, 127, 'assets/image127.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (128, 128, 'assets/image128.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (129, 129, 'assets/image129.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (130, 130, 'assets/image130.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (131, 131, 'assets/image131.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (132, 132, 'assets/image132.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (133, 133, 'assets/image133.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (134, 134, 'assets/image134.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (135, 135, 'assets/image135.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (136, 136, 'assets/image136.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (137, 137, 'assets/image137.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (138, 138, 'assets/image138.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (139, 139, 'assets/image139.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (140, 140, 'assets/image140.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (141, 141, 'assets/image141.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (142, 142, 'assets/image142.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (143, 143, 'assets/image143.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (144, 144, 'assets/image144.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (145, 145, 'assets/image145.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (146, 146, 'assets/image146.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (147, 147, 'assets/image147.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (148, 148, 'assets/image148.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (149, 149, 'assets/image149.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (150, 150, 'assets/image150.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (151, 151, 'assets/image151.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (152, 152, 'assets/image152.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (153, 153, 'assets/image153.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (154, 154, 'assets/image154.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (155, 155, 'assets/image155.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (156, 156, 'assets/image156.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (157, 157, 'assets/image157.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (158, 158, 'assets/image158.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (159, 159, 'assets/image159.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (160, 160, 'assets/image160.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (161, 161, 'assets/image161.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (162, 162, 'assets/image162.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (163, 163, 'assets/image163.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (164, 164, 'assets/image164.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (165, 165, 'assets/image165.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (166, 166, 'assets/image166.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (167, 167, 'assets/image167.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (168, 168, 'assets/image168.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (169, 169, 'assets/image169.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (170, 170, 'assets/image170.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (171, 171, 'assets/image171.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (172, 172, 'assets/image172.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (173, 173, 'assets/image173.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (174, 174, 'assets/image174.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (175, 175, 'assets/image175.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (176, 176, 'assets/image176.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (177, 177, 'assets/image177.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (178, 178, 'assets/image178.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (179, 179, 'assets/image179.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (180, 180, 'assets/image180.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (181, 181, 'assets/image181.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (182, 182, 'assets/image182.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (183, 183, 'assets/image183.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (184, 184, 'assets/image184.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (185, 185, 'assets/image185.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (186, 186, 'assets/image186.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (187, 187, 'assets/image187.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (188, 188, 'assets/image188.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (189, 189, 'assets/image189.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (190, 190, 'assets/image190.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (191, 191, 'assets/image191.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (192, 192, 'assets/image192.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (193, 193, 'assets/image193.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (194, 194, 'assets/image194.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (195, 195, 'assets/image195.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (196, 196, 'assets/image196.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (197, 197, 'assets/image197.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (198, 198, 'assets/image198.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (199, 199, 'assets/image199.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (200, 200, 'assets/image200.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (201, 201, 'assets/image201.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (202, 202, 'assets/image202.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (203, 203, 'assets/image203.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (204, 204, 'assets/image204.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (205, 205, 'assets/image205.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (206, 206, 'assets/image206.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (207, 207, 'assets/image207.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (208, 208, 'assets/image208.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (209, 209, 'assets/image209.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (210, 210, 'assets/image210.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (211, 211, 'assets/image211.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (212, 212, 'assets/image212.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (213, 213, 'assets/image213.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (214, 214, 'assets/image214.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (215, 215, 'assets/image215.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (216, 216, 'assets/image216.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (217, 217, 'assets/image217.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (218, 218, 'assets/image218.jpg');
INSERT INTO `images` (`id`, `variant_id`, `url`) VALUES (219, 219, 'assets/image219.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `status`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `status` (`id`, `status`) VALUES (1, 'Aguardando Pagamento');
INSERT INTO `status` (`id`, `status`) VALUES (2, 'Cancelado');
INSERT INTO `status` (`id`, `status`) VALUES (3, 'Finalizado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `orders`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (1, 1, 1, '2016-12-25 15:15:15', '2016-12-25 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (2, 2, 1, '2016-12-27 15:15:15', '2016-12-28 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (3, 3, 1, '2016-12-27 15:15:15', '2016-12-28 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (4, 1, 2, '2016-12-28 15:15:15', '2016-12-29 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (5, 2, 2, '2016-12-29 15:15:15', '2016-12-30 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (6, 3, 2, '2016-12-30 15:15:15', '2016-12-31 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (7, 1, 3, '2016-12-31 15:15:15', '2017-01-01 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (8, 2, 3, '2017-01-01 15:15:15', '2017-01-02 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (9, 3, 3, '2017-01-02 15:15:15', '2017-01-03 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (10, 1, 1, '2017-01-03 15:15:15', '2017-01-04 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (11, 2, 1, '2017-01-04 15:15:15', '2017-01-05 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (12, 3, 1, '2017-01-05 15:15:15', '2017-01-06 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (13, 1, 3, '2017-01-06 15:15:15', '2017-01-07 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (14, 2, 3, '2017-01-07 15:15:15', '2017-01-08 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (15, 3, 3, '2017-01-08 15:15:15', '2017-01-09 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (16, 1, 2, '2017-01-09 15:15:15', '2017-01-10 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (17, 2, 2, '2017-01-10 15:15:15', '2017-01-11 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (18, 3, 2, '2017-01-11 15:15:15', '2017-01-12 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (19, 1, 1, '2017-01-12 15:15:15', '2017-01-13 15:15:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created`, `updated`) VALUES (20, 2, 2, '2017-01-13 15:15:15', '2017-01-14 15:15:15');

COMMIT;


-- -----------------------------------------------------
-- Data for table `order_items`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (1, 2, 16, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (2, 17, 11, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (3, 5, 20, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (4, 5, 5, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (5, 3, 12, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (6, 12, 16, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (7, 9, 24, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (8, 13, 10, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (9, 5, 32, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (10, 1, 5, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (11, 15, 13, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (12, 17, 8, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (13, 13, 18, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (14, 20, 3, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (15, 14, 29, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (16, 12, 25, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (17, 18, 12, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (18, 5, 22, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (19, 1, 2, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (20, 16, 7, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (21, 19, 26, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (22, 8, 31, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (23, 6, 30, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (24, 5, 20, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (25, 4, 21, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (26, 3, 4, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (27, 20, 26, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (28, 7, 3, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (29, 8, 32, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (30, 10, 3, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (31, 4, 23, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (32, 15, 20, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (33, 13, 4, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (34, 2, 27, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (35, 12, 23, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (36, 14, 21, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (37, 7, 12, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (38, 15, 22, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (39, 17, 17, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (40, 5, 30, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (41, 8, 7, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (42, 16, 3, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (43, 10, 29, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (44, 9, 14, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (45, 1, 19, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (46, 12, 9, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (47, 16, 16, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (48, 13, 23, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (49, 12, 1, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (50, 1, 27, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (51, 10, 25, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (52, 13, 23, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (53, 1, 2, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (54, 5, 19, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (55, 19, 3, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (56, 19, 31, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (57, 18, 24, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (58, 10, 17, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (59, 8, 8, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (60, 5, 18, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (61, 1, 6, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (62, 10, 29, 3);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (63, 11, 29, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (64, 14, 22, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (65, 1, 29, 2);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (66, 3, 21, 1);
INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`) VALUES (67, 5, 32, 3);

COMMIT;

