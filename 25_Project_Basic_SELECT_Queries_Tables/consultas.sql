/******************************************************************************
 * ARQUIVO: consultas_empregado.sql
 * DESCRIÇÃO:
 * Conjunto de consultas SQL utilizando a tabela EMPREGADO.
 * As consultas demonstram operações básicas da linguagem SQL, incluindo
 * seleção de dados, projeção de colunas, concatenação, cálculos,
 * aliases, funções de agregação e subconsultas.
 *
 * Banco de Dados: PostgreSQL
 ******************************************************************************/

-------------------------------------------------------------------------------
-- 1. Retornar todos os registros da tabela EMPREGADO
-- Descrição:
-- Exibe todas as colunas e todos os registros existentes na tabela.
-------------------------------------------------------------------------------

SELECT *
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 2. Retornar apenas as colunas ID, PRIM_NOME e ULT_NOME
-- Descrição:
-- Exibe somente a identificação e os nomes dos empregados.
-------------------------------------------------------------------------------

SELECT
    ID,
    PRIM_NOME,
    ULT_NOME
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 3. Retornar o salário anual de cada empregado
-- Descrição:
-- Calcula o salário anual multiplicando o salário mensal por 12.
-------------------------------------------------------------------------------

SELECT
    ID,
    PRIM_NOME,
    ULT_NOME,
    SALARIO,
    SALARIO * 12 AS SALARIO_ANUAL
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 4. Retornar o nome completo do empregado
-- Descrição:
-- Concatena o primeiro nome com o último nome.
-------------------------------------------------------------------------------

SELECT
    PRIM_NOME || ' ' || ULT_NOME
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 5. Retornar o nome completo com o alias "NOME COMPLETO"
-- Descrição:
-- Concatena o primeiro nome e o último nome e atribui um alias à coluna.
-------------------------------------------------------------------------------

SELECT
    PRIM_NOME || ' ' || ULT_NOME AS "NOME COMPLETO"
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 6. Retornar o resultado da soma de 9 + 5 e a data/hora do servidor
-- Descrição:
-- Demonstra o uso de expressões aritméticas e funções de data.
-------------------------------------------------------------------------------

SELECT
    9 + 5 AS SOMA,
    CURRENT_TIMESTAMP AS DATA_HORA_SERVIDOR;

-------------------------------------------------------------------------------
-- 7. Retornar estatísticas dos salários
-- Descrição:
-- Calcula a média, soma, maior e menor salário dos empregados.
-------------------------------------------------------------------------------

SELECT
    AVG(SALARIO) AS MEDIA_SALARIAL,
    SUM(SALARIO) AS SOMA_SALARIOS,
    MAX(SALARIO) AS MAIOR_SALARIO,
    MIN(SALARIO) AS MENOR_SALARIO
FROM EMPREGADO;

-------------------------------------------------------------------------------
-- 8. Retornar o empregado com o maior ID
-- Descrição:
-- Localiza o maior ID cadastrado e retorna suas informações.
-------------------------------------------------------------------------------

SELECT
    ID,
    ULT_NOME,
    DT_ADMISSAO
FROM EMPREGADO
WHERE ID = (
    SELECT MAX(ID)
    FROM EMPREGADO
);

-------------------------------------------------------------------------------
-- 9. Retornar o empregado com o menor ID
-- Descrição:
-- Localiza o menor ID cadastrado e retorna suas informações.
-------------------------------------------------------------------------------

SELECT
    ID,
    ULT_NOME,
    DT_ADMISSAO
FROM EMPREGADO
WHERE ID = (
    SELECT MIN(ID)
    FROM EMPREGADO
);

-------------------------------------------------------------------------------
-- Fim do arquivo
-------------------------------------------------------------------------------