
SET TERM ^ ;

CREATE TRIGGER TRG_BUPRODUCTO for PRODUCTO
active before update position 0
AS 
BEGIN 
    if ( NEW.ID <> OLD.ID ) then exception EX_ERROR 'No se puede modificar el ID de PRODUCTO';
END^

SET TERM ; ^
