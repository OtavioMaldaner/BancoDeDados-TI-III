-- 1 - Uma função que recebe o CPF do funcionário e retorna o valor do aumento do
-- funcionário. Se a soma de horas trabalhadas em projetos pelo funcionário for maior ou igual a
-- 40, o aumento deve ser de 20%. Caso contrário o aumento deve ser de 5%.
delimiter
    $
CREATE FUNCTION calcula_aumento(cpf BIGINT) RETURNS DECIMAL BEGIN
    DECLARE
        aumento DECIMAL;
    SELECT SUM(trabalha_em.Horas) INTO soma_horas
    IF SUM(trabalha_em.Horas) >= 40 THEN
    SET
        aumento = 0.2; 
    ELSE SUM(trabalha_em.Horas)
    SET
        aumento = 0.5;
END IF; 
RETURN(
    SELECT
        funcionario.Salario * aumento
    FROM
        funcionario,
        trabalha_em
    WHERE
        funcionario.Cpf = cpf AND trabalha_em.Fcpf = funcionario.Cpf;
); END$