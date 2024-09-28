SET TERM ^ ;
create TRIGGER TRG_ADDETALLE for DETALLE
active after delete POSITION 0
AS 
declare variable STATE type of column FACTURA.ESTADO;
BEGIN 
    select ESTADO
    from FACTURA
    where OLD.NRO = NRO
    into :STATE;
    
    if ( :STATE = 0 ) then
        update PRODUCTO
        set STOCK = STOCK + OLD.CANTIDAD
        where OLD.ID = ID;
END^
SET TERM ; ^
