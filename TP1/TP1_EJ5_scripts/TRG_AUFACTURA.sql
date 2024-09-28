SET TERM ^ ;

CREATE TRIGGER TRG_AUFACTURA for FACTURA 
active after update position 0
AS 
    declare variable IDP    type of column PRODUCTO.ID;
    declare variable CANT   type of column DETALLE.CANTIDAD;
BEGIN 
    if ( OLD.ESTADO <> 2 and NEW.ESTADO = 2 ) then begin
        for select P.ID, D.CANTIDAD
            from PRODUCTO P
            inner join DETALLE D on D.ID = P.ID
            where D.NRO = NEW.NRO
            into :IDP, :CANT 
        do begin
            update PRODUCTO
            set STOCK = STOCK + :CANT
            where ID = :IDP;
        end
    end
    
    else if ( OLD.ESTADO = 2 and NEW.ESTADO = 1 ) then begin
        for select P.ID, D.CANTIDAD
            from PRODUCTO P
            inner join DETALLE D on D.ID = P.ID
            where D.NRO = NEW.NRO
            into :IDP, :CANT 
        do begin
            update PRODUCTO
            set STOCK = STOCK - :CANT
            where ID = :IDP;
        end
    end
END^

SET TERM ; ^
