
SET TERM ^ ;

CREATE TRIGGER TRG_BIPRODUCTO for PRODUCTO
active before insert position 0
AS 
BEGIN 
    NEW.ID = gen_id(GEN_ID_PRODUCTO, 1);
END^

SET TERM ; ^
