-- 1. Para cada projeto localizado em ‘Mauá’, liste o número do projeto, o número do
-- departamento que o controla e o último nome, endereço e data de nascimento do gerente
-- do departamento.
SELECT projeto.Projnumero, departamento.Dnumero, funcionario.Unome, funcionario.Endereco, funcionario.Datanasc 
FROM projeto JOIN departamento ON departamento.Dnumero = projeto.Dnum JOIN funcionario ON funcionario.Cpf = departamento.Cpf_gerente
WHERE projeto.Projlocal = "Mauá";
-- 2. Listar os nomes dos funcionários com dois ou mais dependentes.
SELECT funcionario.Pnome 
FROM funcionario JOIN dependente ON funcionario.Cpf = dependente.Fcpf 
GROUP BY funcionario.Pnome HAVING COUNT(dependente.Fcpf) >= 2;
-- 3. Recuperar os nomes de todos os funcionários do departamento número 5 que trabalham
-- mais de 10 horas por semana no ‘ProdutoX’.
SELECT funcionario.Pnome FROM funcionario JOIN departamento ON funcionario.Dnr = departamento.Dnumero JOIN trabalha_em ON funcionario.Cpf = trabalha_em.Fcpf WHERE departamento.Dnumero = 5 AND trabalha_em.Horas >= 10 AND trabalha_em.Pnr = 1;
-- 4. Liste os nomes de todos os funcionários que tem um dependente com o primeiro nome
-- igual ao seu.
SELECT funcionario.Pnome FROM funcionario JOIN dependente ON funcionario.Pnome = dependente.Nome_dependente WHERE funcionario.Pnome = dependente.Nome_dependente;
-- 5. Para cada projeto, liste o nome do projeto e o total de horas por semana (por todos os
-- funcionários) gastas nesse projeto.
SELECT projeto.Projnome, SUM(trabalha_em.Horas) FROM projeto JOIN trabalha_em ON projeto.Projnumero = trabalha_em.Pnr WHERE projeto.Projnumero = trabalha_em.Pnr GROUP BY projeto.Projnome;
-- 6. Para cada departamento, recupere o nome do departamento e o salário médio de todos os
-- seus funcionários.