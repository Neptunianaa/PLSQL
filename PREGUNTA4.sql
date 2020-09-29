 -- 1. INGRESAR FECHAS DESDE Y HASTA DESEADAS DENTRO DE PARAMETROS DE PROCEDIMIENTO ALMACENADO
 
 EXEC buscar_ventas('10/03/20','29/09/20');
 
 
 
 CREATE OR REPLACE PROCEDURE buscar_ventas(fechainicio date,fechafinal date)
 AS
 
 BEGIN
    DECLARE CURSOR cur IS
    SELECT PEDIDO_ID PEDIDO,PRECIO,TIPO_PAGO ,FECHA_VENTA FECHA FROM FACTURA WHERE FECHA_VENTA BETWEEN fechainicio AND fechafinal;
    BEGIN
              FOR venta IN cur LOOP
                dbms_output.put_line ('N° pedido: '|| venta.PEDIDO ||' Total: '|| venta.PRECIO || ' FORMA PAGO: ' || venta.TIPO_PAGO || ' Fecha: ' || venta.FECHA  );
              END LOOP;
            END;            
 END;