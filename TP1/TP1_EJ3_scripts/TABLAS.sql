create table BPRODUCTO (
    ID integer not null,
    DESCRIPCION varchar(100) not null,
    STOCK integer,
    constraint pk_bproducto primary key (ID)
);

create table BFACTURA (
    NRO integer not null,
    IMPORTE double precision,
    CI integer default 0 not null,
    constraint pk_bfactura primary key (NRO)
);

create table BDETALLE (
    NRO integer not null,
    ID integer not null,
    CANTIDAD integer not null,
    PRECIO double precision not null,
    constraint pk_bdetalle primary key (NRO, ID),
    constraint fk_bdetalle_af foreign key (NRO) references BFACTURA,
    constraint fk_bdetalle_ap foreign key (ID) references BPRODUCTO
);
