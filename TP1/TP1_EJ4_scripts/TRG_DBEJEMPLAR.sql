set term ^;

create trigger TRG_ADBEJEMPLAR for BEJEMPLAR
active after delete position 0
as
begin
    update BLIBRO set UE = UE - 1 where ISBN = OLD.ISBN;
end ^

set term ;^