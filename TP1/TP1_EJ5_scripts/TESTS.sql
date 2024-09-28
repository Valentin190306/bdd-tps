-- Ejecutar solo seleccionados, no desde la barra de acciones

execute procedure PR_FACTURAS_PRODUCTOS_M1000;

execute procedure PR_IMPORTE_ENTRE_INTERVALO;

execute procedure PR_PRODUCTOS_FACTURADOS;

execute procedure PR_ULTIMAS_FACTURAS_PRODUCTO;

execute procedure PR_VENTAS_POR_MES(2024);

execute procedure PR_ABM_PRODUCTO('A', 1, 'Arroz, 500 gr', 1500.0, 1799.0, 500);

execute procedure PR_ABM_PRODUCTO('M', 1002, 'Arroz, 500 gr', 1400.0, 1799.0, 500);

execute procedure PR_ABM_PRODUCTO('B', 1013, 'Arroz, 500 gr', 1500.0, 1799.0, 500);

execute procedure PR_TEST_INSERT_GEN(10);

execute procedure PR_ALTA_FACTURAS_CANTIDAD(1, current_date);

delete from PRODUCTO a;

delete from FACTURA a;

delete from DETALLE a;

insert into DETALLE(NRO, ID, CANTIDAD, PRECIO) 
values  (1002, 1056, 5, 0);

update FACTURA set ESTADO = 0 where NRO = 1002;