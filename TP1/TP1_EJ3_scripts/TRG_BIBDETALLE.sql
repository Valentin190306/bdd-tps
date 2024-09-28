set term ^;

create trigger TRG_BIBDETALLE for BDETALLE
active before insert position 0
as
begin
    if (( select CI from BFACTURA where NRO = NEW.NRO ) = 3 ) then
        exception EX_FACTURA;
end ^

set term ;^
