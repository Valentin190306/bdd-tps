set term ^;

create trigger TRG_BDBEJEMPLAR for BEJEMPLAR
active before delete position 0
as
    declare variable VUE type of column BLIBRO.UE;
begin
    select UE from BLIBRO where ISBN = OLD.ISBN into :VUE;
    if ( VUE <> OLD.NRO ) then exception EX_EJEMPLAR;
end ^

set term ;^