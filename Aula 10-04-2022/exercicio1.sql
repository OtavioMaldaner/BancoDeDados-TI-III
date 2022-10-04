-- Diz a lenda da sorte que se a soma do dia, mês e ano de nascimento for maior do que a soma
-- do dia, mês e ano atual você terá sorte no dia. Essa lenda é totalmente verdadeira exceto pelas
-- partes que foram totalmente inventadas.
-- Faça uma consulta para verificar se o funcionário terá sorte no dia de hoje
SELECT funcionario.Pnome, DAY(funcionario.Datanasc) + MONTH(funcionario.Datanasc) + YEAR(funcionario.Datanasc) valor_nasc, DAY(NOW()) + MONTH(NOW()) + YEAR(NOW()) valor_atual, (DAY(funcionario.Datanasc) + MONTH(funcionario.Datanasc) + YEAR(funcionario.Datanasc)) - (DAY(NOW()) + MONTH(NOW()) + YEAR(NOW())) diferenca FROM funcionario;
-- Considerando que o endereço dos funcionários segue um padrão, faça uma consulta para
-- extrair o nome das cidades onde moram os funcionários.
SELECT TRIM(REVERSE(SUBSTRING(REVERSE(SUBSTRING_INDEX(funcionario.Endereco, ',', -2)), 5))) FROM funcionario;
-- Considerando que o endereço dos funcionários segue um padrão, faça uma consulta para
-- extrair o nome das cidades onde moram os funcionários que trabalham em 2 ou mais projetos.
SELECT funcionario.Pnome, TRIM(REVERSE(SUBSTRING(REVERSE(SUBSTRING_INDEX(funcionario.Endereco, ',', -2)), 5))) FROM funcionario, trabalha_em, projeto WHERE funcionario.Cpf = trabalha_em.Fcpf AND projeto.Projnumero = trabalha_em.Pnr GROUP BY trabalha_em.Fcpf HAVING COUNT(trabalha_em.Fcpf) >= 2;
-- Retornar os três últimos dígitos do cpf do funcionário concatenados com as três primeiras
-- letras do nome dos dependentes dos funcionários concatenado com o nome do departamento
-- do funcionário.
SELECT DISTINCT CONCAT(RIGHT(funcionario.Cpf, 3), LEFT(dependente.Nome_dependente, 3), departamento.Dnome) FROM funcionario, dependente, trabalha_em, departamento, projeto WHERE funcionario.Cpf = dependente.Fcpf AND projeto.Projnumero = departamento.Dnumero AND trabalha_em.Pnr = projeto.Projnumero;
-- Percentual de tempo de trabalho do funcionário em relação a idade do funcionário.
SELECT CONCAT(FLOOR(DATEDIFF(NOW(), departamento.Data_inicio_gerente) / 365) / FLOOR(DATEDIFF(NOW(), funcionario.Datanasc) / 365) * 100, '%') porcentagem FROM departamento, funcionario WHERE funcionario.Cpf = departamento.Cpf_gerente;
-- Refaça o exercício 1 somando cada um dos algarismos das datas.
SELECT SUBSTRING(funcionario.Datanasc, 1, 1) + SUBSTRING(funcionario.Datanasc, 2, 1) + SUBSTRING(funcionario.Datanasc, 3, 1) + SUBSTRING(funcionario.Datanasc, 4, 1) + SUBSTRING(funcionario.Datanasc, 6, 1) + SUBSTRING(funcionario.Datanasc, 7, 1) + SUBSTRING(funcionario.Datanasc, 9, 1) + SUBSTRING(funcionario.Datanasc, 10, 1) soma FROM funcionario;