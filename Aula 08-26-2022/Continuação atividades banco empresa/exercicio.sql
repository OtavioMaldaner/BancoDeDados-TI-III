-- 1. Listar o nome do funcionário, a quantidade de dependentes do funcionário, seu salário e quanto cada
-- funcionário ganhará de aumento, considerando o valor do aumento é de 10% para cada dependente.
-- Funcionários que não tenham dependentes não terão aumento, mas também devem aparecer na lista
-- com valor zerado na coluna aumento. Os nomes das colunas do resultado devem ser respectivamente:
-- funcionário, dependentes, salario, aumento.
SELECT funcionario.Pnome as funcionário, COUNT(dependente.Fcpf) as dependentes, funcionario.Salario, (funcionario.Salario * COUNT(dependente.Fcpf) * 0.10) as aumento 
FROM funcionario JOIN dependente ON dependente.Fcpf = funcionario.Cpf 
WHERE dependente.Fcpf = funcionario.Cpf 
GROUP BY funcionario.Cpf;
-- 2. Listar o primeiro nome do funcionário e o número de projetos do departamento “Pesquisa” que o
-- funcionário trabalha, considerando apenas os funcionários que trabalham em mais do que a metade dos
-- projetos do departamento “Pesquisa”.
SELECT funcionario.Pnome, count(trabalha_em.Pnr) n_projetos
FROM funcionario, departamento, trabalha_em, projeto
WHERE
funcionario.Cpf = trabalha_em.Fcpf AND
trabalha_em.Pnr = projeto.Projnumero AND
projeto.Dnum = departamento.Dnumero AND
departamento.Dnome='Pesquisa'
GROUP BY funcionario.Cpf
HAVING count(trabalha_em.Pnr) >
(SELECT count(projeto.Projnumero)/2 n_projetos_PESQ
FROM departamento, projeto
WHERE projeto.Dnum = departamento.Dnumero AND
departamento.Dnome='Pesquisa');