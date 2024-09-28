set term ^;

create trigger TRG_AIBEJEMPLAR for BEJEMPLAR
active after insert position 0
as
begin
    update BLIBRO set UE = UE + 1 where ISBN = NEW.ISBN;
end ^

set term ;^