set term ^;

create trigger TRG_BUCLIENTE for CLIENTE
active before update position 0
as 
begin
    if ( NEW.ID <> OLD.ID ) then exception EX_CLIENTE1;
end ^

set term ;^
