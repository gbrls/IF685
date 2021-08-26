
CONSULTA COM GROUP BY

SELECT SUPERVISOR, COUNT(*)
FROM MEDICO
WHERE SUPERVISOR IS NOT NULL
GROUP BY SUPERVISOR;


--INNER JOIN COM GROUP BY
--mostra o nome do supervisor e a quantidade de supervisionados desde que ele supervisione mais de 2 medicos. 

SELECT M1.NOME AS SUPERVISOR, COUNT(M1.NOME) AS QTD_SUPERVISIONADO
FROM MEDICO M1 INNER JOIN
MEDICO M2 ON M2.SUPERVISOR = M1.CPF
GROUP BY M1.NOME
HAVING  COUNT(M1.NOME) > 2;

SELECT NOME
FROM PACIENTE
WHERE CPF NOT IN (SELECT CPF_PACIENTE
FROM ULTILIZA));

SELECT NOME
FROM PACIENTE
WHERE CPF IN (SELECT CPF
FROM ARTE);

SELECT NOME FROM PACIENTE
UNION
SELECT NOME FROM MEDICO;


--subconsulta tipo tabela considerando que um paciente pode ser tratado por vários medicos que moram na mesma rua e cidade
SELECT pac.nome, med.nome FROM  trata tr
 INNER JOIN paciente pac ON pac.cpf = tr.cpf_paciente 
INNER JOIN medico med ON med.cpf = tr.cpf_medico
WHERE  (pac.cidade, pac.rua) IN 
      ( SELECT cidade, rua FROM medico   WHERE cpf = med.cpf);


SELECT T1.NOME AS NOME, COUNT(T2.CPF_PACIENTE) AS QUANT_TRATAMENTOS
FROM (MEDICO T1 LEFT JOIN TRATA T2 ON T1.CPF = T2.CPF_MEDICO)
GROUP BY T1.NOME;
