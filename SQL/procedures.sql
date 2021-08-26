--nome(s) do(s) paciente(s) "residente(s)" de um quarto a partir do seu Número ##
CREATE OR REPLACE PROCEDURE Residentes_do_Quarto(quartoNumero INTEGER ) IS 
    CURSOR c1 IS 
    SELECT nome from paciente where n_quarto=quartoNumero;
    rec1 c1%rowtype;
    begin
        for rec1 in c1 loop
        dbms_output.put_line(rec1.nome);
    end loop;
end;