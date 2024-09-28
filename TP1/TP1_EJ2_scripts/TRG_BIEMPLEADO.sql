set term ^;

create trigger TRG_BIEMPLEADO for EMPLEADO
active before insert position 0
as
begin
    if ( exists ( select * from CONTRATISTA
        where DNI = NEW.DNI ) ) then exception EX_PERSONA;
end ^

set term ;^
