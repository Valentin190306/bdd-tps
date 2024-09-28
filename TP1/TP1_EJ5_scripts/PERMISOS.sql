-- Crear rol
create role TP5USER;

--Crear usuario
create user tp5user01 password 'tp5user01';

--Entrega de permisos miscelaneos al rol
grant TP5USER to tp5user01;

grant usage on exception EX_ERROR to TP5USER;

grant usage on sequence GEN_ID_PRODUCTO to TP5USER;
grant usage on sequence GEN_NRO_FACTURA to TP5USER;

--Entrega de permisos al rol sobre tablas
grant select on FACTURA to TP5USER;
grant select on PRODUCTO to TP5USER;
grant select on DETALLE to TP5USER;

--Entrega de permisos a los triggers sobre tablas
grant select on FACTURA to trigger TRG_ADDETALLE;
grant update on PRODUCTO to trigger TRG_ADDETALLE;

grant delete on DETALLE to trigger TRG_ADFACTURA;
grant delete on FACTURA_AUX to trigger TRG_ADFACTURA;

grant select, update on PRODUCTO to trigger TRG_AIDETALLE;
grant update on FACTURA to trigger TRG_ADDETALLE;

grant insert on FACTURA_AUX to trigger TRG_AIFACTURA;

grant select, update on PRODUCTO to trigger TRG_AUFACTURA;
grant select on DETALLE to trigger TRG_AUFACTURA;

grant select on FACTURA to trigger TRG_BIDETALLE;
grant select on PRODUCTO to trigger TRG_BIDETALLE;

grant select on FACTURA_AUX to trigger TRG_BIFACTURA;

grant select on FACTURA to trigger TRG_BUDETALLE;
grant select on PRODUCTO to trigger TRG_BUDETALLE;

grant select on FACTURA_AUX to trigger TRG_BUFACTURA;

--Entrega de permisos a los prcedimientos
grant insert, delete, update on PRODUCTO to procedure PR_ABM_PRODUCTO;

grant insert on FACTURA to procedure PR_ALTA_FACTURAS_CANTIDAD;

grant delete on FACTURA to procedure PR_BORRAR_FACTURAS;

grant select on FACTURA to procedure PR_FACTURAS_PRODUCTOS_M1000;

grant select on FACTURA to procedure PR_IMPORTE_ENTRE_INTERVALO;

grant select on FACTURA to procedure PR_INTERVALO_FACTURAS;

grant select on FACTURA to procedure PR_PRODUCTOS_FACTURADOS;
grant select on DETALLE to procedure PR_PRODUCTOS_FACTURADOS;
grant select on PRODUCTO to procedure PR_PRODUCTOS_FACTURADOS;

grant select on FACTURA to procedure PR_TOTAL_FACTURADO_PRODUCTO;
grant select on DETALLE to procedure PR_TOTAL_FACTURADO_PRODUCTO;
grant select on PRODUCTO to procedure PR_TOTAL_FACTURADO_PRODUCTO;

grant select on FACTURA to procedure PR_ULTIMAS_FACTURAS_PRODUCTO;
grant select on DETALLE to procedure PR_ULTIMAS_FACTURAS_PRODUCTO;
grant select on PRODUCTO to procedure PR_ULTIMAS_FACTURAS_PRODUCTO;

grant select on FACTURA to procedure PR_VENTAS_POR_MES;

--Entrega de permisos al rol sobre procedimentos
grant execute on procedure PR_ABM_PRODUCTO              to TP5USER;
grant execute on procedure PR_ALTA_FACTURAS_CANTIDAD    to TP5USER;
grant execute on procedure PR_BORRAR_FACTURAS           to TP5USER;
grant execute on procedure PR_FACTURAS_PRODUCTOS_M1000  to TP5USER;
grant execute on procedure PR_IMPORTE_ENTRE_INTERVALO   to TP5USER;
grant execute on procedure PR_INTERVALO_FACTURAS        to TP5USER;
grant execute on procedure PR_PRODUCTOS_FACTURADOS      to TP5USER;
grant execute on procedure PR_TOTAL_FACTURADO_PRODUCTO  to TP5USER;
grant execute on procedure PR_ULTIMAS_FACTURAS_PRODUCTO to TP5USER;
grant execute on procedure PR_VENTAS_POR_MES            to TP5USER;




