set term ^;

create trigger TRG_AUBDETALLE for BDETALLE
active after update position 0
as
begin
    if ( NEW.NRO <> OLD.NRO ) then 
        begin
            update BFACTURA set CI = CI - 1 where NRO = OLD.NRO;
            update BFACTURA set CI = CI + 1 where NRO = NEW.NRO;
        end
end ^

set term ;^
