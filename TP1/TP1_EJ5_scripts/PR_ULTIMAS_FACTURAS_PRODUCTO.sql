SET TERM ^ ;

CREATE PROCEDURE PR_ULTIMAS_FACTURAS_PRODUCTO 
RETURNS (  
    ID          type of column PRODUCTO.ID,
    DESCR       type of column PRODUCTO.DESCR,
    STOCK       type of column PRODUCTO.STOCK,
    FACTURA1    type of column FACTURA.NRO,
    FACTURA2    type of column FACTURA.NRO,
    FACTURA3    type of column FACTURA.NRO
)
AS 
BEGIN
    for select
        P.ID,
        P.DESCR,
        P.STOCK,
    
        (   select first 1 F.NRO 
            from FACTURA F 
            inner join DETALLE D on F.NRO = D.NRO 
            where D.ID = P.ID 
            order by F.NRO desc
        ) as FACTURA1,

        (   select first 1 skip 1 F.NRO 
            from FACTURA F 
            inner join DETALLE D on F.NRO = D.NRO 
            where D.ID = P.ID 
            order by F.NRO desc
        ) as FACTURA2,

        (   select first 1 skip 2 F.NRO 
            from FACTURA F 
            inner join DETALLE D on F.NRO = D.NRO 
            where D.ID = P.ID 
            order by F.NRO desc
        ) as FACTURA3

        from PRODUCTO P
        into :ID, :DESCR, :STOCK, :FACTURA1, :FACTURA2, :FACTURA3
    do suspend;
END^

SET TERM ; ^
