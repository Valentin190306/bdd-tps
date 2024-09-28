SET TERM ^ ;

CREATE PROCEDURE PR_TEST_INSERT_GEN( CANTIDAD integer )
returns ( SQLST char(5) )
AS 
    declare variable PCH_DESCR      type of column PRODUCTO.DESCR;
    declare variable PCH_PRE_BASE   type of column PRODUCTO.PRECIO_BASE;
    declare variable PCH_PRE_COSTO  type of column PRODUCTO.PRECIO_COSTO;
    declare variable PCH_STOCK      type of column PRODUCTO.STOCK;
    
    declare variable I              integer default 0;
    
BEGIN
    if (CANTIDAD > 0) then begin
    
        while (I < CANTIDAD) do begin
            
            PCH_DESCR       = 'PROD' || cast(I as varchar(5)); 
            PCH_PRE_BASE    = cast(rand() * 10000 + 1 as decimal(10, 2));
            PCH_PRE_COSTO   = PCH_PRE_BASE + cast(rand() * 5000 + 1 as decimal(10, 2));
            PCH_STOCK       = 1000; 
            
            execute procedure PR_ABM_PRODUCTO('A', 1, PCH_DESCR, PCH_PRE_BASE, PCH_PRE_COSTO, PCH_STOCK)
            returning_values SQLST;
            
            I = I + 1;
        end  
    end
    
END^

SET TERM ; ^
