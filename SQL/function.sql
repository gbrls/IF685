CREATE FUNCTION greatestDoctor(nome_medicamento VARCHAR(255)) RETURN VARCHAR(50) IS
BEGIN 
    codigo_medicamento NUMBER(6); 
    SELECT codigo INTO codigo_medicamento FROM medicamento WHERE nome = nome_medicamento;
    CURSOR medicos_cpf IS SELECT cpf FROM medico;
    medico_cpf medico_cpf%rowtype; 
    greatest_doctor medico%nome;
    maior_uso INTEGER ;
    maior_uso := 0;
    atual_uso INTEGER;
    atual_uso := 0;
    FOR medico_cpf IN medicos_cpf LOOP
        SELECT COUNT(codigo) INTO atual_uso FROM UTILIZA WHERE codigo = codigo_medicamento AND cpf_medico = medico_cpf;
        IF atual_uso > maior_uso THEN
            maior_uso := atual_uso;
            SELECT nome INTO greatest_doctor FROM medico WHERE cpf = medico_cpf;
        END IF;
    END LOOP;
    RETURN greatest_doctor;
END;