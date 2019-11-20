INSERT INTO categoria (id_categoria, nome_categoria)
values (s_categoria.nextval, 'xis');
INSERT INTO categoria (id_categoria, nome_categoria)
values (s_categoria.nextval, 'dog');
INSERT INTO categoria (id_categoria, nome_categoria)
values (s_categoria.nextval, 'pizza');

INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'jonas@email.com', '51-8780000', 'Jonas');
INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'marcus@email.com','51-1230000',  'Marcus');
INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'cesar@email.com','51-5420000',  'Cesar');
INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'roberto@email.com', '51-9780000', 'Roberto');
INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'juliana@email.com','51-7230000',  'Juliana');
INSERT INTO cliente (id_cliente, email, telefone, nome)
values (s_cliente.nextval, 'camila@email.com','51-5320000',  'Camila');

INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 30, to_date('01/11/2019 22:30','dd/mm/yyyy hh24:mi'), 100);
INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 15, to_date('02/11/2019 22:30','dd/mm/yyyy hh24:mi'), 101);
INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 20, to_date('09/11/2019 21:30','dd/mm/yyyy hh24:mi'), 102);
INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 30, to_date('08/11/2019 22:30','dd/mm/yyyy hh24:mi'), 103);
INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 15, to_date('12/11/2019 22:30','dd/mm/yyyy hh24:mi'), 104);
INSERT INTO pedido (id_pedido, tempo_pedido, data, cliente_id_cliente)
values (s_pedido.nextval, 20, to_date('11/11/2019 21:20','dd/mm/yyyy hh24:mi'), 105);

INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 50, 50, 200);
INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 100, 100, 201);
INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 50, 50, 202);
INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 100, 50, 203);
INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 50, 30, 204);
INSERT INTO pagamento(id_pagamento, dinheiro_pago, valor_final, pedido_id_pedido)
values (s_pagamento.nextval, 50, 50, 205);

INSERT INTO lanche 
(id_lanche, nome, quantidade, descricao, observacao, categoria_id_categoria,
	categoria_nome_categoria)
values (s_lanche.nextval, 'Xis Filé Mignon', 300, 'pão, ovos, filé, maionese, alface, queijo', 
	'filé ao ponto', 500,
	'xis');
INSERT INTO lanche 
(id_lanche, nome, quantidade, descricao, observacao, categoria_id_categoria,
	categoria_nome_categoria)
values (s_lanche.nextval, 'Cachorro Quente Tradicional', 300, 'pão, salsicha, alface, tomate, queijo, maionese', 
	'duas salsichas', 501,
	'dog');
INSERT INTO lanche 
(id_lanche, nome, quantidade, descricao, observacao, categoria_id_categoria,
	categoria_nome_categoria)
values (s_lanche.nextval, 'Pizza de Calabresa', 300, 'calabresa, tomate, queijo', 
	'queijo mussarela', 502,
	'pizza');

INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 2, 50, 200, 500);
INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 1, 100, 201, 502);
INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 2, 50, 202, 500);
INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 2, 50, 203, 500);
INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 3, 30, 204, 501);
INSERT INTO detalhes_pedido 
(id_detalhes_pedido, quantidade, valor, pedido_id_pedido, lanche_id_lanche)
values (s_detalhes_pedido.nextval, 2, 50, 205, 500);

INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('01/11/2019 23:00','dd/mm/yyyy hh24:mi'),10, 
	to_date('01/11/2019 23:10','dd/mm/yyyy hh24:mi'), 200);
INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('02/11/2019 22:45','dd/mm/yyyy hh24:mi'), 15, 
	to_date('02/11/2019 23:00','dd/mm/yyyy hh24:mi'), 201);
INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('09/11/2019 21:50','dd/mm/yyyy hh24:mi'), 30, 
	to_date('09/11/2019 22:20','dd/mm/yyyy hh24:mi'), 202);
INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('08/11/2019 23:00','dd/mm/yyyy hh24:mi'),10, 
	to_date('08/11/2019 23:10','dd/mm/yyyy hh24:mi'), 203);
INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('12/11/2019 22:45','dd/mm/yyyy hh24:mi'), 15, 
	to_date('12/11/2019 23:00','dd/mm/yyyy hh24:mi'), 204);
INSERT INTO entrega 
(id_entrega, saida_pedido, tempo_entrega, chegada_pedido, pedido_id_pedido)
values (s_entrega.nextval, to_date('11/11/2019 21:40','dd/mm/yyyy hh24:mi'), 30, 
	to_date('11/11/2019 22:10','dd/mm/yyyy hh24:mi'), 205);

INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, cnpj) --800
values (s_fornecedor.nextval, 'Empresa pães', '11.222.111/1111-11'); 
INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, cnpj) --801
values (s_fornecedor.nextval, 'Empresa de carnes', '21.555.111/1111-11'); 
INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, cnpj) --802
values (s_fornecedor.nextval, 'Empresa de alimentos', '31.111.111/1111-11'); 

INSERT INTO ingrediente (id_ingrediente, nome, quantidade)--900
values (s_ingrediente.nextval, 'Pão para hamburguer', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --901
values (s_ingrediente.nextval, 'Carne de primeira', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --902
values (s_ingrediente.nextval, 'Ovos', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --903
values (s_ingrediente.nextval, 'Pão para cachorro quente', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --904
values (s_ingrediente.nextval, 'Salsicha', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --905
values (s_ingrediente.nextval, 'Massa para pizza', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --906
values (s_ingrediente.nextval, 'Tomate', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --907
values (s_ingrediente.nextval, 'Calabresa', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --908
values (s_ingrediente.nextval, 'Queijo', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --909
values (s_ingrediente.nextval, 'Maionese', 1000); 
INSERT INTO ingrediente (id_ingrediente, nome, quantidade) --910
values (s_ingrediente.nextval, 'Alface', 1000); 





--possui é uma tabela com id lanche e id ingrediente
--xis
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 900);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 901);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 902);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 908);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 909);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (500, 910);
--dog
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (501, 903);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (501, 904);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (501, 908);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (501, 909);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (501, 910);
--pizza
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (502, 905);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (502, 906);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (502, 907);
INSERT INTO possui (lanche_id_lanche, ingrediente_id_ingrediente)
values (502, 908);

--vende é uma tabela com id ingrediente e id fornecedor

INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de pães
values (900, 800); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de carnes
values (901, 801); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (902, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (903, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de pães
values (904, 800); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (905, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (906, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (907, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (908, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (909, 802); 
INSERT INTO vende (ingrediente_id_ingrediente, fornecedor_id_fornecedor) --empresa de alimentos
values (910, 802); 