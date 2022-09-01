-- 1) Listar, sem repetir, o número e o nome dos projetos que tenham algum funcionário do departamento Administração trabalhando no projeto e também o nome dos projetos que que tenham algum funcionário que trabalha mais de 20 horas no projeto. Apresentar os resultados em ordem decrescente de número de projeto.
SELECT DISTINCT projeto.Projnumero, projeto.Projnome FROM projeto, funcionario, departamento, trabalha_em WHERE funcionario.Dnr = departamento.Dnumero AND departamento.Dnome = "Administração" OR trabalha_em.Horas > 20 AND funcionario.Cpf = trabalha_em.Fcpf AND trabalha_em.Pnr = projeto.Projnumero ORDER BY projeto.Projnumero DESC;
-- 2) Para o projeto Informatização, retorne o valor gasto por hora de trabalho do projeto
-- considerando o salário e as horas de trabalho no projeto de todos os funcionários que
-- trabalham no projeto (dividir a soma dos salários pela soma das horas trabalhadas de todos os
-- funcionários).
SELECT projeto.Projnome, SUM(funcionario.Salario)/SUM(trabalha_em.Horas) as totalPorHora FROM funcionario, trabalha_em, projeto WHERE funcionario.Cpf = trabalha_em.Fcpf AND trabalha_em.Pnr = projeto.Projnumero AND projeto.Projnome = "Informatização";
-- 3) Recuperar o primeiro nome, último nome e salário dos funcionários do departamento
-- ‘Administração’ que trabalham mais de 15 horas no projeto ‘Informatização’.
SELECT funcionario.Pnome, funcionario.Unome, funcionario.Salario FROM funcionario, departamento, trabalha_em, projeto WHERE funcionario.Dnr = departamento.Dnumero AND departamento.Dnome = "Administração" AND trabalha_em.Pnr = projeto.Projnumero AND projeto.Projnome = "Informatização" AND trabalha_em.Horas > 15;
-- 4) Listar o primeiro nome do funcionário e o número de projetos que trabalham todos os
-- funcionários que moram na cidade de São Paulo que trabalham no departamento Pesquisa e
-- que trabalham em dois ou mais projetos de empresa.