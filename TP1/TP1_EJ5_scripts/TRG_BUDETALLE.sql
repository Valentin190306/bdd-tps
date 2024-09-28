SET TERM ^ ;
create TRIGGER TRG_BUDETALLE for DETALLE
ACTIVE BEFORE update POSITION 0
AS 
    declare variable CANT   type of column PRODUCTO.STOCK;
    declare variable STATE  type of column FACTURA.ESTADO;
BEGIN 
    if ( NEW.NRO <> OLD.NRO or NEW.ID <> OLD.ID ) then
        exception EX_ERROR 'No se pueden modificar las CLAVES FORANEAS';

    select ESTADO 
    from FACTURA
    where NEW.NRO = NRO
    into :STATE;
    
    if ( :STATE <> 0 ) then
        exception EX_ERROR 'No se puede modificar el DETALLE de una FACTURA finalizada/anulada';
    
    select STOCK 
    from PRODUCTO PR
    where NEW.ID = PR.ID
    into :CANT;
     
    if ( NEW.CANTIDAD > :CANT ) then
        exception EX_ERROR 'STOCK insuficiente';
END^
SET TERM ; ^
