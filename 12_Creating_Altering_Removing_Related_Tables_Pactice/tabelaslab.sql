CREATE TABLE regiao(
    id INT PRIMARY KEY,
	nome VARCHAR(30));


CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    idade INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    idreg integer references regiao(id)
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2)
);