# Questões
## Considerando o banco de dados EMPRESA disponível no Moodle, crie consultas para recuperar os dados conforme solicitado nas questões abaixo.
1. Listar o nome dos funcionários e o nome do projeto, considerando funcionários que trabalham apenas
em 1 projeto?
2. Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará de aumento, considerando
que o valor do aumento é de 10% para funcionários que trabalham 40h ou mais em projetos e de 1%
para funcionários que trabalham menos de 40h em projetos.
3. (continuação da anterior) Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará
de aumento, considerando que o valor do aumento é de 10% para funcionários que trabalham 40h ou
mais em projetos e de 1% para funcionários que trabalham menos de 40h em projetos. Considerar
apenas funcionários do departamento Pesquisa.
4. (continuação da anterior) Listar o nome do funcionário, seu salário e quanto cada funcionário ganhará
de aumento, considerando que o valor do aumento é de 10% para funcionários que trabalham 40h ou
mais em projetos e de 1% para funcionários que trabalham menos de 40h em projetos. Considerar
apenas funcionários do departamento Pesquisa. Considerar que podem existir funcionários que não
estejam associados a nenhum projeto e também devem ter aumento.
5. Retornar o nome do funcionário, a quantidade de projetos que o funcionário trabalha, seu salário, o
total de horas trabalhadas pelo funcionário e o valor da sua hora de trabalho (considerando seu salário
dividido pela quantidade de horas que o funcionário trabalha). Exemplo: se Pedro tem salário de 10000
e trabalha em 4 projetos, sendo 5 horas em cada, então Pedro trabalha 20h no total. Assim, seu valor de
hora trabalhada é 10000/20 = 500.
6. Retornar o primeiro e último nome de todos os funcionários que trabalham no projeto "ProdutoX" ou
no "ProdutoY" considerando apenas aqueles que:
    - trabalham menos horas do que a média de horas trabalhadas das pessoas que trabalham no projeto "ProdutoX" ou no "ProdutoY";
    - tenham salário maior do que a média do salário das pessoas que trabalham no projeto
"ProdutoX" ou no "ProdutoY".
7. Listar o nome e a quantidade de projetos de todos os funcionários que moram no estado de “São Paulo”
e que tenham dois ou mais dependentes.