-- 1. Faça uma consulta que retorne o nome do funcionário e qual foi o dia da semana (segunda, 
-- terça, ...) do primeiro aniversário de cada funcionário.
SELECT funcionario.Pnome nome, DAYNAME(DATE_ADD(funcionario.Datanasc, INTERVAL 1 YEAR)) dia FROM funcionario;
-- 2. Faça uma consulta que retorne o nome do funcionário em letras maiúsculas, seu departamento 
-- e o número de dias que o funcionário trabalhou em Agosto (mês 08) de acordo com as 
-- informações que estão no ponto do funcionário. A consulta deve restringir para retornar 
-- somente funcionários que tenham trabalhado menos de 20 dias no mês de acordo com o que 
-- consta na tabela folha_ponto. 
SELECT UPPER(funcionario.Pnome) nome, departamento.Dnome, COUNT(folha_ponto.saida) dias_trabalhados FROM funcionario, departamento, folha_ponto WHERE funcionario.Dnr = departamento.Dnumero AND funcionario.Cpf = folha_ponto.cpf AND DATE(folha_ponto.saida) LIKE '____-08-__' GROUP BY folha_ponto.cpf;
-- 3. Faça uma consulta que atenda a seguinte situação: quando o nome e o sobrenome do 
-- funcionário concatenados (ex.: 'Fernando Wong Xu') tiverem mais de 12 caracteres, retornar o
-- nome do funcionário concatenado com o sobrenome, abreviando o sobrenome colocando 
-- apenas a primeira letra seguida de um ponto (.) (exe. "Fernando W.").
SELECT CONCAT(funcionario.Pnome, ' ', LEFT(funcionario.Unome, 1), '.') nome FROM funcionario WHERE LENGTH(CONCAT(funcionario.Pnome, ' ', funcionario.Unome)) > 12 UNION SELECT CONCAT(funcionario.Pnome, ' ', funcionario.Unome) nome FROM funcionario WHERE LENGTH(CONCAT(funcionario.Pnome, ' ', funcionario.Unome)) <= 12;
-- 4. Faça uma consulta que atenda a seguinte situação: quando o nome e o sobrenome do 
-- funcionário concatenados (ex.: 'Ronaldo Lima Duarte') tiverem mais de 18 caracteres, retornar o 
-- nome do funcionário concatenado com o sobrenome abreviando o primeiro sobrenome 
-- colocando a apenas a primeira letra seguida de um ponto (.) mantendo o último nome intacto 
-- (exe. "Ronaldo L. Duarte").
SELECT CONCAT(funcionario.Pnome, ' ', LEFT(funcionario.Unome, 1), '.', TRIM(LEADING SUBSTRING_INDEX(funcionario.Unome, ' ', 1) FROM funcionario.Unome)) nome FROM funcionario WHERE LENGTH(CONCAT(funcionario.Pnome, ' ', funcionario.Unome)) > 18 UNION SELECT CONCAT(funcionario.Pnome, ' ', funcionario.Unome) nome FROM funcionario WHERE LENGTH(CONCAT(funcionario.Pnome, ' ', funcionario.Unome)) <= 18;
-- 5. Faça uma consulta que retorne os dias que o funcionário fez hora extra, ou seja, os dias em que 
-- o funcionário trabalhou mais de 8h (considerar que existe 1 hora de intervalo para almoço no 
-- tempo marcado no ponto). Retornar na consulta o nome do funcionário, o dia do ponto, a hora 
-- de entrada, a hora de saída, o total de horas contabilizadas no dia, uma coluna para representar 
-- as horas extras e outra para os minutos extras.
SELECT funcionario.Pnome nome, DAYOFMONTH(folha_ponto.entrada) dia, TIME(folha_ponto.entrada) entrada, TIME(folha_ponto.saida) saida, TIMEDIFF(folha_ponto.saida, folha_ponto.entrada) trabalhoDiario, HOUR(SUBTIME(TIMEDIFF(folha_ponto.saida, folha_ponto.entrada), '09:00:00')) horasExtras, MINUTE(SUBTIME(TIMEDIFF(folha_ponto.saida, folha_ponto.entrada), '09:00:00')) minutosExtras FROM funcionario, folha_ponto WHERE funcionario.Cpf = folha_ponto.cpf AND TIMEDIFF(folha_ponto.saida, folha_ponto.entrada) > '09:00:00';