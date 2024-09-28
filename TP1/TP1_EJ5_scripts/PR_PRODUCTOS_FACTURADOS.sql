SET TERM ^ ;

CREATE PROCEDURE PR_PRODUCTOS_FACTURADOS 
RETURNS ( 
    NRO             type of column FACTURA.NRO,
    ID              type of column PRODUCTO.ID,
    DESCR           type of column PRODUCTO.DESCR,
    PRECIO_BASE     type of column PRODUCTO.PRECIO_BASE,
    PRECIO_COSTO    type of column PRODUCTO.PRECIO_COSTO,
    STOCK           type of column PRODUCTO.STOCK
)
AS 
BEGIN    
    for select F.NRO, P.ID, P.DESCR, P.PRECIO_BASE, P.PRECIO_COSTO, P.STOCK
        from FACTURA F
        inner join DETALLE D on F.NRO = D.NRO
        inner join PRODUCTO P on D.ID = P.ID
        order by F.NRO, P.ID asc
        into :NRO, :ID, :DESCR, :PRECIO_BASE, :PRECIO_COSTO, :STOCK
        
    do suspend;
END^

SET TERM ; ^
