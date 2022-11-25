# Exercício 1 - Views
Defina o comando para criar uma Visão (View) que mostre a quantidade de
funcionários por departamento.
Tabelas utilizadas: departamento e funcionario
```sql
create view funcionarios as 
select departamento.Dnome, count(funcionario.Dnr) funcionarios
from departamento
join funcionario on funcionario.Dnr = departamento.Dnumero
group by departamento.Dnome;
```
# Exercício 2 - Funções
Criar uma função chamada num_dependentes que recebe o CPF do funcionário e
retorna o número de dependentes do funcionário.
```sql
DELIMITER
    $
CREATE OR REPLACE FUNCTION num_dependentes(cpfFuncionario BIGINT) RETURNS INT BEGIN
    RETURN
        (
        SELECT
            COUNT(dependente.Fcpf)
        FROM
            dependente
        WHERE
            dependente.Fcpf = cpfFuncionario
    ) ;
END$
```
```sql
SELECT funcionario.Pnome nome, num_dependentes(funcionario.Cpf) dependentes FROM funcionario;
```
# Exercício 3 - Trigger
Criar uma trigger para atualizar o estoque na tabela produtos toda vez que um
produto for vendido (neste exercício vender significa inserir uma linha na tabela
itensvenda).
