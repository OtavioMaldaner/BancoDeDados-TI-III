# Exercícios views
## Exemplo 1:
```sql
CREATE VIEW deptos AS SELECT
    departamento.Dnome,
    departamento.Dnumero,
    departamento.Cpf_gerente,
    departamento.Data_inicio_gerente
FROM
    departamento;
```
## Exemplo 2:
### Para renomear as colunas:
```sql
CREATE VIEW deptos2(
    departamento,
    codigo,
    gerente,
    gerente_inicio
) AS SELECT
    departamento.Dnome,
    departamento.Dnumero,
    departamento.Cpf_gerente,
    departamento.Data_inicio_gerente
FROM
    departamento;
```
## Exemplo 3:
### Insert em view:
```sql
INSERT INTO deptos(Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente) VALUES ("Teste1", 8, 8888, "1990-08-08");
```
## Exemplo 4:
```sql
CREATE VIEW deptosSalariomedio AS SELECT
    departamento.Dnome,
    AVG(funcionario.Salario)
FROM
    funcionario,
    departamento
WHERE
    funcionario.Dnr = departamento.Dnumero
GROUP BY
    funcionario.Dnr;
```
```sql
INSERT INTO `deptossalariomedio`(
    `Dnome`,
    `AVG(funcionario.Salario)`
)
VALUES('Teste1', 200);
```
## O exemplo acima resulta em erro!!!!!