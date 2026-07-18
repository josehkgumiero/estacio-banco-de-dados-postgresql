# Criação de banco de dados e tabelas na prática 01

Vamos então implementar um banco de dados a partir do modelo lógico a seguir.

![alt text](modelo_Logico.png)

```sql
-- ============================================
-- Criar Database
-- ============================================

CREATE DATABASE empresa;

-- Conecte-se ao banco empresa antes de executar
-- o restante do script.

-- ============================================
-- Criar Schema
-- ============================================

CREATE SCHEMA cadastro;

-- ============================================
-- Tabela REGIAO
-- ============================================

CREATE TABLE cadastro.regiao (

    id INTEGER PRIMARY KEY,

    nome VARCHAR(30)

);

-- ============================================
-- Tabela CLIENTES
-- ============================================

CREATE TABLE cadastro.clientes (

    id INTEGER PRIMARY KEY,

    nome VARCHAR(100),

    email VARCHAR(100) UNIQUE,

    idade INTEGER,

    data_criacao TIMESTAMP

);

-- ============================================
-- Tabela PEDIDOS
-- ============================================

CREATE TABLE cadastro.pedidos (

    id INTEGER PRIMARY KEY,

    cliente_id INTEGER,

    data_pedido TIMESTAMP,

    total NUMERIC(10,2),

    CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES cadastro.clientes(id)

);

-- ============================================
-- POPULANDO A TABELA REGIAO
-- ============================================

INSERT INTO cadastro.regiao (nome)
VALUES
('Norte'),
('Nordeste'),
('Centro-Oeste'),
('Sudeste'),
('Sul');

-- ============================================
-- POPULANDO A TABELA CLIENTES
-- ============================================

INSERT INTO cadastro.clientes
(
    nome,
    email,
    idade,
    data_criacao
)
VALUES
('João Silva',       'joao@email.com',      30, CURRENT_TIMESTAMP),
('Maria Oliveira',   'maria@email.com',     25, CURRENT_TIMESTAMP),
('Pedro Santos',     'pedro@email.com',     42, CURRENT_TIMESTAMP),
('Ana Souza',        'ana@email.com',       35, CURRENT_TIMESTAMP),
('Carlos Lima',      'carlos@email.com',    29, CURRENT_TIMESTAMP),
('Fernanda Costa',   'fernanda@email.com',  31, CURRENT_TIMESTAMP),
('Ricardo Alves',    'ricardo@email.com',   45, CURRENT_TIMESTAMP),
('Juliana Martins',  'juliana@email.com',   27, CURRENT_TIMESTAMP),
('Lucas Pereira',    'lucas@email.com',     38, CURRENT_TIMESTAMP),
('Patrícia Gomes',   'patricia@email.com',  33, CURRENT_TIMESTAMP);

-- ============================================
-- POPULANDO A TABELA PEDIDOS
-- ============================================

INSERT INTO cadastro.pedidos
(
    cliente_id,
    data_pedido,
    total
)
VALUES
(1, CURRENT_TIMESTAMP, 250.50),
(1, CURRENT_TIMESTAMP, 180.00),

(2, CURRENT_TIMESTAMP, 399.90),

(3, CURRENT_TIMESTAMP, 1499.99),
(3, CURRENT_TIMESTAMP, 899.50),

(4, CURRENT_TIMESTAMP, 75.00),

(5, CURRENT_TIMESTAMP, 320.45),
(5, CURRENT_TIMESTAMP, 980.00),

(6, CURRENT_TIMESTAMP, 150.25),

(7, CURRENT_TIMESTAMP, 550.80),
(7, CURRENT_TIMESTAMP, 210.35),

(8, CURRENT_TIMESTAMP, 89.90),

(9, CURRENT_TIMESTAMP, 1200.00),

(10, CURRENT_TIMESTAMP, 499.99),
(10, CURRENT_TIMESTAMP, 799.50);

SELECT *
FROM cadastro.regiao;

SELECT *
FROM cadastro.clientes;

SELECT *
FROM cadastro.pedidos;


-- Consultar clientes e seus pedidos
SELECT
    c.id,
    c.nome,
    c.email,
    p.id AS pedido,
    p.data_pedido,
    p.total
FROM cadastro.clientes c
INNER JOIN cadastro.pedidos p
ON c.id = p.cliente_id
ORDER BY c.nome;

-- Total gasto por cliente
SELECT
    c.nome,
    COUNT(p.id) AS quantidade_pedidos,
    SUM(p.total) AS total_gasto
FROM cadastro.clientes c
LEFT JOIN cadastro.pedidos p
ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY total_gasto DESC;
```