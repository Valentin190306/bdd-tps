SET TERM ^ ;

CREATE TRIGGER TRG_ADFACTURA for FACTURA
active after delete position 0
AS 
BEGIN 
    delete from DETALLE
    where OLD.NRO = NRO;
    
    delete from FACTURA_AUX
    where OLD.NRO = NRO; 
END^

SET TERM ; ^
