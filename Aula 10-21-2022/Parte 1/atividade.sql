-- 1. Fazer uma consulta SQL que retorne o nome e a idade dos funcionários baseada na
-- data de nascimento.
SELECT funcionario.Pnome, FLOOR(DATEDIFF(NOW(), funcionario.Datanasc) / 365) idade FROM funcionario;
-- 2. Fazer uma consulta SQL que retorne o nome do departamento onde existam funcionários
-- do sexo feminino. Embora possa ser feito de forma mais simples, você deve utilizar EXISTS para
-- exercitar seu uso. 
SELECT departamento.Dnome FROM departamento WHERE EXISTS(SELECT funcionario.Sexo FROM funcionario WHERE funcionario.Sexo = 'F' AND funcionario.Dnr = departamento.Dnumero);
-- 3. Fazer uma consulta SQL que retorne o nome e o sexo do funcionário. Porém, ao invés de
-- retornar ‘F’ e ‘M’ no sexo você deve retornar ‘Feminino’ e ‘Masculino’. Para isso, nesta questão
-- você deve utilizar o CASE. 
SELECT funcionario.Pnome, 
CASE funcionario.Sexo
	WHEN 'F' THEN 'Feminino'
    WHEN 'M' THEN 'Masculino'
    ELSE 'Não binário'
    END 'Sexo'
FROM funcionario;