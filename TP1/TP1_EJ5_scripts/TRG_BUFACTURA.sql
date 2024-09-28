SET TERM ^ ;
    
CREATE TRIGGER TRG_BUFACTURA for FACTURA 
active before update position 0
AS 
    declare variable CFECHA date;
BEGIN
    if ( NEW.NRO <> OLD.NRO ) then 
        exception EX_ERROR 'No se puede modificar el NRO de la FACTURA';
 
    select FECHA 
    from FACTURA_AUX 
    where NEW.NRO = NRO
    into :CFECHA;
 
    if (NEW.FECHA <> OLD.FECHA) then
        exception EX_ERROR 'No se puede modificar la fecha de la FACTURA';  
    
    if ( NEW.ESTADO = 0 and OLD.ESTADO <> 0 ) then 
        exception EX_ERROR 'No se puede revertir el ESTADO de la FACTURA a iniciada';
    
END^
SET TERM ; ^
