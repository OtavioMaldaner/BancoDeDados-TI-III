# Atividade SQL (IN, IS NULL, UNION, BETWEEN)
## Para as questões abaixo utilizar o banco de dados empresa (já utilizados em outras questões).
1. Fazer uma lista dos números de projeto nos quais trabalham funcionários cujo último
nome seja ‘Silva’. A lista também deve conter os números dos projetos que
pertencem ao departamento “Pesquisa”. Uso obrigatório de UNION ou UNION ALL
para apresentar os números dos projetos, considerando que eles não devem
aparecer de forma repetida.
2. Encontre o nome de todos os funcionários que nasceram entre '1960-01-01' AND
'1969-12-31'. Uso obrigatório do BETWEEN.
3. Recuperar o nome e o sobrenome dos funcionários que não possuem dependentes.
Uso obrigatório de IN ou NOT IN conforme necessidade.
4. Recuperar a quantidade de funcionários por projeto, considerando apenas os
funcionários que tenham horas de trabalho associado ao projeto. Isso significa que
horas com valor em branco ou nulos não devem se contabilizados. Uso obrigatório
de IS NULL ou IS NOT NULL conforme necessidade.