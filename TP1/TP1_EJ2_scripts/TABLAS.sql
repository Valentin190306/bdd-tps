create table PERSONA (
    DNI integer not null,
    APE_NOM varchar(100),
    constraint pk_persona primary key (DNI)
);

create table CONTRATISTA (
    DNI integer not null,
    VALOR_HORA double precision,
    constraint pk_contratista_per primary key (DNI),
    constraint fk_contratista_per foreign key (DNI) references PERSONA
);

create table EMPLEADO (
    DNI integer not null,
    SALSARIO double precision,
    constraint pk_empleado_per primary key (DNI),
    constraint fk_empleado_per foreign key (DNI) references PERSONA
);
