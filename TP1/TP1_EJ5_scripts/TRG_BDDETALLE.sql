SET TERM ^ ;
create TRIGGER TRG_BDDETALLE for DETALLE
ACTIVE BEFORE delete POSITION 0
AS 
    declare variable STATE type of column FACTURA.ESTADO;
BEGIN 
    select ESTADO 
    from FACTURA 
    where OLD.NRO = NRO
    into :STATE;
    
    if ( :STATE <> 0 ) then
        exception EX_ERROR 'No se puede borrar el DETALLE de una FACTURA finalizada/anulada';
END^
SET TERM ; ^
