set term ^;

create trigger TRG_ADBDETALLE for BDETALLE
active after delete position 0
as
begin
    update BFACTURA set CI = CI - 1 where NRO = OLD.NRO;
end ^

set term ;^
