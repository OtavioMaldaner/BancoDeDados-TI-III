-- 1. Listar o nome do funcionário, a quantidade de dependentes do funcionário, seu salário e quanto cada
-- funcionário ganhará de aumento, considerando o valor do aumento é de 10% para cada dependente.
-- Funcionários que não tenham dependentes não terão aumento, mas também devem aparecer na lista
-- com valor zerado na coluna aumento. Os nomes das colunas do resultado devem ser respectivamente:
-- funcionário, dependentes, salario, aumento.
SELECT funcionario.Pnome as funcionário, COUNT(dependente.Fcpf) as dependentes, funcionario.Salario, (funcionario.Salario * COUNT(dependente.Fcpf) * 0.10) as aumento 
FROM funcionario, dependente 
WHERE dependente.Fcpf = funcionario.Cpf 
GROUP BY funcionario.Pnome;
-- Questão 1 INCOMPLETA
-- 2. Listar o primeiro nome do funcionário e o número de projetos do departamento “Pesquisa” que o
-- funcionário trabalha, considerando apenas os funcionários que trabalham em mais do que a metade dos
-- projetos do departamento “Pesquisa”.