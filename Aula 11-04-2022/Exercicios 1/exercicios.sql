-- 1 - Criar uma função que recebe a data de nascimento do funcionário e retorna a idade do
-- funcionário. Dica: procurar funções de data(date) do MySQL pode ajudar.
-- Função:
CREATE FUNCTION calcula_idade(data_nasc date) RETURNS int RETURN TIMESTAMPDIFF(YEAR, data_nasc, NOW());
-- Execução:
SELECT calcula_idade(funcionario.Datanasc) FROM funcionario;

-- 2 - Fazer um select que retorne o nome e a idade de todos os funcionário demostrando o uso da
-- função.
-- Execução:
SELECT funcionario.Pnome, calcula_idade(funcionario.Datanasc) FROM funcionario;

-- 3 - Criar uma função que recebe o CPF do funcionário e retorna o número de dependentes do
-- funcionário.
-- Função:
CREATE FUNCTION calcula_dependentes(cpf bigint) RETURNS int RETURN (SELECT COUNT(1) FROM dependente WHERE dependente.Fcpf = cpf);
-- Execução:
SELECT calcula_dependentes(funcionario.Cpf) FROM funcionario WHERE funcionario.Cpf = 12345678966;

-- 4 - Fazer um select que retorne o nome e o número de dependentes de um funcionário
-- informado na função.
SELECT funcionario.Pnome, calcula_dependentes(funcionario.Cpf) FROM funcionario WHERE funcionario.Cpf = 12345678966;

-- 5 - Fazer um select que retorne o nome e o número de dependentes de todos os funcionários.
SELECT funcionario.Pnome, calcula_dependentes(funcionario.Cpf) FROM funcionario;