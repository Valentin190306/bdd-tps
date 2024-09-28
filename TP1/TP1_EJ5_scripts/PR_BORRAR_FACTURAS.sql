SET TERM ^ ;

CREATE PROCEDURE PR_BORRAR_FACTURAS ( 
    fecha_desde type of column FACTURA.FECHA,
    fecha_hasta type of column FACTURA.FECHA
) 
AS 
BEGIN
    if ( fecha_desde is null or fecha_hasta is null ) then exception EX_ERROR 'Fechas ingresadas invalidas';
    else
        delete from FACTURA
        where FECHA 
        between :fecha_desde and :fecha_hasta;
END^

SET TERM ; ^
