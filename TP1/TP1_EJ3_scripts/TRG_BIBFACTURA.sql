set term ^;

create trigger TRG_BIBFACTURA for BFACTURA
active before insert position 0
as
begin
    NEW.CI = 0;
end ^

set term ;^
