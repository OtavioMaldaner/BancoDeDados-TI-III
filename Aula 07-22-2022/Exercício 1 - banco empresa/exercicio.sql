-- 1. Recuperar o nome, a data de nascimento e o nome do departamento dos funcionários.
-- Ordenar o resultado pelo nome do departamento seguido da data de nascimento.
SELECT Pnome, Datanasc, Dnome FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero ORDER BY departamento.Dnome, funcionario.Datanasc;
-- 2. Listar os nomes dos departamentos em que os funcionários do sexo masculino pertencem
-- na empresa. Os nomes dos departamentos não podem aparecer repetidos.
SELECT DISTINCT Dnome  FROM departamento JOIN funcionario ON departamento.Dnumero = funcionario.Dnr  WHERE funcionario.Sexo = 'M';
-- 3. Listar os nomes dos funcionários que tenham a letra “a” no nome e que o sobrenome
-- termine com a letra “o”.
SELECT Pnome FROM funcionario WHERE funcionario.Pnome LIKE '%a%'AND funcionario.Unome LIKE '%o';
-- 4. Listar os nomes dos funcionários, os nomes dos departamentos, o salário e o possível
-- salário dos funcionários se fosse dado um aumento de 25%.
SELECT Pnome, Salario, ((Salario * 0.25) + Salario) aumento, Dnome FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero;
-- 5. Listar a soma total dos salários agrupados pelo sexo do funcionário.
SELECT Sexo, SUM(Salario) FROM funcionario GROUP BY Sexo;
-- 6. Retornar a quantidade de dependentes por sexo do funcionário.
SELECT MIN(Salario), MAX(Salario), AVG(Salario), Dnome FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero GROUP BY departamento.Dnome;
-- 7. Retornar a quantidade de projetos por departamento.
SELECT COUNT(Dnum), Dnome FROM projeto, departamento WHERE projeto.Dnum = departamento.Dnumero GROUP BY departamento.Dnome;
-- 8. Listar os nomes dos funcionários que trabalham em dois ou mais projetos
SELECT Pnome, COUNT(trabalha_em.Fcpf)projetos FROM funcionario, projeto, trabalha_em WHERE projeto.Projnumero = trabalha_em.Pnr AND funcionario.Cpf = trabalha_em.Fcpf GROUP BY funcionario.Cpf HAVING COUNT(trabalha_em.Fcpf) >= 2;