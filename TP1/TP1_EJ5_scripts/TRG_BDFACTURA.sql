
SET TERM ^ ;

CREATE TRIGGER TRG_BDFACTURA for FACTURA
active before delete position 0
AS 
BEGIN 
    if ( OLD.ESTADO <> 0 ) then
        exception EX_ERROR 'No se puede borrar una FACTURA finalizada/anulada';
END^

SET TERM ; ^
