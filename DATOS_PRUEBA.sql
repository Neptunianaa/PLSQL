
-------------------------------------------- INSERTAR VALORES ------------------------------------------------------------------
-- INSERTAR PRECIOS-------------------------------------------------------------------------------------------------------------
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (3990);
            
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (5990);
        
             INSERT INTO PRECIOS
             (PRECIO)
             VALUES
             (7990);
             
             INSERT INTO PRECIOS
             (PRECIO)
             VALUES
             (9990);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (11990);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (1990);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (990);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (2990);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (3490);
             
             INSERT INTO PRECIOS
             (PRECIO)
              VALUES
             (4890);
--------------------------------------------------------------------------------------------------------------------------------
--INSERTAR COMBOS---------------------------------------------------------------------------------------------------------------
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('CUARENTENA INDIVIDUAL',1,1);
            
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('CUARENTENA EN PAREJA',2,2);
             
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('CUARENTENA EN FAMILIA',3,3);
              
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('CUARENTENA EN FAMILIA',4,4);
              
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
              VALUES
              ('PREMIUM INDIVIDUAL',1,2);
            
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('PREMIUM PAREJA',2,3);
              
              INSERT INTO COMBOS
              (NOMBRE,TIPOCOMBO_id,PRECIO_ID)
               VALUES
              ('PREMIUM FAMILIAR',2,5);
              
     -- Después de insertar DETALLE_COMBOS realizar estos update para pruebas
            UPDATE COMBOS SET DETALLE_COMBO_ID = 1 WHERE COMBO_ID=1;
            UPDATE COMBOS SET DETALLE_COMBO_ID = 3 WHERE COMBO_ID=4;         
 -------------------------------------------------------------------------------------------------------------------------------    
    
-- INSERTAR TIPOS COMBOS--------------------------------------------------------------------------------------------------------
            INSERT INTO TIPOCOMBO
            (NOMBRETIPO,TIPOCOMBO_ID)
            VALUES 
            ('INDIVIDUAL',1);
            
            INSERT INTO TIPOCOMBO
            (NOMBRETIPO,TIPOCOMBO_ID)
            VALUES 
            ('PAREJA',2);
            
            INSERT INTO TIPOCOMBO
            (NOMBRETIPO,TIPOCOMBO_ID)
            VALUES 
            ('FAMILIAR',3);
            
            INSERT INTO TIPOCOMBO
            (NOMBRETIPO,TIPOCOMBO_ID)
            VALUES 
            ('NIÑOS',4);

       
--------------------------------------------------------------------------------------------------------------------------------

-- INSERTAR BEBESTIBLES---------------------------------------------------------------------------------------------------------
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('BEBIDA MEDIANA',6);
            
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('BEBIDA PEQUEÑA',7);
            
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('BEBIDA GRANDE',8);
            
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('AGUA MINERAL',6);
            
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('CERVEZA 350cc',9);
            
            INSERT INTO BEBESTIBLES
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('CERVEZA 500cc',10);
   -----------------------------------------------------------------------------------------------------------------------------
        
-- INGRESAR ACOMPAÑAMIENTOS ----------------------------------------------------------------------------------------------------
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('PAPAS FRITAS PEQUEÑA',7); 
            
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('PAPAS FRITAS MEDIANA',6);
            
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('PAPAS FRITAS GRANDE',8);
                     
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('EMPANADAS DE QUESO 6u',6);
            
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('PAPAS FRITAS FAMILIAR',1);
            
            INSERT INTO ACOMPANAMIENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('EMPANADAS DE QUESO 12u',8);
--------------------------------------------------------------------------------------------------------------------------------


-- INGRESAR ALIMENTOS ----------------------------------------------------------------------------------------------------------
            
            INSERT INTO ALIMENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('HAMBURGUESA PREMIUM ',1);
            
            INSERT INTO ALIMENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('HAMBURGUESA XL',1);
            
            INSERT INTO ALIMENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('BURRITO ',6);
            
            INSERT INTO ALIMENTOS
            (NOMBRE,PRECIO_ID)
            VALUES 
            ('BURRITO XL ',8);
--------------------------------------------------------------------------------------------------------------------------------

-- INSERTAR DETALLE_COMBO ------------------------------------------------------------------------------------------------------

            --  INDIVIDUAL / BURRITO NORMAL - BEBIDA PEQUEÑA - PAPAS FRITAS CHICAS
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (2,1,3,1,1,1);

            --  INDIVIDUAL / BURRITO XL - BEBIDA GRANDE - PAPAS FRITAS GRANDES
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (3,1,4,1,3,1);

            --  INDIVIDUAL / HAMBURGUESA PREMIUM - BEBIDA PEQUEÑA - PAPAS FRITAS PEQUEÑAS
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (2,1,1,1,1,1);
            
            --  INDIVIDUAL / HAMBURGUESA PREMIUM - BEBIDA MEDIANA -- PAPAS FRITAS MEDIANAS
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (1,1,1,1,2,1);
            
            --  INDIVIDUAL / HAMBURGUESA PREMIUM - BEBIDA GRANDE - PAPAS FRITAS GRANDES
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (3,1,1,1,3,1);
            
             --  INDIVIDUAL / HAMBURGUESA XL - BEBIDA PEQUEÑA - PAPAS FRITAS PEQUEÑAS
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (2,1,2,1,1,1);
            
            --  INDIVIDUAL / HAMBURGUESA XL -  BEBIDA MEDIANA - PAPAS FRITAS MEDIANAS
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (1,1,2,1,2,1);
            
            --  INDIVIDUAL HAMBURGUESA XL - BEBIDA GRANDE - PAPAS FRITAS GRANDES
            INSERT INTO DETALLE_COMBO
            (BEBESTIBLE_ID,CANT_BEBESTIBLES,ALIMENTO_ID,CANT_ALIMENTO,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1)
            VALUES 
            (3,1,2,1,3,1);
            
                 
-----------------------------------------------------------------------------------------------------------------------------      

--- INSERTAR PEDIDO DE COMBO 1 -----------------------------------------------------------------------------------------------------------------------
            INSERT INTO PEDIDO
            (ALIMENTO_ID,CANT_ALIMENTO,BEBESTIBLE_ID,CANT_BEBESTIBLE,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1,ACOMPANAMIENTO_ID_2,CANT_ACOMPANAMIENTO_2,COMBO_ID,CANT_COMBO)
            VALUES 
            (null,0,null,0,null,0,null,0,1,1);
          
            INSERT INTO PEDIDO
            (ALIMENTO_ID,CANT_ALIMENTO,BEBESTIBLE_ID,CANT_BEBESTIBLE,ACOMPANAMIENTO_ID_1,CANT_ACOMPANAMIENTO_1,ACOMPANAMIENTO_ID_2,CANT_ACOMPANAMIENTO_2,COMBO_ID,CANT_COMBO)
            VALUES 
            (null,0,null,0,3,2,null,0,1,1);
    
------------------------------------------------------------------------------------------------------------------------------