# Projeto Empresa - MySQL

Projeto desenvolvido para praticar os principais conceitos de bancos de dados relacionais utilizando MySQL.

O banco de dados **Empresa** possui duas tabelas relacionadas, `Funcionarios` e `Salarios`, permitindo armazenar informações dos funcionários e seus respectivos salários.

## Objetivos

O projeto aplica os seguintes conceitos:

- Criação de banco de dados relacional;
- Criação de tabelas;
- Chaves primárias (`PRIMARY KEY`);
- Chaves estrangeiras (`FOREIGN KEY`);
- Relacionamento entre tabelas;
- Operações CRUD;
- Consultas utilizando `JOIN`;
- Agrupamento de dados com `GROUP BY`;
- Funções de agregação com `AVG()`.

## Estrutura do Banco de Dados

O banco de dados utilizado é:

`Empresa`

### Tabela Funcionarios

| Campo | Tipo         | Descrição                                     |
| ----- | ------------ | --------------------------------------------- |
| id    | INT          | Identificador do funcionário e chave primária |
| nome  | VARCHAR(100) | Nome do funcionário                           |
| cargo | VARCHAR(100) | Cargo do funcionário                          |

### Tabela Salarios

| Campo          | Tipo          | Descrição                                    |
| -------------- | ------------- | -------------------------------------------- |
| id             | INT           | Identificador do registro e chave primária   |
| funcionario_id | INT           | Chave estrangeira relacionada ao funcionário |
| salario        | DECIMAL(10,2) | Salário do funcionário                       |
| data_pagamento | DATE          | Data de pagamento                            |

O relacionamento entre as tabelas é realizado através de:

`Salarios.funcionario_id` → `Funcionarios.id`

## Operações realizadas

O projeto contém exemplos das principais operações de manipulação de dados:

- `INSERT` para cadastro de funcionários e salários;
- `SELECT` para consulta dos dados;
- `UPDATE` para atualização de salário;
- `DELETE` para exclusão de salário e funcionário.

Foram cadastrados inicialmente cinco funcionários com seus respectivos salários.

## Consultas

### Funcionários e salários

A consulta utiliza `INNER JOIN` para combinar os dados das tabelas `Funcionarios` e `Salarios`.

```sql
SELECT
    Funcionarios.nome,
    Salarios.salario,
    Funcionarios.cargo
FROM Funcionarios
INNER JOIN Salarios
    ON Funcionarios.id = Salarios.funcionario_id;
```

Salário médio por cargo
A consulta utiliza GROUP BY juntamente com a função de agregação AVG() para calcular o salário médio dos funcionários de cada cargo.
SELECT
Funcionarios.cargo,
ROUND(AVG(Salarios.salario), 2) AS salario_medio
FROM Funcionarios
INNER JOIN Salarios
ON Funcionarios.id = Salarios.funcionario_id
GROUP BY Funcionarios.cargo;

Arquivo do projeto
O arquivo [`empresa.sql`](./empresa.sql) contém todos os comandos necessários para:

1. Criar o banco de dados;
2. Criar as tabelas;
3. Inserir os dados;
4. Atualizar registros;
5. Excluir registros;
6. Consultar funcionários e salários;
7. Calcular o salário médio por cargo;
8. Realizar consultas utilizando JOIN.
   Tecnologias utilizadas

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub
  Autor
  Celso Issamu Abe Junior
