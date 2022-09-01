-- 1) Listar, sem repetir, o número e o nome dos projetos que tenham algum funcionário do departamento Administração trabalhando no projeto e também o nome dos projetos que que tenham algum funcionário que trabalha mais de 20 horas no projeto. Apresentar os resultados em ordem decrescente de número de projeto.
SELECT DISTINCT projeto.Projnumero, projeto.Projnome FROM projeto, funcionario, trabalha_em WHERE funcionario.Dnr = 4 AND trabalha_em.Horas > 20 ORDER BY Pnr DESC;
-- A questão número 1 está incompleta!
-- 2) Para o projeto Informatização, retorne o valor gasto por hora de trabalho do projeto
-- considerando o salário e as horas de trabalho no projeto de todos os funcionários que
-- trabalham no projeto (dividir a soma dos salários pela soma das horas trabalhadas de todos os
-- funcionários).
