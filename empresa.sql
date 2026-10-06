-- =====================================================
-- PROJETO: BANCO DE DADOS EMPRESA
-- =====================================================
-- Objetivo:
-- Criar um banco de dados relacional para armazenar
-- funcionários e seus respectivos salários.
-- =====================================================


-- =====================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- =====================================================

CREATE DATABASE Empresa;

USE Empresa;


-- =====================================================
-- 2. CRIAÇÃO DAS TABELAS
-- =====================================================

CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE TABLE Salarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (funcionario_id)
        REFERENCES Funcionarios(id)
);


-- =====================================================
-- 3. INSERÇÃO DOS FUNCIONÁRIOS
-- =====================================================

INSERT INTO Funcionarios (nome, cargo)
VALUES
    ('Ana Souza', 'Analista'),
    ('Bruno Lima', 'Desenvolvedor'),
    ('Carlos Mendes', 'Analista'),
    ('Daniela Rocha', 'Desenvolvedor'),
    ('Eduardo Alves', 'Gerente');


-- =====================================================
-- 4. INSERÇÃO DOS SALÁRIOS
-- =====================================================

INSERT INTO Salarios (funcionario_id, salario, data_pagamento)
VALUES
    (1, 3500.00, '2026-10-05'),
    (2, 5000.00, '2026-10-05'),
    (3, 4000.00, '2026-10-05'),
    (4, 5500.00, '2026-10-05'),
    (5, 8000.00, '2026-10-05');


-- =====================================================
-- 5. ATUALIZAÇÃO DE SALÁRIO
-- =====================================================
-- Atualização do salário da funcionária Ana Souza
-- de 3500.00 para 4000.00.

UPDATE Salarios
SET salario = 4000.00
WHERE funcionario_id = 1;


-- =====================================================
-- 6. EXCLUSÃO DE FUNCIONÁRIO E SALÁRIO
-- =====================================================
-- Primeiro é necessário excluir o salário devido
-- à existência da chave estrangeira.

DELETE FROM Salarios
WHERE funcionario_id = 5;

DELETE FROM Funcionarios
WHERE id = 5;


-- =====================================================
-- 7. LISTAGEM DOS FUNCIONÁRIOS COM SEUS SALÁRIOS
-- =====================================================

SELECT
    Funcionarios.nome,
    Funcionarios.cargo,
    Salarios.salario,
    Salarios.data_pagamento
FROM Funcionarios
INNER JOIN Salarios
    ON Funcionarios.id = Salarios.funcionario_id;


-- =====================================================
-- 8. SALÁRIO MÉDIO POR CARGO
-- =====================================================

SELECT
    Funcionarios.cargo,
    ROUND(AVG(Salarios.salario), 2) AS salario_medio
FROM Funcionarios
INNER JOIN Salarios
    ON Funcionarios.id = Salarios.funcionario_id
GROUP BY Funcionarios.cargo;


-- =====================================================
-- 9. JUNÇÃO DAS TABELAS
-- =====================================================
-- Consulta solicitada para mostrar nome, salário
-- e cargo de cada funcionário.

SELECT
    Funcionarios.nome,
    Salarios.salario,
    Funcionarios.cargo
FROM Funcionarios
INNER JOIN Salarios
    ON Funcionarios.id = Salarios.funcionario_id;