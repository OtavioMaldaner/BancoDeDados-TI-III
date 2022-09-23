-- Escrever as horas trabalhadas dos funcionários com a mesma quantidade de dígitos;
SELECT RPAD(LPAD(trabalha_em.Horas, 4, '0'), 5, '0') horas FROM trabalha_em;
-- 1) Nome e sobrenome do funcionário concatenados e em letra maiúscula
SELECT UPPER(CONCAT(funcionario.Pnome, funcionario.Unome)) FROM funcionario;
-- 2) As 3 primeiras letras do departamento do funcionário em ordem reversa concatenados com o salário do funcionário considerando um aumento de 10%
SELECT CONCAT(REVERSE(LEFT(departamento.Dnome, 3)), funcionario.Salario * 1.1) FROM departamento, funcionario WHERE funcionario.Dnr = departamento.Dnumero;