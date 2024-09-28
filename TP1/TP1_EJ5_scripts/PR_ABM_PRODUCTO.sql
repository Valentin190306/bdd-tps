SET TERM ^ ;

CREATE PROCEDURE PR_ABM_PRODUCTO ( 
    ACCION      char(1),
    ID          type of column PRODUCTO.ID,
    DESCR       type of column PRODUCTO.DESCR,
    PRE_BASE    type of column PRODUCTO.PRECIO_BASE,
    PRE_COSTO   type of column PRODUCTO.PRECIO_COSTO,
    STOCK       type of column PRODUCTO.STOCK
) 
RETURNS ( SQL_CODE char(5) )
AS 
BEGIN
    if ( ACCION <> 'A' and ACCION <> 'B' and ACCION <> 'M' ) then
        SQL_CODE = 'INV';

    else if ( ACCION = 'A' ) then
        insert into PRODUCTO(DESCR, PRECIO_BASE, PRECIO_COSTO, STOCK)
        values (:DESCR, :PRE_BASE, :PRE_COSTO, :STOCK);        
    
    else if ( ACCION = 'B' ) then
        delete from PRODUCTO where ID = :ID;
    
    else if ( ACCION = 'M' ) then
        update PRODUCTO
        set DESCR           = :DESCR, 
            PRECIO_BASE     = :PRE_BASE,
            PRECIO_COSTO    = :PRE_COSTO,
            STOCK           = :STOCK
        where ID = :ID;

    when any do begin
        SQL_CODE = sqlstate;
        insert into LOG(MSG) values (:SQL_CODE || ' : Operación fallida');
    end
    
END^

SET TERM ; ^
