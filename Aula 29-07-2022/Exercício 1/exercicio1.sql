-- 1. Fazer uma lista dos números de projeto nos quais trabalham funcionários cujo último
-- nome seja ‘Silva’. A lista também deve conter os números dos projetos que
-- pertencem ao departamento “Pesquisa”. Uso obrigatório de UNION ou UNION ALL
-- para apresentar os números dos projetos, considerando que eles não devem
-- aparecer de forma repetida.
SELECT Pnr FROM trabalha_em JOIN funcionario ON funcionario.Cpf = trabalha_em.Fcpf WHERE funcionario.Unome = 'Silva' UNION SELECT Projnumero FROM projeto JOIN departamento ON departamento.Dnumero = projeto.Dnum WHERE projeto.Dnum = 5;
-- 2. Encontre o nome de todos os funcionários que nasceram entre '1960-01-01' AND
-- '1969-12-31'. Uso obrigatório do BETWEEN.
SELECT Pnome FROM funcionario WHERE funcionario.Datanasc BETWEEN '1960-01-01' AND '1969-12-31';
-- 3. Recuperar o nome e o sobrenome dos funcionários que não possuem dependentes.
-- Uso obrigatório de IN ou NOT IN conforme necessidade.
SELECT Pnome, Unome FROM funcionario WHERE funcionario.Cpf NOT IN (SELECT Fcpf FROM dependente);
-- 4. Recuperar a quantidade de funcionários por projeto, considerando apenas os
-- funcionários que tenham horas de trabalho associado ao projeto. Isso significa que
-- horas com valor em branco ou nulos não devem se contabilizados. Uso obrigatório
-- de IS NULL ou IS NOT NULL conforme necessidade.
SELECT COUNT(trabalha_em.Fcpf), trabalha_em.Pnr FROM trabalha_em WHERE trabalha_em.Horas IS NOT NULL GROUP BY trabalha_em.Pnr;