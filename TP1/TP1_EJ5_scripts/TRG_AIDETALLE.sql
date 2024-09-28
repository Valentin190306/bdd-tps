
SET TERM ^ ;

CREATE TRIGGER TRG_AIDETALLE for DETALLE
active after insert position 0
AS 
    declare variable PRECIO type of column PRODUCTO.PRECIO_BASE;
BEGIN 
    select PRECIO_BASE
    from PRODUCTO 
    where NEW.ID = ID
    into :PRECIO;

    update PRODUCTO  
    set STOCK = STOCK - NEW.CANTIDAD
    where NEW.ID = ID; 
    
    update FACTURA 
    set IMPORTE = IMPORTE + (NEW.CANTIDAD * :PRECIO)
    where NEW.NRO = NRO;
END^

SET TERM ; ^
