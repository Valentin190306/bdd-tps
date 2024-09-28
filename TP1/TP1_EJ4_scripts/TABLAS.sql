create table BLIBRO (
    ISBN char(20) not null primary key,
    TITULO varchar(100) not null,
    UE integer default 0
);

create table BEJEMPLAR (
    ISBN char(20) not null,
    NRO integer not null,
    UBICACION varchar(20),
    constraint pk_bejemplar primary key (ISBN, NRO),
    constraint fk_bejemplar_l foreign key (ISBN) references blibro (ISBN)
);

