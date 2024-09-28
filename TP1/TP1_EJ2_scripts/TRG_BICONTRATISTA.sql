set term ^;

create trigger TRG_BICONTRATISTA for CONTRATISTA
active before insert position 0
as
begin
    if ( exists ( select * from EMPLEADO where DNI = NEW.DNI ) ) then 
        exception EX_PERSONA;
end ^

set term ;^
