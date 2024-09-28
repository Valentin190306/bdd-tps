set term ^;

create trigger TRG_BUCONTRATISTA for CONTRATISTA
active before update position 0
as
begin
    if ( NEW.DNI <> OLD.DNI ) then exception EX_DNI;
end ^

set term ;^
