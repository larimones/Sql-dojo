1  Listar os empregados (nomes) que tem salário maior que seu chefe
select * from empregados e where salario >  (select salario from empregados b where b.emp_id = e.supervisor_id ); 

 emp_id | dep_id | supervisor_id |  nome   | salario 
--------+--------+---------------+---------+---------
      4 |      1 |             1 | Maria   |    9500
      6 |      1 |             1 | Claudia |   10000
      7 |      4 |             1 | Ana     |   12200
      8 |      2 |             5 | Luiz    |    8000



2 Listar o maior salario de cada departamento (pode ser usado o group by)
select MAX(salario) from empregados group by dep_id


3 Listar o nome do funcionario com maior salario dentro de cada departamento (pode ser usado o IN)
select 

 ROW_NUMBER() OVER(PARTITION BY dep_id order by salario) as salarios,
 nome
 
 from empregados

--  dep_id | nome  | salario 
-- --------+-------+---------
--       3 | Joao  | 6000
--       1 | Maria | 9500
--       4 | Ana   | 12200
--       2 | Luiz  | 8000

4 Listar os nomes departamentos que tem menos de 3 empregados;

--  nome 
-- ------
--  TI



6 Listar os departamentos  com o número de colaboradores

    
--    nome    | count 
-- -----------+-------
--  Marketing |     1
--  RH        |     2
--  TI        |     4
--  Vendas    |     1


7 Listar os empregados que não possuem chefes no mesmo departamento 

--  nome | dep_id 
-- ------+--------
--  Joao |      3
--  Ana  |      4


8 Listar os departamentos com o total de salários pagos 


--  emp_id | dep_id | supervisor_id | nome | salario | emp_id | dep_id | supervisor_id | nome  | salario 
-- --------+--------+---------------+------+---------+--------+--------+---------------+-------+---------
--       2 |      3 |             5 | Joao | 6000    |      5 |      2 |             0 | Pedro | 7500
--       7 |      4 |             1 | Ana  | 12200   |      1 |      1 |             0 | Jose  | 8000


9  Listar os colaboradores com salario maior que a média do seu departamento;


10 Compare o salario de cada colaborados com média do seu setor. Dica: usar slide windows functions (https://www.postgresqltutorial.com/postgresql-window-function/)

-- emp_id |   nome    | dep_id | salario |          avg           
-- --------+-----------+--------+---------+------------------------
--       1 | Jose      |      1 |    8000 |  8125.0000000000000000
--       6 | Claudia   |      1 |   10000 |  8125.0000000000000000
--       3 | Guilherme |      1 |    5000 |  8125.0000000000000000
--       4 | Maria     |      1 |    9500 |  8125.0000000000000000
--       8 | Luiz      |      2 |    8000 |  7750.0000000000000000
--       5 | Pedro     |      2 |    7500 |  7750.0000000000000000
--       2 | Joao      |      3 |    6000 |  6000.0000000000000000
--       7 | Ana       |      4 |   12200 | 12200.0000000000000000


11 - Encontre os empregados com salario maior ou igual a média do seu departamento. Deve ser reportado o salario do empregado e a média do departamento (dica: usar window function com subconsulta)

--   nome   | salario | dep_id |       avg_salary       
-- ---------+---------+--------+------------------------
--  Claudia |   10000 |      1 |  8125.0000000000000000
--  Maria   |    9500 |      1 |  8125.0000000000000000
--  Luiz    |    8000 |      2 |  7750.0000000000000000
--  Joao    |    6000 |      3 |  6000.0000000000000000
--  Ana     |   12200 |      4 | 12200.0000000000000000

N - Faça um questão livre e responda com join e subconsulta; 
