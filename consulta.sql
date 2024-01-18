-- 3) Relatório de produtos e categorias

SELECT categorias.id as id_categoria, categorias.nome as categoria, produto.id as id_produto, produto.nome as produto, produto.preco as preco
FROM categorias
INNER JOIN produto ON categorias.id=produto.categoria_id;

-- 4) Relatório dps pedidos

SELECT cliente.nome as nome_cliente,
    categorias.nome as categoria, 
    produto.nome as produto,
    item_pedido.preco_unitario as preco_unitario, 
    item_pedido.quantidade as quantidade, 
    pedido.data as data
FROM categorias
INNER JOIN produto ON categorias.id = produto.categoria_id
INNER JOIN item_pedido ON produto.id = item_pedido.produto_id  -- ajustar  a condição de join
INNER JOIN pedido ON item_pedido.pedido_id = pedido.id
INNER JOIN cliente ON pedido.cliente_id = cliente.id
order by nome_cliente;

-- 5) Relatório de vendas por categorias

select categorias.nome as nome,
sum(item_pedido.preco_unitario * item_pedido.quantidade) as total
from categorias 
inner join produto on categorias.id = produto.categoria_id
inner join item_pedido on item_pedido.produto_id = produto.id
group by categorias.nome;
 