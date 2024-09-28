SET TERM ^ ;

CREATE TRIGGER TRG_BIFACTURA for FACTURA
active before insert position 0
AS 
    declare variable FECHAM1 type of column FACTURA.FECHA;
BEGIN 
    if ( exists (select * from FACTURA_AUX)) then
        select FECHA
        from FACTURA_AUX
        where NRO = NEW.NRO - 1
        into :FECHAM1;
    else
        FECHAM1 = NULL;
    
    if ( FECHAM1 is not NULL and NEW.FECHA < FECHAM1 ) then
        exception EX_ERROR 'FECHA invalida';
        
    else begin
        NEW.NRO = gen_id(GEN_NRO_FACTURA, 1);
        NEW.ESTADO = 0;
    end 
END^

SET TERM ; ^
