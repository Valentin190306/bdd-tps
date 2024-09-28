set term ^;

create trigger TRG_BICLIENTE for CLIENTE
active before insert position 0
as
begin
    NEW.ID = gen_id(GEN_CLIENTE_ID, 1);
end ^

set term ;^
