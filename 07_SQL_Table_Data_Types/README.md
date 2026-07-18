````markdown
# PostgreSQL - Guia Completo para Criação de Tabelas

Este guia apresenta os principais tipos de dados, restrições e boas práticas utilizados no PostgreSQL. O objetivo é servir como um manual de referência rápida para modelagem e criação de tabelas.

---

# Estrutura Básica

```sql
CREATE TABLE nome_tabela (
    coluna tipo_de_dado restrições
);
```

Exemplo:

```sql
CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario NUMERIC(10,2),
    data_admissao DATE
);
```

---

# Tipos Numéricos

## SMALLINT

### Descrição

Inteiro de 2 bytes.

### Faixa

-32.768 até 32.767

### Exemplo

```sql
idade SMALLINT
```

---

## INTEGER (INT)

### Descrição

Inteiro de 4 bytes.

### Faixa

-2.147.483.648 até 2.147.483.647

### Exemplo

```sql
quantidade INTEGER
```

---

## BIGINT

### Descrição

Inteiro de 8 bytes.

### Faixa

±9 quintilhões

### Exemplo

```sql
populacao BIGINT
```

---

## SMALLSERIAL

### Descrição

Inteiro pequeno com incremento automático.

### Exemplo

```sql
id SMALLSERIAL
```

---

## SERIAL

### Descrição

Inteiro com incremento automático.

### Exemplo

```sql
id SERIAL PRIMARY KEY
```

---

## BIGSERIAL

### Descrição

Inteiro grande com incremento automático.

### Exemplo

```sql
id BIGSERIAL
```

---

# Tipos Decimais

## NUMERIC(p,s)

### Descrição

Precisão exata.

Ideal para valores financeiros.

### Exemplo

```sql
preco NUMERIC(12,2)
```

---

## DECIMAL(p,s)

### Descrição

Sinônimo de NUMERIC.

### Exemplo

```sql
salario DECIMAL(10,2)
```

---

## REAL

### Descrição

Ponto flutuante de precisão simples.

### Exemplo

```sql
temperatura REAL
```

---

## DOUBLE PRECISION

### Descrição

Ponto flutuante de dupla precisão.

### Exemplo

```sql
distancia DOUBLE PRECISION
```

---

## MONEY

### Descrição

Tipo monetário do PostgreSQL.

### Exemplo

```sql
valor MONEY
```

---

# Tipos Texto

## CHAR(n)

### Descrição

Texto de tamanho fixo.

### Exemplo

```sql
uf CHAR(2)
```

---

## VARCHAR(n)

### Descrição

Texto de tamanho variável.

### Exemplo

```sql
nome VARCHAR(150)
```

---

## TEXT

### Descrição

Texto sem limite de tamanho.

### Exemplo

```sql
descricao TEXT
```

---

# Tipos Booleanos

## BOOLEAN

### Descrição

Aceita:

- TRUE
- FALSE
- NULL

### Exemplo

```sql
ativo BOOLEAN
```

---

# Tipos Data e Hora

## DATE

### Descrição

Data.

### Exemplo

```sql
nascimento DATE
```

---

## TIME

### Descrição

Hora.

### Exemplo

```sql
hora TIME
```

---

## TIME WITH TIME ZONE

### Descrição

Hora com fuso horário.

### Exemplo

```sql
hora TIME WITH TIME ZONE
```

---

## TIMESTAMP

### Descrição

Data e hora.

### Exemplo

```sql
cadastro TIMESTAMP
```

---

## TIMESTAMP WITH TIME ZONE (TIMESTAMPTZ)

### Descrição

Data e hora com fuso horário.

### Exemplo

```sql
evento TIMESTAMPTZ
```

---

## INTERVAL

### Descrição

Intervalo de tempo.

### Exemplo

```sql
duracao INTERVAL
```

---

# Tipo UUID

## UUID

### Descrição

Identificador universal único.

### Exemplo

```sql
id UUID
```

---

# Tipos JSON

## JSON

### Descrição

Armazena documentos JSON.

### Exemplo

```sql
dados JSON
```

---

## JSONB

### Descrição

JSON binário.

Mais rápido para consultas.

### Exemplo

```sql
configuracoes JSONB
```

---

# Tipo XML

## XML

### Descrição

Armazena documentos XML.

### Exemplo

```sql
conteudo XML
```

---

# Tipo Binário

## BYTEA

### Descrição

Armazena arquivos binários.

### Exemplo

```sql
imagem BYTEA
```

---

# Tipos Enumerados

## ENUM

### Criando o tipo

```sql
CREATE TYPE status_pedido AS ENUM (
'PENDENTE',
'PAGO',
'CANCELADO'
);
```

### Utilizando

```sql
status status_pedido
```

---

# Tipos Array

## ARRAY

### Descrição

Permite armazenar listas de valores.

### Exemplo

```sql
telefones VARCHAR(20)[]
```

ou

```sql
telefones TEXT[]
```

---

# Tipos de Rede

## INET

### Descrição

Endereço IPv4 ou IPv6.

### Exemplo

```sql
ip INET
```

---

## CIDR

### Descrição

Faixa de rede.

### Exemplo

```sql
rede CIDR
```

---

## MACADDR

### Descrição

Endereço MAC.

### Exemplo

```sql
mac MACADDR
```

---

## MACADDR8

### Descrição

Endereço MAC de 64 bits.

### Exemplo

```sql
mac64 MACADDR8
```

---

# Tipos Geométricos

## POINT

```sql
localizacao POINT
```

---

## LINE

```sql
linha LINE
```

---

## LSEG

```sql
segmento LSEG
```

---

## BOX

```sql
area BOX
```

---

## PATH

```sql
trajeto PATH
```

---

## POLYGON

```sql
poligono POLYGON
```

---

## CIRCLE

```sql
circulo CIRCLE
```

---

# Tipos de Pesquisa Textual

## TSVECTOR

### Descrição

Indexação para Full Text Search.

### Exemplo

```sql
texto TSVECTOR
```

---

## TSQUERY

### Descrição

Consulta Full Text Search.

### Exemplo

```sql
pesquisa TSQUERY
```

---

# Tipos de Identificadores

## OID

### Descrição

Object Identifier do PostgreSQL.

### Exemplo

```sql
identificador OID
```

---

# Restrições

## PRIMARY KEY

Identificador único da tabela.

```sql
id SERIAL PRIMARY KEY
```

---

## FOREIGN KEY

Relaciona tabelas.

```sql
cliente_id INTEGER
REFERENCES cliente(id)
```

---

## UNIQUE

Impede valores duplicados.

```sql
email VARCHAR(150) UNIQUE
```

---

## NOT NULL

Campo obrigatório.

```sql
nome VARCHAR(100) NOT NULL
```

---

## DEFAULT

Define valor padrão.

```sql
ativo BOOLEAN DEFAULT TRUE
```

---

## CHECK

Valida regras de negócio.

```sql
idade INTEGER
CHECK (idade >= 18)
```

---

## GENERATED ALWAYS AS IDENTITY

Substituto moderno do SERIAL.

```sql
id INTEGER
GENERATED ALWAYS AS IDENTITY
PRIMARY KEY
```

---

# Exemplo Completo

```sql
CREATE TABLE cliente (

    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    nome VARCHAR(150) NOT NULL,

    cpf CHAR(11) UNIQUE NOT NULL,

    email VARCHAR(200) UNIQUE,

    telefone VARCHAR(20),

    data_nascimento DATE,

    salario NUMERIC(12,2),

    ativo BOOLEAN DEFAULT TRUE,

    foto BYTEA,

    configuracoes JSONB,

    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
```

---

# Boas Práticas

- Utilize `GENERATED ALWAYS AS IDENTITY` em novos projetos em vez de `SERIAL`.
- Utilize `NUMERIC` para valores financeiros.
- Utilize `VARCHAR` para textos curtos.
- Utilize `TEXT` para textos longos.
- Utilize `TIMESTAMPTZ` quando houver fusos horários.
- Utilize `JSONB` em vez de `JSON` quando houver consultas frequentes.
- Utilize `UUID` para identificadores distribuídos.
- Utilize `BOOLEAN` para estados lógicos.
- Utilize `NOT NULL` sempre que possível.
- Crie `PRIMARY KEY` em todas as tabelas.
- Utilize `FOREIGN KEY` para garantir integridade referencial.
- Utilize `CHECK` para validar regras de negócio.
- Utilize `UNIQUE` para impedir duplicidades.
- Nomeie tabelas e colunas utilizando um padrão consistente.
- Evite utilizar `CHAR` para textos variáveis.
- Documente tabelas e colunas utilizando o comando `COMMENT`.
````
