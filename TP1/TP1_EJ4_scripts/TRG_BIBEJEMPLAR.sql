set term ^;

create trigger TRG_BIBEJEMPLAR for BEJEMPLAR
active before insert position 0
as
    declare variable VUE type of column BLIBRO.UE;
begin
    select UE from BLIBRO where ISBN = NEW.ISBN into :VUE;
    NEW.NRO = VUE + 1;
end ^

set term ;^