# Triggers
## Espera uma ação em uma tabela para executar um comando em outra tabela
Exemplo de criação de trigger:
```sql
CREATE OR REPLACE TRIGGER gera_log_alteracoes_trg
    AFTER INSERT ON contratos
BEGIN
    INSERT INTO log(usuario, data_hora, contrato_id)
    VALUES (usuario, SYSDATE, contrato_id);
END;
```
