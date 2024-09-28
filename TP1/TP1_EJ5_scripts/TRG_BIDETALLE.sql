SET TERM ^ ;
create TRIGGER TRG_BIDETALLE for DETALLE 
ACTIVE BEFORE insert POSITION 0
AS 
    declare variable STATE  type of column FACTURA.ESTADO;
    declare variable CANT   type of column PRODUCTO.STOCK;
    declare variable PRECIO type of column PRODUCTO.PRECIO_BASE;
BEGIN 
    select ESTADO 
    from FACTURA 
    where NEW.NRO = NRO
    into :STATE;
    
    if ( :STATE <> 0 ) then
        exception EX_ERROR 'No se puede INSERTAR DETALLEs a una factura finalizada/anulada';
    
    select STOCK, PRECIO_BASE 
    from PRODUCTO
    where NEW.ID = ID
    into :CANT, :PRECIO;
     
    if ( NEW.CANTIDAD > :CANT ) then
        exception EX_ERROR 'No hay STOCK suficiente';
        
    else NEW.PRECIO = :PRECIO;

END^
SET TERM ; ^
