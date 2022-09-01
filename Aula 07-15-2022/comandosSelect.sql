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
-- Exercício 2
-- SUM(coluna): retorna a soma dos valores da coluna.
-- AVG(coluna): retorna a média dos valores da coluna.
-- MIN(coluna): retorna o valor mínimo da coluna.
-- MAX(coluna): retorna o valor máximo da coluna.
-- COUNT(coluna): retorna a quantidade de valores não NULL nesta coluna.
-- Se for passado COUNT(*), será retornado o número total de registros
-- independente de quantos tenham valor NULL.
SELECT SUM(Salario) FROM funcionario;
SELECT MIN(Salario), MAX(Salario), AVG(Salario) FROM funcionario;
SELECT MIN(Salario), MAX(Salario), AVG(Salario) FROM funcionario, departamento;
SELECT MIN(Salario), MAX(Salario), AVG(Salario) FROM funcionario, departamento WHERE funcionario.Dnr=departamento.Dnumero AND departamento.Dnome="Vendas";
SELECT COUNT(Pnome) FROM funcionario;
SELECT COUNT(Pnome) FROM funcionario WHERE Sexo = "F";
SELECT COUNT(*),COUNT(Dnr) FROM funcionario;
-- GROUP BY: é usado juntamente com funções de agregação para agrupar os
-- resultados por uma ou mais colunas.
SELECT Sexo, COUNT(Pnome) FROM funcionario GROUP BY sexo;
SELECT departamento.Dnome, SUM(funcionario.Salario) FROM funcionario, departamento WHERE funcionario.Dnr=departamento.Dnumero GROUP BY departamento.Dnome;
-- HAVING: utilizada porque o WHERE não pode ser usado com funções de
-- agregação. Isto é, WHERE não aceita algo como 'WHERE SUM(salario)>5000'.
SELECT departamento.Dnome, SUM(funcionario.Salario) FROM departamento, funcionario GROUP BY departamento.Dnome HAVING SUM(funcionario.Salario) > 1500;
SELECT departamento.Dnome, SUM(funcionario.Salario) FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero GROUP BY departamento.Dnome HAVING SUM(funcionario.Salario) > 60000;