# SQL - Categorias de Comandos

Este documento apresenta as principais categorias de comandos SQL, uma breve descrição de cada comando e um exemplo simples utilizando um banco de dados relacional.

---

# DDL (Data Definition Language)

**Objetivo:** Criar, alterar e excluir estruturas do banco de dados.

| Comando | Descrição |
|---------|-----------|
| `CREATE` | Cria objetos no banco de dados. |
| `ALTER` | Altera a estrutura de um objeto existente. |
| `DROP` | Remove um objeto do banco de dados. |
| `TRUNCATE` | Remove todos os registros de uma tabela. |
| `RENAME` | Renomeia um objeto. |
| `COMMENT` | Adiciona comentários em objetos. |

## Exemplos

### CREATE

```sql
CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);
```

### ALTER

```sql
ALTER TABLE Cliente
ADD email VARCHAR(100);
```

### DROP

```sql
DROP TABLE Cliente;
```

### TRUNCATE

```sql
TRUNCATE TABLE Cliente;
```

### RENAME

```sql
ALTER TABLE Cliente
RENAME TO Clientes;
```

### COMMENT

```sql
COMMENT ON TABLE Clientes IS 'Tabela de clientes';
```

---

# DML (Data Manipulation Language)

**Objetivo:** Inserir, alterar e excluir registros.

| Comando | Descrição |
|---------|-----------|
| `INSERT` | Insere novos registros. |
| `UPDATE` | Atualiza registros existentes. |
| `DELETE` | Remove registros. |
| `MERGE` | Insere ou atualiza registros conforme condição. |

## Exemplos

### INSERT

```sql
INSERT INTO Clientes(nome,email)
VALUES ('João','joao@email.com');
```

### UPDATE

```sql
UPDATE Clientes
SET email='novo@email.com'
WHERE id=1;
```

### DELETE

```sql
DELETE FROM Clientes
WHERE id=1;
```

### MERGE

```sql
MERGE INTO Clientes c
USING NovosClientes n
ON c.id=n.id
WHEN MATCHED THEN
UPDATE SET nome=n.nome
WHEN NOT MATCHED THEN
INSERT(nome,email)
VALUES(n.nome,n.email);
```

---

# DQL (Data Query Language)

**Objetivo:** Consultar informações do banco de dados.

| Comando | Descrição |
|---------|-----------|
| `SELECT` | Consulta registros da tabela. |

## Exemplo

```sql
SELECT *
FROM Clientes;
```

---

# DCL (Data Control Language)

**Objetivo:** Controlar permissões de acesso.

| Comando | Descrição |
|---------|-----------|
| `GRANT` | Concede permissões. |
| `REVOKE` | Remove permissões. |

## Exemplos

### GRANT

```sql
GRANT SELECT
ON Clientes
TO usuario;
```

### REVOKE

```sql
REVOKE SELECT
ON Clientes
FROM usuario;
```

---

# TCL (Transaction Control Language)

**Objetivo:** Controlar transações.

| Comando | Descrição |
|---------|-----------|
| `BEGIN` | Inicia uma transação. |
| `COMMIT` | Confirma as alterações. |
| `ROLLBACK` | Desfaz as alterações. |
| `SAVEPOINT` | Cria um ponto de retorno. |
| `RELEASE SAVEPOINT` | Remove um SAVEPOINT. |

## Exemplos

### BEGIN

```sql
BEGIN;
```

### COMMIT

```sql
COMMIT;
```

### ROLLBACK

```sql
ROLLBACK;
```

### SAVEPOINT

```sql
SAVEPOINT ponto1;
```

### RELEASE SAVEPOINT

```sql
RELEASE SAVEPOINT ponto1;
```

---

# Exemplo de Banco Relacional

## Tabela Cliente

```sql
CREATE TABLE Cliente(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);
```

## Tabela Pedido

```sql
CREATE TABLE Pedido(
    id SERIAL PRIMARY KEY,
    data DATE,
    valor NUMERIC(10,2),
    cliente_id INTEGER REFERENCES Cliente(id)
);
```

### Relacionamento

- Um **Cliente** pode possuir vários **Pedidos**.
- Cada **Pedido** pertence a apenas um **Cliente**.

Relacionamento:

```
Cliente (1) -------- (N) Pedido
```

---

## Inserindo dados

```sql
INSERT INTO Cliente(nome)
VALUES
('João'),
('Maria');
```

```sql
INSERT INTO Pedido(data,valor,cliente_id)
VALUES
('2026-07-17',500,1),
('2026-07-18',800,1),
('2026-07-19',300,2);
```

---

## Consultando os dados

```sql
SELECT
    c.nome,
    p.valor,
    p.data
FROM Cliente c
INNER JOIN Pedido p
ON c.id = p.cliente_id;
```

### Resultado

| Cliente | Valor | Data |
|----------|------:|------------|
| João | 500,00 | 17/07/2026 |
| João | 800,00 | 18/07/2026 |
| Maria | 300,00 | 19/07/2026 |

---

# Resumo

| Categoria | Finalidade | Principais Comandos |
|------------|------------|---------------------|
| **DDL** | Define a estrutura do banco | CREATE, ALTER, DROP, TRUNCATE, RENAME, COMMENT |
| **DML** | Manipula registros | INSERT, UPDATE, DELETE, MERGE |
| **DQL** | Consulta dados | SELECT |
| **DCL** | Controla permissões | GRANT, REVOKE |
| **TCL** | Controla transações | BEGIN, COMMIT, ROLLBACK, SAVEPOINT, RELEASE SAVEPOINT |