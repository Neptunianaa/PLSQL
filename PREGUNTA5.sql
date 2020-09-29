-- 1.   INGRESAR MÁXIMO QUE SE DESEA GASTAR Y EJECUTAR PROCEDIMIENTO PARA VISUALIZAR MENU EN SALIDA DBMS
  EXEC mostrar_menu_preciomaximo(5000,'BEBESTIBLES');
--EXEC mostrar_menu_preciomaximo(5000,'TODO');

CREATE OR REPLACE PROCEDURE mostrar_menu_preciomaximo(precioMaximo number ,tipoBusqueda varchar2)
    AS
    BEGIN 
            IF (tipoBusqueda = 'COMBOS' OR tipoBusqueda = 'TODO') THEN
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
                                    ON COMBOS.PRECIO_ID = PRECIOS.PRECIO_ID 
                                    WHERE PRECIOS.PRECIO < precioMaximo;
                        BEGIN
                          FOR opcion IN cur LOOP
                            dbms_output.put_line ('Nombre combo: '|| opcion.NOMBRE_COMBO ||' Precio: '|| opcion.PRECIO_COMBO || CHR(13) || CHR(10) || 
                                                   opcion.CANT_BEBESTIBLES || ' ' || opcion.NOMBRE_BEBESTIBLE  || CHR(13) || CHR(10) || 
                                                   opcion.CANT_ALIMENTO || ' ' || opcion.NOMBRE_ALIMENTO || CHR(13) || CHR(10) ||
                                                   opcion.CANT_ACOMP_1 || ' ' || opcion.NOMBRE_ACOMP_1 || CHR(13) || CHR(10) ||
                                                   opcion.CANT_ACOMP_2  || ' ' || opcion.NOMBRE_ACOMP_2 || CHR(13) || CHR(10));
                          END LOOP;
                     END; 
            END IF;
            
            IF (tipoBusqueda = 'ALIMENTOS' OR tipoBusqueda = 'TODO') THEN
                      DECLARE CURSOR cur IS
                                        SELECT  ALIM.NOMBRE NOMBRE_ALIMENTO, PRECIOS.PRECIO PRECIO_ALIMENTO
                                        FROM ALIMENTOS ALIM
                                        INNER JOIN PRECIOS
                                        ON ALIM.PRECIO_ID = PRECIOS.PRECIO_ID 
                                        WHERE PRECIOS.PRECIO < precioMaximo;
                     BEGIN
                            dbms_output.put_line (CHR(13) || CHR(10) || 'OPCIONES ALIMENTOS: ' || CHR(13) || CHR(10) );
                      FOR alim IN cur LOOP
                            dbms_output.put_line (alim.NOMBRE_ALIMENTO  || ' ' || alim.PRECIO_ALIMENTO);
                      END LOOP;
                    END; 
            END IF;
            
            IF (tipoBusqueda = 'BEBESTIBLES' OR tipoBusqueda = 'TODO') THEN
                      DECLARE CURSOR cur IS
                                        SELECT  BEB.NOMBRE NOMBRE_BEBESTIBLE, PRECIOS.PRECIO PRECIO_BEBESTIBLE
                                        FROM BEBESTIBLES BEB
                                        INNER JOIN PRECIOS
                                        ON BEB.PRECIO_ID = PRECIOS.PRECIO_ID 
                                        WHERE PRECIOS.PRECIO < precioMaximo;
                            BEGIN
                                   dbms_output.put_line (CHR(13) || CHR(10) || 'OPCIONES BEBESTIBLES: ' || CHR(13) || CHR(10) );
                              FOR beb IN cur LOOP
                                   dbms_output.put_line (beb.NOMBRE_BEBESTIBLE  || ' ' || beb.PRECIO_BEBESTIBLE);
                           END LOOP;
                     END; 
            END IF;
            
            IF (tipoBusqueda = 'ACOMPANAMIENTOS' OR tipoBusqueda = 'TODO') THEN
                      DECLARE CURSOR cur IS
                                        SELECT  ACOMP.NOMBRE NOMBRE_ACOMP, PRECIOS.PRECIO PRECIO_ACOMP
                                        FROM ACOMPANAMIENTOS ACOMP
                                        INNER JOIN PRECIOS
                                        ON ACOMP.PRECIO_ID = PRECIOS.PRECIO_ID 
                                        WHERE PRECIOS.PRECIO < precioMaximo;
                            BEGIN
                                 dbms_output.put_line (CHR(13) || CHR(10) ||'OPCIONES ACOMPANAMIENTOS: ' || CHR(13) || CHR(10) );
                              FOR acomp IN cur LOOP
                                dbms_output.put_line (acomp.NOMBRE_ACOMP  || ' ' || acomp.PRECIO_ACOMP);
                           END LOOP;
                     END; 
            END IF;
END;





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
                                ON COMBOS.PRECIO_ID = PRECIOS.PRECIO_ID 
                                WHERE PRECIOS.PRECIO < 7000;
