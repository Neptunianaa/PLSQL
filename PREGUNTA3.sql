-------------------------------------------- OPCIONES DE COMBINACIONES   -------------------------------------------------------
/* ID   BEBESTIBLES       ID        ALIMENTOS             ID     ACOMPAÑAMIENTOS           ID  TIPO COMBO    ID  PRECIO
    1  BEBIDA MEDIANA     1	    HAMBURGUESA PREMIUM        1	PAPAS FRITAS PEQUEÑA        1  INDIVIDUAL     1   3990
    2  BEBIDA PEQUEÑA     2	    HAMBURGUESA XL             2	PAPAS FRITAS MEDIANA        2  PAREJAS        2   5990
    3  BEBIDA GRANDE      3	    BURRITO                    3	PAPAS FRITAS GRANDE         3  FAMILIAR       3   7990
    4  AGUA MINERAL       4  	BURRITO XL                 4	EMPANADAS DE QUESO 6u       4  NIÑOS          4   9990
    5  CERVEZA 350cc                                       5	PAPAS FRITAS FAMILIAR                         5   11990
    6  CERVEZA 500cc                                       6	EMPANADAS DE QUESO 12u                        6   990    */ 
 
    
-- 1. EJECUTAR PROCEDIMIENTO CON LA COMBINACIÓN DE PRODUCTOS ELEGIDA                    
--  exec agregar_combo(nombreCombo,tipoCombo_id,precio_id,bebestible_id,cant_bebestible,alimento_id,cant_alimento,acomp_id,cant_acomp,acomp2_id,cant_acomp2)
    exec agregar_combo('COMBO SP FAMILIAR',3,5,2,3,3,3,2,2,6,1)
      
    
CREATE OR REPLACE PROCEDURE agregar_combo(nombreCombo varchar2, tipoCombo number,precio_id number,beb_id number,cant_beb number, alimento_id number,cant_alimento number,acomp_id number,cant_acomp number,acompa_id number,cant_acompa number)
AS
    detalle_id_insertado number;

    BEGIN
    
       -- INICIALMENTE CREAMOS EL REGISTRO DETALLE_COMBO
         INSERT INTO DETALLE_COMBO
                (BEBESTIBLE_ID, CANT_BEBESTIBLES, ALIMENTO_ID, CANT_ALIMENTO, ACOMPANAMIENTO_ID_1, CANT_ACOMPANAMIENTO_1, ACOMPANAMIENTO_ID_2, CANT_ACOMPANAMIENTO_2)
                VALUES 
                (beb_id, cant_beb, alimento_id, cant_alimento, acomp_id, cant_acomp, acompa_id, cant_acompa)
                RETURNING 
                DETALLE_COMBO_ID into detalle_id_insertado;
    
       -- POSTERIORMENTE CREAMOS EL REGISTRO EN COMBOS
          INSERT INTO COMBOS (NOMBRE, TIPOCOMBO_ID,PRECIO_ID, DETALLE_COMBO_ID)
                 VALUES
                 ( nombreCombo,tipoCombo,precio_id,detalle_id_insertado);      

 END;
    
    
    
    