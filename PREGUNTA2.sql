-- 1.   EJECUTAR PROCEDIMIENTO PARA VISUALIZAR MENU EN SALIDA DBMS
EXEC mostrar_menu;


CREATE OR REPLACE PROCEDURE mostrar_menu
    AS
    BEGIN 
            DECLARE CURSOR cur IS
                                SELECT  COMBOS.NOMBRE NOMBRE_COMBO, PRECIOS.PRECIO PRECIO_COMBO, DET.CANT_BEBESTIBLES CANT_BEBESTIBLES, BEB.NOMBRE NOMBRE_BEBESTIBLE,
                                        DET.CANT_ALIMENTO CANT_ALIMENTO, ALIM.NOMBRE NOMBRE_ALIMENTO,
                                        DET.CANT_ACOMPANAMIENTO_1 CANT_ACOMP_1, ACOM.NOMBRE NOMBRE_ACOMP_1,
                                        DET.CANT_ACOMPANAMIENTO_2 CANT_ACOMP_2, ACOM2.NOMBRE NOMBRE_ACOMP_2
                                FROM DETALLE_COMBO DET
                                INNER JOIN BEBESTIBLES BEB
                                ON BEB.BEBESTIBLE_ID = DET.BEBESTIBLE_ID
                                INNER JOIN ALIMENTOS ALIM
                                ON ALIM.ALIMENTO_ID = DET.ALIMENTO_ID
                                LEFT JOIN ACOMPANAMIENTOS ACOM
                                ON ACOM.ACOMPANAMIENTO_ID = DET.ACOMPANAMIENTO_ID_1 
                                LEFT JOIN ACOMPANAMIENTOS ACOM2
                                ON ACOM2.ACOMPANAMIENTO_ID = DET.ACOMPANAMIENTO_ID_2
                                INNER JOIN COMBOS
                                ON DET.DETALLE_COMBO_ID = COMBOS.DETALLE_COMBO_ID
                                INNER JOIN PRECIOS
                                ON COMBOS.PRECIO_ID = PRECIOS.PRECIO_ID ;
            BEGIN
              FOR opcion IN cur LOOP
                dbms_output.put_line ('Nombre combo: '|| opcion.NOMBRE_COMBO ||' Precio: '|| opcion.PRECIO_COMBO || CHR(13) || CHR(10) || 
                                       opcion.CANT_BEBESTIBLES || ' ' || opcion.NOMBRE_BEBESTIBLE  || CHR(13) || CHR(10) || 
                                       opcion.CANT_ALIMENTO || ' ' || opcion.NOMBRE_ALIMENTO || CHR(13) || CHR(10) ||
                                       opcion.CANT_ACOMP_1 || ' ' || opcion.NOMBRE_ACOMP_1 || CHR(13) || CHR(10) ||
                                       opcion.CANT_ACOMP_2  || ' ' || opcion.NOMBRE_ACOMP_2 || CHR(13) || CHR(10));
              END LOOP;
            END;                           
END;





