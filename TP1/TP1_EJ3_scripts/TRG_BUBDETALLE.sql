set term ^;

create trigger TRG_BUBDETALLE for BDETALLE
active before update position 0
as
begin
    if ( NEW.NRO <> OLD.NRO and ( select CI from BFACTURA where NRO = NEW.NRO ) = 3 ) then
        exception EX_FACTURA;
end ^

set term ;^
