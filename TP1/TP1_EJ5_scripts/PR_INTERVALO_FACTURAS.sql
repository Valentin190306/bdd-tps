SET TERM ^ ;

CREATE PROCEDURE PR_INTERVALO_FACTURAS (  
    importe_desde type of column FACTURA.IMPORTE,
    importe_hasta type of column FACTURA.IMPORTE 
) 
RETURNS (  
    NRO     type of column FACTURA.NRO,
    ESTADO  type of column FACTURA.ESTADO,
    FECHA   type of column FACTURA.FECHA,
    IMPORTE type of column FACTURA.IMPORTE 
)
AS 
BEGIN
    if ( importe_desde is null or importe_hasta is null ) then exception EX_ERROR 'Ingrese NROs de FACTURAs validos';
    
    else   
        for select * 
            from FACTURA
            where IMPORTE 
            between :importe_desde and :importe_hasta
            into :NRO, :ESTADO, :FECHA, :IMPORTE
        do suspend;

END^

SET TERM ; ^
