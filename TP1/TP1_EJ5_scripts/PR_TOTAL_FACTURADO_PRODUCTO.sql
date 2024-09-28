SET TERM ^ ;

CREATE PROCEDURE PR_TOTAL_FACTURADO_PRODUCTO (  
    factura_desde type of column FACTURA.NRO,
    factura_hasta type of column FACTURA.NRO
) 
RETURNS ( 
    ID              type of column PRODUCTO.ID,
    DESCR           type of column PRODUCTO.DESCR,
    PRECIO_BASE     type of column PRODUCTO.PRECIO_BASE,
    PRECIO_COSTO    type of column PRODUCTO.PRECIO_COSTO,
    STOCK_FACTURADO bigint,
    TOTAL_FACTURADO decimal(10,2)
)
AS 
BEGIN
    STOCK_FACTURADO = 0;
    TOTAL_FACTURADO = 0;

    if ( factura_desde is null or factura_hasta is null )   then exception EX_ERROR 'Ingrese NROs de FACTURA valido';
    else if ( factura_desde > factura_hasta )               then exception EX_ERROR 'Ingrese NROs de FACTURA valido';
    else
        for select P.ID, P.DESCR, P.PRECIO_BASE, P.PRECIO_COSTO, 
            sum(D.CANTIDAD), sum(D.CANTIDAD * P.PRECIO_BASE)
            from FACTURA F
            inner join DETALLE D on F.NRO = D.NRO
            inner join PRODUCTO P on D.ID = P.ID
            where F.NRO 
            between :factura_desde and :factura_hasta
            group by P.ID, P.DESCR, P.PRECIO_BASE, P.PRECIO_COSTO
            order by P.ID asc
            into :ID, :DESCR, :PRECIO_BASE, :PRECIO_COSTO, :STOCK_FACTURADO, :TOTAL_FACTURADO
            
        do suspend;
END^

SET TERM ; ^
