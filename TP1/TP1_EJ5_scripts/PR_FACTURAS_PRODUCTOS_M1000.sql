SET TERM ^ ;

CREATE PROCEDURE PR_FACTURAS_PRODUCTOS_M1000 
RETURNS (  
    NRO     type of column FACTURA.NRO,
    ESTADO  type of column FACTURA.ESTADO,
    FECHA   type of column FACTURA.FECHA,
    IMPORTE type of column FACTURA.IMPORTE
)
AS 
BEGIN
    for select F.NRO, F.ESTADO, F.FECHA, F.IMPORTE
        from FACTURA F
        inner join PR_PRODUCTOS_FACTURADOS PR on F.NRO = PR.NRO
        where PR.STOCK < 1000
        order by F.NRO, PR.ID asc
        rows 1 to 1
        into :NRO, :ESTADO, :FECHA, :IMPORTE
    do suspend;
END^

SET TERM ; ^
