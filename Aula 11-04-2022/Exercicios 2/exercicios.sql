-- 1. Crie a função TotalHoras para retornar o total de horas que um funcionário trabalha. O
-- parâmetro de entrada da função deve ser o cpf do funcionário. A função deve retornar o total
-- de horas que o funcionário trabalha (tabela trabalha_em).
-- Função:
CREATE FUNCTION TotalHoras(cpf BIGINT) RETURNS INT RETURN(
    SELECT
        SUM(trabalha_em.Horas)
    FROM
        trabalha_em
    WHERE
        trabalha_em.Fcpf = cpf
);
-- Execução:
SELECT TotalHoras(funcionario.Cpf) from funcionario;

-- 2. Crie a função TotalHorasProjetos para retornar o total de horas e o número de projetos que
-- um funcionário trabalha. O parâmetro de entrada da função deve ser o cpf do funcionário. A
-- função deve retornar de forma concatenada o total de horas que o funcionário trabalha e a
-- quantidade de projetos que o funcionário trabalha. Exemplo de retorno da função: '10h - 2
-- projetos'.
-- Função:
CREATE FUNCTION TotalHorasProjetos(cpf BIGINT) RETURNS VARCHAR(150) RETURN(
    SELECT
        CONCAT(
            'O funcionário trabalha em ',
            COUNT(trabalha_em.Fcpf),
            ' projetos e trabalha por ',
            IFNULL(SUM(trabalha_em.Horas),
            0),
            ' horas.'
        )
    FROM
        trabalha_em
    WHERE
        trabalha_em.Fcpf = cpf
    GROUP BY
        trabalha_em.Fcpf
);
-- Execução:
SELECT TotalHorasProjetos(funcionario.Cpf) FROM funcionario;

-- 3. Crie a função TotalFuncionários para retornar a quantidade de funcionários que trabalham
-- em um determinado projeto. O parâmetro de entrada da função deve ser o nome do projeto.
-- A função deve retornar a quantidade de funcionários que trabalha no projeto indicado.
-- Função:
CREATE FUNCTION TotalFuncionarios(nome_proj VARCHAR(30)) RETURNS INT RETURN(
    SELECT
        COUNT(trabalha_em.Fcpf)
    FROM
        trabalha_em,
        projeto
    WHERE
        trabalha_em.Pnr = projeto.Projnumero AND projeto.Projnome = nome_proj
);
-- Execução:
SELECT TotalFuncionarios('Novosbenefícios');

-- 4. Crie a função MediaSalDep para retornar a média salarial dos funcionários de um
-- departamento. O parâmetro de entrada da função deve ser o nome do departamento. A
-- função deve retornar a média salarial dos funcionários que trabalham no departamento
-- indicado. 
-- Função:
CREATE FUNCTION MediaSalDep(nome_proj VARCHAR(30)) RETURNS decimal RETURN(
    SELECT
        AVG(funcionario.Salario)
    FROM
        trabalha_em,
        projeto,
    	funcionario
    WHERE
        trabalha_em.Pnr = projeto.Projnumero AND projeto.Projnome = nome_proj AND trabalha_em.Fcpf = funcionario.Cpf
);
-- Execução:
SELECT MediaSalDep('Novosbenefícios');