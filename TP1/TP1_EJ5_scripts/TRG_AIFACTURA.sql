SET TERM ^ ;

CREATE TRIGGER TRG_AIFACTURA for FACTURA 
active after insert position 0
AS 
BEGIN 
    insert into FACTURA_AUX(NRO, FECHA) values (NEW.NRO, NEW.FECHA);
END^

SET TERM ; ^
