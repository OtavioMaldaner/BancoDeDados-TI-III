-- 1. Listar o nome dos funcionários e o nome do projeto, considerando funcionários que trabalham apenas
-- em 1 projeto?
SELECT funcionario.Pnome, projeto.Projnome FROM funcionario, projeto, trabalha_em  WHERE projeto.Projnumero = trabalha_em.Pnr AND trabalha_em.Fcpf = funcionario.Cpf  GROUP BY funcionario.Pnome HAVING COUNT(trabalha_em.Fcpf) = 1;
-- 2. Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará de aumento, considerando
-- que o valor do aumento é de 10% para funcionários que trabalham 40h ou mais em projetos e de 1%
-- para funcionários que trabalham menos de 40h em projetos.
SELECT funcionario.Pnome, funcionario.Salario, 
CASE 
	WHEN SUM(trabalha_em.Horas) >= 40 THEN (funcionario.Salario * 0.1)
    WHEN SUM(trabalha_em.Horas) < 40 THEN (funcionario.Salario * 0.01)
    ELSE 'n/a'
	END aumento
FROM funcionario, trabalha_em WHERE funcionario.Cpf = trabalha_em.Fcpf GROUP BY funcionario.Pnome;
-- 3. (continuação da anterior) Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará
-- de aumento, considerando que o valor do aumento é de 10% para funcionários que trabalham 40h ou
-- mais em projetos e de 1% para funcionários que trabalham menos de 40h em projetos. Considerar
-- apenas funcionários do departamento Pesquisa.
SELECT funcionario.Pnome, funcionario.Salario, 
CASE 
	WHEN SUM(trabalha_em.Horas) >= 40 THEN (funcionario.Salario * 0.1)
    WHEN SUM(trabalha_em.Horas) < 40 THEN (funcionario.Salario * 0.01)
	END aumento
FROM funcionario, trabalha_em, departamento WHERE funcionario.Cpf = trabalha_em.Fcpf AND funcionario.Dnr = departamento.Dnumero AND departamento.Dnome = 'Pesquisa' GROUP BY funcionario.Pnome;
-- 4. (continuação da anterior) Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará
-- de aumento, considerando que o valor do aumento é de 10% para funcionários que trabalham 40h ou
-- mais em projetos e de 1% para funcionários que trabalham menos de 40h em projetos. Considerar
-- apenas funcionários do departamento Pesquisa. Considerar que podem existir funcionários que não
-- estejam associados a nenhum projeto e também devem ter aumento.
SELECT funcionario.Pnome, funcionario.Salario, 
CASE 
	WHEN SUM(trabalha_em.Horas) >= 40 THEN (funcionario.Salario * 0.1)
    WHEN SUM(trabalha_em.Horas) < 40 THEN (funcionario.Salario * 0.01)
	END aumento
FROM funcionario LEFT JOIN trabalha_em ON funcionario.Cpf = trabalha_em.Fcpf JOIN departamento ON funcionario.Dnr = departamento.Dnumero WHERE departamento.Dnome = 'Pesquisa' GROUP BY funcionario.Pnome;
-- 5. Retornar o nome do funcionário, a quantidade de projetos que o funcionário trabalha, seu salário, o
-- total de horas trabalhadas pelo funcionário e o valor da sua hora de trabalho (considerando seu salário
-- dividido pela quantidade de horas que o funcionário trabalha). Exemplo: se Pedro tem salário de 10000
-- e trabalha em 4 projetos, sendo 5 horas em cada, então Pedro trabalha 20h no total. Assim, seu valor de
-- hora trabalhada é 10000/20 = 500.
SELECT funcionario.Pnome nome, COUNT(trabalha_em.Pnr) projetos, funcionario.Salario salario, SUM(trabalha_em.Horas) horas_trabalhadas, (funcionario.Salario / SUM(trabalha_em.Horas)) salario_hora FROM funcionario, trabalha_em WHERE funcionario.Cpf = trabalha_em.Fcpf GROUP BY funcionario.Pnome; 
-- 6. Retornar o primeiro e último nome de todos os funcionários que trabalham no projeto "ProdutoX" ou
-- no "ProdutoY" considerando apenas aqueles que:
--     - trabalham menos horas do que a média de horas trabalhadas das pessoas que trabalham no projeto "ProdutoX" ou no "ProdutoY";
--     - tenham salário maior do que a média do salário das pessoas que trabalham no projeto "ProdutoX" ou no "ProdutoY".
SELECT funcionario.Pnome, funcionario.Unome FROM funcionario, trabalha_em, projeto WHERE funcionario.Cpf = trabalha_em.Fcpf AND projeto.Projnumero = trabalha_em.Pnr AND projeto.Projnome = "ProdutoX" OR projeto.Projnome = "ProdutoY" AND SUM(trabalha_em.Horas) < AVG(trabalha_em.Horas) AND funcionario.Salario > AVG(funcionario.Salario);
-- 7. Listar o nome e a quantidade de projetos de todos os funcionários que moram no estado de “São Paulo”
-- e que tenham dois ou mais dependentes.
SELECT funcionario.Pnome nome, COUNT(trabalha_em.Pnr) projeto FROM funcionario, trabalha_em, dependente WHERE funcionario.Endereco LIKE '%São Paulo%' GROUP BY funcionario.Pnome HAVING COUNT(dependente.Fcpf) >= 2;