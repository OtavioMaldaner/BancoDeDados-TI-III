-- 1. Recuperar o nome dos funcionários que tem salário maior que ‘30.000’.
SELECT Pnome FROM funcionario WHERE funcionario.Salario > 30000;
-- 2. Recuperar o nome dos funcionários que tem salário menor que ‘30.000’ e que seja do sexo feminino.
SELECT Pnome FROM funcionario WHERE funcionario.Salario < 30000 AND funcionario.Sexo = "F";
-- 3. Listar a soma total dos salários por sexo.
SELECT Sexo, SUM(Salario) FROM funcionario GROUP BY Sexo;
-- 4. Listar o menor, o maior e a média dos salários por departamento.
SELECT departamento.Dnome, MIN(salario), MAX(salario), AVG(salario) FROM funcionario, departamento WHERE funcionario.Dnr = departamento.Dnumero GROUP BY departamento.Dnome;
-- 5. Retornar a quantidade de dependentes por sexo.
SELECT Sexo, COUNT(Sexo) FROM dependente GROUP BY dependente.Sexo;
-- 6. Retornar a quantidade de dependentes por sexo do funcionário.
SELECT funcionario.Sexo, COUNT(dependente.Sexo) FROM funcionario, dependente WHERE funcionario.Cpf = dependente.Fcpf GROUP BY funcionario.Sexo;