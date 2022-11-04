-- 1. Crie a função TotalHoras para retornar o total de horas que um funcionário trabalha. O
-- parâmetro de entrada da função deve ser o cpf do funcionário. A função deve retornar o total
-- de horas que o funcionário trabalha (tabela trabalha_em).
-- Função:
CREATE FUNCTION TotalHoras(cpf bigint) RETURNS int RETURN (SELECT SUM(trabalha_em.Horas) FROM trabalha_em WHERE trabalha_em.Fcpf = cpf);
-- Execução:
SELECT TotalHoras(funcionario.Cpf) from funcionario;

-- 2. Crie a função TotalHorasProjetos para retornar o total de horas e o número de projetos que
-- um funcionário trabalha. O parâmetro de entrada da função deve ser o cpf do funcionário. A
-- função deve retornar de forma concatenada o total de horas que o funcionário trabalha e a
-- quantidade de projetos que o funcionário trabalha. Exemplo de retorno da função: '10h - 2
-- projetos'.
-- Função:
CREATE FUNCTION TotalHorasProjetos(cpf bigint) RETURNS varchar(150) RETURN (SELECT CONCAT('O funcionário trabalha em ', COUNT(trabalha_em.Fcpf), ' projetos e trabalha por ', IFNULL(SUM(trabalha_em.Horas), 0), ' horas.') FROM trabalha_em WHERE trabalha_em.Fcpf = cpf GROUP BY trabalha_em.Fcpf);
-- Execução:
SELECT TotalHorasProjetos(funcionario.Cpf) FROM funcionario;

-- 3. Crie a função TotalFuncionários para retornar a quantidade de funcionários que trabalham
-- em um determinado projeto. O parâmetro de entrada da função deve ser o nome do projeto.
-- A função deve retornar a quantidade de funcionários que trabalha no projeto indicado.
-- Função:
