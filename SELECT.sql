
-- 1 - mostra o nome, telefone, email do cliente, id do pedido
-- dinheiro pago (não o valor final) do pagamento,
-- onde o nome do cliente inicia com a letra c
select c.nome, c.telefone, c.email, p.id_pedido, pa.dinheiro_pago
    from cliente c inner join pedido p
    on c.id_cliente = p.cliente_id_cliente
    inner join pagamento pa
    on pa.pedido_id_pedido = p.id_pedido
where c.nome like 'C%';

-- 2 - nome do cliente, valor do pedido, saída e chegada do pedido,
-- em que o valor seja menor que 70
select c.nome, dp.valor, to_char(en.saida_pedido, 'dd/mm/yyyy hh24:mi') as saida_pedido,
    to_char(en.chegada_pedido, 'dd/mm/yyyy hh24:mi') as chegada_pedido
    from detalhes_pedido dp inner join entrega en
    on dp.pedido_id_pedido = en.pedido_id_pedido
    inner join pedido p
    on p.id_pedido = dp.pedido_id_pedido
    inner join cliente c
    on c.id_cliente = p.cliente_id_cliente
group by c.nome, dp.valor, en.saida_pedido, chegada_pedido
having valor < 70;

--3 - mostra codigo do lanche, nome do lanche, soma da quantidade de lanches e
--soma do valor apenas para os lanches que a soma total vendida ultrapasse 100
select lanche.id_lanche, lanche.nome, sum(dp.quantidade) as soma_quantidade, sum(dp.valor) as soma_valores_pedido
    from entrega en inner join detalhes_pedido dp 
    on en.pedido_id_pedido = dp.pedido_id_pedido
    inner join lanche
    on lanche.id_lanche = dp.lanche_id_lanche
group by lanche.id_lanche, lanche.nome, dp.quantidade
having sum(dp.valor) > 100;

--4 - mostra codigo do pedido, quantidade do pedido, data e hora de chegada
--ordenado por quantidade em ordem decrescente
select p.id_pedido, dp.quantidade, to_char(e.chegada_pedido, 'dd/mm/yyyy hh24:mi') as chegada_pedido
    from pedido p inner join detalhes_pedido dp
    on p.id_pedido = dp.pedido_id_pedido
    inner join entrega e
    on e.pedido_id_pedido = dp.pedido_id_pedido
group by p.id_pedido, quantidade, chegada_pedido
order by quantidade desc;

--5 - id do lanche, nome do lanche, quantidade de pedidos em que determinado lanche aparece
--, apenas para lanches que aparecerem em mais de 2 pedidos
select dp.lanche_id_lanche as codigo_lanche, la.nome, count(*) as pedidos_lanche_aparece
    from detalhes_pedido dp inner join lanche la
    on dp.lanche_id_lanche = la.id_lanche
group by dp.lanche_id_lanche, la.nome
having count(*) > 2;

--6 - mostra nome do cliente, quantidade de lanche que o cliente fez no pedido,
-- apenas a hora e minuto da chegada do pedido, em cada um dos dias
-- entre o dia 5 e 13 de novembro
select c.nome,dp.quantidade, p.id_pedido, to_char(en.chegada_pedido, 'hh24:mi') as data_chegada
    from detalhes_pedido dp inner join entrega en
    on dp.pedido_id_pedido = en.pedido_id_pedido
    inner join pedido p
    on p.id_pedido = dp.pedido_id_pedido
    inner join cliente c
    on c.id_cliente = p.cliente_id_cliente
where en.chegada_pedido >= to_date('05/11/2019 00:00','dd/mm/yyyy hh24:mi')
and en.chegada_pedido < to_date('13/11/2019 00:00','dd/mm/yyyy hh24:mi')
group by to_char(en.chegada_pedido,'hh24:mi'), c.nome, dp.quantidade, p.id_pedido;

-- 7 mostra nome do fornecedor, nome dos ingredientes, nome dos lanches
--nome das categorias onde deverá ser mostrada apenas a categoria 'dog'
--ordenar pelo nome do lanche
select f.nome_fornecedor, i.nome as ingrediente, lanche.nome as lanche, lanche.categoria_nome_categoria as categoria
    from fornecedor f inner join vende v
    on f.id_fornecedor = v.fornecedor_id_fornecedor
    inner join ingrediente i
    on i.id_ingrediente = v.ingrediente_id_ingrediente
    inner join possui p
    on p.ingrediente_id_ingrediente = v.ingrediente_id_ingrediente
    inner join lanche
on lanche.id_lanche = p.lanche_id_lanche
where lanche.categoria_nome_categoria = 'dog'
order by lanche.nome;

--8 mostra id e nome do fornecedor, nome do ingrediente, quantidade do ingrediente que
--está armazenado, o numero de lanches que podem ser feitos com cada ingrediente
--apenas quando este numero for maior que 1
select f.id_fornecedor,f.nome_fornecedor, i.nome,i.quantidade as quantidade_estoque, count(i.quantidade) as numero_de_lanches
    from fornecedor f inner join vende v
    on f.id_fornecedor = v.fornecedor_id_fornecedor
    inner join ingrediente i
    on i.id_ingrediente = v.ingrediente_id_ingrediente
    inner join possui p
    on p.ingrediente_id_ingrediente = v.ingrediente_id_ingrediente
group by f.id_fornecedor,f.nome_fornecedor,i.nome,i.quantidade
having count(i.quantidade)>1;
