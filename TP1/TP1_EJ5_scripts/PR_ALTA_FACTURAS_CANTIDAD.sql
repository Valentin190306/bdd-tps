SET TERM ^ ;

CREATE PROCEDURE PR_ALTA_FACTURAS_CANTIDAD ( 
    CANTIDAD    int,
    FECHA_DESDE date
) 
AS 
declare variable i int;
BEGIN
    i = 0;
    
    if (CANTIDAD > 0) then
        while (i < CANTIDAD) do
        begin
            insert into FACTURA (NRO, ESTADO, FECHA, IMPORTE)
            values (:i, 0, :FECHA_DESDE + :i, 0);
            
            i = i + 1;
        end
END^

SET TERM ; ^
