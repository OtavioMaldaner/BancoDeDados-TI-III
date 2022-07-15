-- 1. Recuperar o nome, a data de nascimento e o nome do departamento dos funcionários.
-- Ordenar o resultado pelo nome do departamento seguido da data de nascimento.
SELECT Pnome, Datanasc, Dnome FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero ORDER BY Dnome, Datanasc;
-- 2. Listar os nomes dos departamentos que possuem funcionários do sexo masculino. Os
-- nomes dos departamentos não podem aparecer repetidos no resultado.
SELECT DISTINCT Dnome FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero AND funcionario.Sexo = "M";
-- 3. Listar os nomes dos funcionários que tenham a letra “a” no nome e que o sobrenome
-- termine com a letra “o”.
SELECT Pnome, Unome FROM funcionario WHERE Pnome LIKE "%a%" AND Unome LIKE "%o";
-- 4. Listar os nomes dos funcionários, seu salário e o possível salário se fosse dado um
-- aumento de 25%.
SELECT Pnome, Salario, ((Salario * 0.25) + Salario) aumento FROM funcionario;