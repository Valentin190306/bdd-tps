set term ^;

create trigger TRG_BUBEJEMPLAR for BEJEMPLAR
active before update position 0
as
begin
    if ( NEW.ISBN <> OLD.ISBN or NEW.NRO <> OLD.NRO ) then
        exception EX_PK;
end ^

set term ;^