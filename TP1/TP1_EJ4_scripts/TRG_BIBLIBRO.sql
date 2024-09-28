set term ^;

create trigger TRG_BIBLIBRO for BLIBRO
active before insert position 0
as
begin
    NEW.UE = 0;
end ^

set term ;^