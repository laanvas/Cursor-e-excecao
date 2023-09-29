DECLARE 
    v_SEGMERCADO CLIENTE.SEGMERCADO_ID%type := 4; 
    v_NUMCLI INTEGER; 
BEGIN 
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE; 
    FOR v_ID IN 1..v_NUMCLI LOOP 
        ATUALIZAR_SEGMERCADO(v_ID, v_SEGMERCADO); 
    END LOOP; 
END;

EXECUTE incluir_cliente(30,'Loja MM', '31456786756534236',2,60000)

SELECT * FROM cliente

//O Cursor é uma estrutura implementada no Oracle que permite uma interatividade linha a linha
//através de uma determinada ordem.

/*
Fases:
	DECLARAÇÃO
	ABERTURA
	PERCORRER O CURSOR
	FECHA O CURSOR
*/

//Exemplo de cursor não funcional
/*
	DECLARE @NOME VARCHAR2(10)
	DECLARE CURSOR1 CURSOR FOR SELECT NOME FROM TABELA1;
	
*/
-----------------------------------------------------------------------------------------------
CREATE TABLE membros(
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(255),
    EMAIL VARCHAR2(255)    
)


SET SERVEROUTPUT ON;
DECLARE
   CURSOR CURSO_1 IS
      SELECT NOME FROM MEMBROS;
   nome MEMBROS.NOME%TYPE;
BEGIN
   OPEN CURSO_1;
   LOOP
      FETCH CURSO_1 INTO nome;
      EXIT WHEN CURSO_1%NOTFOUND;  -- Saia do loop quando não houver mais dados para buscar.
      
      -- Aqui você pode realizar ações com o valor de "nome".
      DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
   END LOOP;
   
   CLOSE CURSO_1;
END;
/
---------------------------------------------------------------------------------------------------

CREATE TABLE membros(
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(255),
    EMAIL VARCHAR2(255)    
)


SET SERVEROUTPUT ON;
DECLARE
    CURSOR CURSOR_2 IS
        SELECT * FROM MEMBROS ORDER BY ID DESC;
    id membros.id%type;
    nome membros.NOME%type;
    email membros.EMAIL%type;
BEGIN
    OPEN CURSOR_2;
    LOOP
        FETCH CURSOR_2 INTO id, nome, email;

        EXIT WHEN CURSOR_2%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID: ' || id || ', NOME: ' || nome || ', EMAIL: ' || email);
    END LOOP;

    CLOSE CURSOR_2;
END;
/
