-- Exercício 1
-- ORDER BY: Ordenar o resultado da consulta por uma ou mais colunas.
SELECT Pnome FROM funcionario;
SELECT Pnome FROM funcionario ORDER BY Pnome;
SELECT Pnome, Salario FROM funcionario;
SELECT Pnome, Salario FROM funcionario ORDER BY Salario;
SELECT Pnome, Salario FROM funcionario;
SELECT Pnome, Salario FROM funcionario ORDER BY Pnome, Salario;
SELECT Pnome, Salario FROM funcionario WHERE Sexo = "M";
SELECT Pnome, Salario FROM funcionario WHERE Sexo = "M" ORDER BY Pnome, Salario;
-- ASC/DESC – define a ordem - crescente ou decrescente.
SELECT Pnome FROM funcionario ORDER BY Pnome DESC;
-- DISTINCT: eliminar valores duplicados do resultado
SELECT DISTINCT Pnome FROM funcionario;
SELECT DISTINCT Pnome, Salario FROM funcionario;
-- CÁLCULO NAS CONSULTAS: é possível realizar cálculos diretamente na cláusula SELECT das consultas.
SELECT Pnome, Salario, Salario*1.1FROM funcionario;
SELECT Pnome, Salario, (Salario*0.1) aumento, (Salario+(Salario*0.1)) novoSalario FROM funcionario;
SELECT Pnome, (Salario+(Salario*0.1)) novoSalario FROM funcionario WHERE (Salario+(Salario*0.1))<50000;
-- LIKE: usado para verificar se um determinado valor (texto, número, etc.)
-- aparece nos valores de uma coluna.
-- % na frente do valor a ser procurado - significa que pode haver qualquer
-- valor antes do valor procurado.
-- % no final do valor a ser procurado - significa que pode haver qualquer
-- valor depois do valor procurado.
-- % na frente e no final do valor a ser procurado - significa que pode
-- haver qualquer valor antes e depois do valor procurado.
SELECT Pnome FROM funcionario WHERE Endereco LIKE "%São Paulo%";
SELECT Pnome FROM funcionario WHERE Endereco LIKE "%SP";
SELECT Pnome FROM funcionario WHERE Endereco LIKE "Rua%";
SELECT Pnome FROM funcionario WHERE Endereco like "%S_o Paulo%";
SELECT Pnome, Endereco FROM funcionario WHERE Pnome LIKE "A____";
-- Em campo data
SELECT Pnome, Datanasc FROM funcionario WHERE Datanasc LIKE "____-01-__";