-- 1.  ANTES DE EJECUTAR HAY QUE CREAR UN PEDIDO - OJO CON PONER CANTIDAD MAYOR A 0 CUANDO NO SE ENVÍA ID DE PRODUCTO
        INSERT INTO PEDIDO
        (ALIMENTO_ID,CANT_ALIMENTO,BEBESTIBLE_ID,CANT_BEBESTIBLE,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1,ACOMPANAMIENTO_ID_2,CANT_ACOMPANAMIENTO_2,COMBO_ID,CANT_COMBO)
        VALUES 
        (null,0,null,0,5,1,null,0,22,1);
  
-- 2.  OBTENER ULTIMA ID CREADA
        SELECT PEDIDO_ID FROM PEDIDO WHERE ROWNUM = 1 ORDER BY PEDIDO_ID DESC 
    
-- 3.  EJECUTAR PROCEDIMIENTO 
        EXEC total_pedido(24);


CREATE OR REPLACE PROCEDURE  total_pedido(numeroPedido number)
         AS
         TOTALCOMPRA number(10);
         OUT_CANT_COMBO number(5);
         OUT_CANT_BEBESTIBLES number(5);
         OUT_CANT_ALIMENTOS number(5);
         OUT_CANT_ACOMPANAMIENTOS_1 number(5);
         OUT_CANT_ACOMPANAMIENTOS_2 number(5);
         FACTURA_ID_INSERTADA number(5);
         BEGIN   
                TOTALCOMPRA := 0;

                -- LE DOY VALOR A LAS VARIABLES PARA LOS IF --------
                SELECT 
                PEDIDO.CANT_COMBO, PEDIDO.CANT_BEBESTIBLE, PEDIDO.CANT_ALIMENTO, PEDIDO.CANT_ACOMPANAMIENTO_1,PEDIDO.CANT_ACOMPANAMIENTO_2 
                INTO 
                OUT_CANT_COMBO,OUT_CANT_BEBESTIBLES,OUT_CANT_ALIMENTOS,OUT_CANT_ACOMPANAMIENTOS_1,OUT_CANT_ACOMPANAMIENTOS_2
                FROM PEDIDO  WHERE PEDIDO_ID = numeroPedido;
                  
                
                 IF OUT_CANT_COMBO >0 THEN   
                    SELECT  (OUT_CANT_COMBO * PRECIOS.PRECIO) + TOTALCOMPRA INTO TOTALCOMPRA
                    FROM PEDIDO
                    INNER JOIN COMBOS
                    ON PEDIDO.COMBO_ID = COMBOS.COMBO_ID
                    INNER JOIN PRECIOS
                    ON PRECIOS.PRECIO_ID = COMBOS.PRECIO_ID
                    WHERE PEDIDO_ID = numeroPedido;
                 END IF;
            
                 IF OUT_CANT_ALIMENTOS >0 THEN   
                    SELECT  (OUT_CANT_ALIMENTOS * PRECIOS.PRECIO) + TOTALCOMPRA  INTO TOTALCOMPRA
                    FROM PEDIDO
                    INNER JOIN ALIMENTOS
                    ON PEDIDO.ALIMENTO_ID = ALIMENTOS.ALIMENTO_ID
                    INNER JOIN PRECIOS
                    ON PRECIOS.PRECIO_ID = ALIMENTOS.PRECIO_ID
                    WHERE PEDIDO_ID = numeroPedido;
                 END IF;
            
                 IF OUT_CANT_BEBESTIBLES >0 THEN   
                    SELECT  (OUT_CANT_BEBESTIBLES * PRECIOS.PRECIO) + TOTALCOMPRA INTO TOTALCOMPRA
                    FROM PEDIDO
                    INNER JOIN BEBESTIBLES
                    ON PEDIDO.BEBESTIBLE_ID = BEBESTIBLES.BEBESTIBLE_ID
                    INNER JOIN PRECIOS
                    ON PRECIOS.PRECIO_ID = BEBESTIBLES.PRECIO_ID
                    WHERE PEDIDO_ID = numeroPedido;
                 END IF;
            
                 IF OUT_CANT_ACOMPANAMIENTOS_1 >0 THEN  
                    SELECT  (OUT_CANT_ACOMPANAMIENTOS_1 * PRECIOS.PRECIO) + TOTALCOMPRA INTO TOTALCOMPRA
                    FROM PEDIDO
                    INNER JOIN ACOMPANAMIENTOS
                    ON PEDIDO.ACOMPANAMIENTO_ID_1 = ACOMPANAMIENTOS.ACOMPANAMIENTO_ID
                    INNER JOIN PRECIOS
                    ON PRECIOS.PRECIO_ID = ACOMPANAMIENTOS.PRECIO_ID
                    WHERE PEDIDO_ID = numeroPedido;
                 END IF;
            
                 IF OUT_CANT_ACOMPANAMIENTOS_2 >0 THEN  
                    SELECT  (OUT_CANT_ACOMPANAMIENTOS_2 * PRECIOS.PRECIO) + TOTALCOMPRA INTO TOTALCOMPRA
                    FROM PEDIDO
                    INNER JOIN ACOMPANAMIENTOS
                    ON PEDIDO.ACOMPANAMIENTO_ID_2 = ACOMPANAMIENTOS.ACOMPANAMIENTO_ID
                    INNER JOIN PRECIOS
                    ON PRECIOS.PRECIO_ID = ACOMPANAMIENTOS.PRECIO_ID
                    WHERE PEDIDO_ID = numeroPedido;
                 END IF;
                            
          -- POSTERIOR AL CALCULO DEL TOTAL DE LA FACTURA/BOLETA SE CREA NUEVO REGISTRO INDICANDO VENTA  (por ahora solo tipo pago 1)
              INSERT INTO FACTURA(PEDIDO_ID,PRECIO,TIPO_PAGO,FECHA_VENTA)
              VALUES (numeroPedido,TOTALCOMPRA,1,sysdate)
              RETURNING FACTURA_ID INTO FACTURA_ID_INSERTADA ;
              
           dbms_output.put_line ('Se ha ingresado factura/boleta'|| FACTURA_ID_INSERTADA||' con un total de: '|| TOTALCOMPRA);
     END;
    
    


    