SELECT CNPJ, SUBSTR(CNPJ, 1, 3) || '/' || SUBSTR(CNPJ, 4, 2) || '-' || SUBSTR(CNPJ,6) AS CNPJ_FORMATADO FROM CLIENTE;

//Uma procedure que realiza isso
CREATE OR REPLACE PROCEDURE formata_cnpj (
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,2) || '/' || SUBSTR(p_CNPJ,3,2) || '-' || SUBSTR(p_CNPJ,5,1);
END;

//TESTANDO O IN E OUT

SET SERVEROUTPUT ON;
DECLARE
    v_CNPJ cliente.cnpj%type;
    v_CNPJ_SAIDA cliente.cnpj%type;
BEGIN
    v_CNPJ := '1234567890';
    v_CNPJ_SAIDA := '1234567890';
    dbms_output.put_line(v_CNPJ || '        ' || v_CNPJ_SAIDA);
    FORMATA_CNPJ(v_CNPJ, v_CNPJ_SAIDA);
    dbms_output.put_line(v_CNPJ ||  '       ' || v_CNPJ_SAIDA);
END;

