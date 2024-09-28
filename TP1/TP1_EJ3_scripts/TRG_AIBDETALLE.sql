set term ^;

create trigger TRG_AIBDETALLE for BDETALLE
active after insert position 0
as
begin
    update BFACTURA set CI = CI + 1 where NRO = NEW.NRO;
end ^

set term ;^
