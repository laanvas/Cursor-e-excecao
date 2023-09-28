/*Crie uma procedure que, dado um identificador da venda (ID ), da tabela PRODUTO_VENDA_EXERCICIO, 
temos como retorno o valor financeiro do imposto.
 O parâmetro referente ao resultado do imposto deve ser passado 
 para essa procedure como um parâmetro OUT.*/

/*
	PASSO A PASSO:
	1- Recebe o ID da tabela PRODUTO_VENDA_EXERCICIO
	2- Sera retornado o valor financeiro do imposto
	

*/



create or replace PROCEDURE CALCULA_IMPOSTO
(p_ID IN produto_venda_exercicio.id%type, p_VALOR_IMPOSTO OUT FLOAT)
IS
   v_PRECO produto_venda_exercicio.preco%type;
   v_QUANTIDADE produto_venda_exercicio.quantidade%type;
   v_PERCENTUAL_IMPOSTO produto_venda_exercicio.percentual_imposto%type;
BEGIN
   SELECT PRECO, QUANTIDADE, PERCENTUAL_IMPOSTO INTO v_PRECO, v_QUANTIDADE, v_PERCENTUAL_IMPOSTO
   FROM PRODUTO_VENDA_EXERCICIO WHERE ID = p_ID;
   p_VALOR_IMPOSTO := (v_PRECO * v_QUANTIDADE) * (v_PERCENTUAL_IMPOSTO/100);
END;

