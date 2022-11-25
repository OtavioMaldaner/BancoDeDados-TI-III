# Testes de triggers
# Primeira atividade
* Passo 1: criar um banco novo;
* Passo 2: criar as tabelas:
```sql
CREATE TABLE funcionario (
	id_funcionario int not null,
    nome varchar(30) not null,
    sobrenome varchar(30) not null,
    email varchar(30) not null,
    cargo varchar(30) not null,
    PRIMARY KEY (id_funcionario)
);
```
```sql
CREATE TABLE funcionario_auditoria (
	id int not null AUTO_INCREMENT,
    id_funcionario int not null,
    nome varchar(30) not null,
    sobrenome varchar(30) not null,
    cargo varchar(30) not null,
    modificadoem datetime default null,
    acao varchar(30) default null,
    PRIMARY KEY (id)
);
```
* Passo 3: Criar a trigger:
```sql
DELIMITER $$
CREATE TRIGGER antesUpdate_Funcionario 
BEFORE UPDATE ON funcionario
FOR EACH ROW BEGIN
INSERT INTO funcionario_auditoria (id_funcionario, nome, sobrenome, cargo, modificadoem, acao)
VALUES
(OLD.id_funcionario, OLD.nome, OLD.sobrenome, OLD.cargo, NOW(), "update");
END$$
DELIMITER ;
```
* Passo 4: Executar os comandos:
```sql
INSERT INTO funcionario (id_funcionario, nome, sobrenome,
email, cargo) VALUES ('1', 'Otávio', 'Maldaner', 'otavio.maldaner@aluno.feliz.ifrs.edu.br',
'Aluno');
```
```sql
UPDATE funcionario SET cargo = 'Coordenador' WHERE
id_funcionario = 1;
```
```sql
SELECT * FROM funcionario;
```
```sql
SELECT * FROM funcionario_auditoria;
```
## Para visualizar uma trigger
> SHOW TRIGGERS;

## Para remover uma trigger
> DROP TRIGGER nome_da_trigger;

# Segunda atividade
* Criar as tabelas
```sql
create table flor (
	idFlor int AUTO_INCREMENT PRIMARY KEY,
    nome_flor varchar(30),
    preco decimal(5, 2),
    percentual_promocao decimal(5, 2)
);
```
```sql
create table promocao (
	idFlor int(11) not null PRIMARY KEY,
    preco_promocional decimal(5, 2) DEFAULT NULL,
    FOREIGN KEY (idFlor) REFERENCES flor (idFLor)
);
```
* Criar a trigger:
```sql
DELIMITER $$
CREATE TRIGGER afterCreatePromotion 
AFTER INSERT ON flor
FOR EACH ROW BEGIN
DECLARE precoFlor decimal(5, 2);
DECLARE valorDesconto decimal(5, 2);
set valorDesconto = new.preco * new.percentual_promocao;
IF valorDesconto > 50 THEN
set valorDesconto = 50;
END IF;
INSERT INTO promocao (idFlor, preco_promocional)
VALUES
(new.idFlor, valorDesconto);
END$$
DELIMITER ;
```
* Executar os comandos
```sql
INSERT INTO flor(nome_flor, preco, percentual_promocao) VALUES ('Thaciflower',50,20)
```