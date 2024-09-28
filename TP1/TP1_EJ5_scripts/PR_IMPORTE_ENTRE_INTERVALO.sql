SET TERM ^ ;

CREATE PROCEDURE PR_IMPORTE_ENTRE_INTERVALO
RETURNS (  
    FAC100    int,
    FAC1000   int,
    FAC10000  int,
    FAC100000 int
)
AS 
BEGIN
    select
        sum(case 
            when IMPORTE <= 100 
            then 1 else 0 end
            ) as FAC100,
        
        sum(case 
            when IMPORTE > 100 and IMPORTE <= 1000 
            then 1 else 0 end
            ) AS FAC1000,
            
        sum(case 
            when IMPORTE > 1000 and IMPORTE <= 10000 
            then 1 else 0 end
            ) as FAC10000,
        
        sum(case 
            when IMPORTE > 10000 and IMPORTE <= 100000 
            then 1 else 0 end
            ) as FAC100000
    from FACTURA
    into :FAC100, :FAC1000, :FAC10000, :FAC100000;
    
    suspend;
END^

SET TERM ; ^
