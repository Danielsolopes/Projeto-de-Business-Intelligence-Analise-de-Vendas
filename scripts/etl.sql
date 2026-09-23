/* ============================================================
   PROJETO BI - ANÁLISE DE VENDAS
   Script de ETL - Extração, Transformação e Carga
   ============================================================ */
______________________________________________________________________
-- ============================================================
-- 1. EXTRAÇÃO
-- ============================================================

-- Vendas com dados enriquecidos
SELECT 
    v.id_venda,
    v.data_venda,
    p.nome_produto,
    p.categoria,
    g.nome_gerente,
    s.nome_supervisor,
    v.quantidade,
    v.valor_total
FROM Fato_Vendas v
INNER JOIN Dim_Produto p ON v.id_produto = p.id_produto
INNER JOIN Dim_Gerente g ON v.id_gerente = g.id_gerente
INNER JOIN Dim_Supervisor s ON v.id_supervisor = s.id_supervisor
WHERE v.data_venda >= '2024-01-01';

-- ============================================================
-- 2. TRANSFORMAÇÃO
-- ============================================================

-- Faturamento por gerente e categoria (com sazonalidade trimestral)
SELECT 
    g.nome_gerente,
    p.categoria,
    DATEPART(QUARTER, v.data_venda) AS trimestre,
    SUM(v.valor_total) AS faturamento,
    COUNT(v.id_venda) AS qtd_vendas,
    SUM(v.valor_total) / COUNT(v.id_venda) AS ticket_medio
FROM Fato_Vendas v
INNER JOIN Dim_Produto p ON v.id_produto = p.id_produto
INNER JOIN Dim_Gerente g ON v.id_gerente = g.id_gerente
GROUP BY g.nome_gerente, p.categoria, DATEPART(QUARTER, v.data_venda);

-- ============================================================
-- 3. CARGA (exemplo de tabela analítica)
-- ============================================================

-- CREATE TABLE Analise_Vendas_Trimestral AS
-- SELECT ... (resultado da transformação acima)
