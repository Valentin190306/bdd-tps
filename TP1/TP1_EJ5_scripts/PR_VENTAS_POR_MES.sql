SET TERM ^ ;

CREATE PROCEDURE PR_VENTAS_POR_MES ( anio integer ) 
RETURNS ( 
    MES01 decimal(15, 2),
    MES02 decimal(15, 2),
    MES03 decimal(15, 2),
    MES04 decimal(15, 2),
    MES05 decimal(15, 2),
    MES06 decimal(15, 2),
    MES07 decimal(15, 2),
    MES08 decimal(15, 2),
    MES09 decimal(15, 2),
    MES10 decimal(15, 2),
    MES11 decimal(15, 2),
    MES12 decimal(15, 2)
)
AS 
DECLARE VARIABLE MES integer;
declare variable VENTAS decimal(15, 2); 
BEGIN
    MES01 = 0;
    MES02 = 0;
    MES03 = 0;
    MES04 = 0;
    MES05 = 0;
    MES06 = 0;
    MES07 = 0;
    MES08 = 0;
    MES09 = 0;
    MES10 = 0;
    MES11 = 0;
    MES12 = 0;
    
    for select 
            extract(month from FECHA) as MES,
            sum(IMPORTE) as VENTAS
         from FACTURA
         where extract(year from FECHA) = :anio
         group by MES
         into :MES, :VENTAS
         
    do begin
        if      ( :MES = 1 )    then MES01 = :VENTAS;
        else if ( :MES = 2 )    then MES02 = :VENTAS;
        else if ( :MES = 3 )    then MES03 = :VENTAS;
        else if ( :MES = 4 )    then MES04 = :VENTAS;
        else if ( :MES = 5 )    then MES05 = :VENTAS;
        else if ( :MES = 6 )    then MES06 = :VENTAS;
        else if ( :MES = 7 )    then MES07 = :VENTAS;
        else if ( :MES = 8 )    then MES08 = :VENTAS;
        else if ( :MES = 9 )    then MES09 = :VENTAS;
        else if ( :MES = 10 )   then MES10 = :VENTAS;
        else if ( :MES = 11 )   then MES11 = :VENTAS;
        else if ( :MES = 12 )   then MES12 = :VENTAS;
    end
    
    suspend;
END^

SET TERM ; ^
