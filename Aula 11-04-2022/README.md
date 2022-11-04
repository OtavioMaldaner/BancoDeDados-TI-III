# Aula sobre funções
Aula sobre criação de funções em SQL.
Estrutura básica:
```sql
CREATE [OR REPLACE] FUNCTION [IF NOT
EXISTS] nome_função (parâmetros)
RETURNS tipo_dado
RETURN código_da_função;
```
Exemplo de função:
```sql
CREATE FUNCTION fn_multiplica (a INT, b INT)
RETURNS INT
RETURN a * b;
```
Para excluir uma função, basta executar:
```sql
DROP FUNCTION nome_função;
```
# Sobre
Aula do dia 04/11/2022; &nbsp;

Feito por [Otávio Maldaner](https://github.com/OtavioMaldaner/); &nbsp;

Feliz - RS | 04/11/2022