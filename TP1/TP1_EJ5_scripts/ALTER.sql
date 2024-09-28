--* agregue la columna PRECIO _BASE a tabla producto (use el mismo tipo de dato que
--  DETALLE.PRECIO), para guardar allí el precio de referencia del producto
--* agregue la columna PRECIO_COSTO a tabla producto (use el mismo tipo de dato que
--  DETALLE.PRECIO), para guardar allí el precio de costo del producto
--* agregue la columna ESTADO a tabla factura (tipo SMALLINT), la cual indica el estado de la factura (0
--  iniciada, 1 finalizada, 2 anulada)
--* agregue la columna FECHA a tabla factura (tipo DATE), la cual indica la fecha de la factura.

alter table DETALLE 
    drop PRECIO,
    add PRECIO numeric(10, 2) default 0 not null;
    
alter table FACTURA
    drop IMPORTE,
    add IMPORTE numeric(10, 2) default 0;

alter table PRODUCTO
    drop DESCR, 
    add DESCR varchar(100) default '-',
    DROP PRECIO_BASE,
    add PRECIO_BASE numeric(10, 2) default 0 not null,
    drop STOCK,
    drop PRECIO_COSTO,
    add PRECIO_COSTO numeric(10, 2) default 0 not null,
    add STOCK bigint default 0 not null;
    
    
alter table PRODUCTO
    add constraint PRECIO_BASE_PRODUCTO check (PRECIO_BASE > 0);
  
alter table PRODUCTO
    add PRECIO_COSTO numeric(10, 2) not null,
    add constraint PRECIO_COSTO_PRODUCTO check (PRECIO_COSTO > 0);
    
alter table FACTURA
    add ESTADO  smallint default 0,
    add FECHA   date not null;