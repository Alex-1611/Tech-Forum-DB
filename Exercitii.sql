CREATE OR REPLACE TYPE dispozitiv_obj AS OBJECT (
    nume VARCHAR2(50),
    categorie VARCHAR2(25),
    pret NUMBER
);
/

CREATE OR REPLACE TYPE dispozitive_nest_tbl AS TABLE OF dispozitiv_obj;
/

CREATE OR REPLACE TYPE top_dispozitive_arr AS VARRAY(3) OF dispozitiv_obj;
/

CREATE OR REPLACE PROCEDURE EX6 IS
    TYPE caracteristici_tbl IS TABLE OF VARCHAR2(1000) INDEX BY VARCHAR2(50);
    
    v_dispozitive dispozitive_nest_tbl;
    v_top_dispozitive top_dispozitive_arr;
    v_caracteristici caracteristici_tbl;
    
    CURSOR c_marci IS 
        SELECT DISTINCT marca 
        FROM DISPOZITIV;
BEGIN
    FOR r_marca IN c_marci LOOP
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('Marca: ' || r_marca.marca);
        
        SELECT dispozitiv_obj(d.nume, d.categorie, d.pret_mediu)
        BULK COLLECT INTO v_dispozitive
        FROM DISPOZITIV d
        WHERE d.marca = r_marca.marca;

        SELECT dispozitiv_obj(d.nume, d.categorie, d.pret_mediu)
        BULK COLLECT INTO v_top_dispozitive
        FROM DISPOZITIV d
        WHERE d.marca = r_marca.marca
        ORDER BY d.pret_mediu DESC
        FETCH FIRST 3 ROWS ONLY;
        
        FOR r_disp IN (SELECT d.id_dispozitiv, d.nume
                      FROM DISPOZITIV d
                      WHERE d.marca = r_marca.marca) LOOP
            v_caracteristici(r_disp.nume) := '';
            
            FOR r_caract IN (SELECT c.nume || ': ' || dac.valoare AS info
                           FROM DISPOZITIV_ARE_CARACTERISTICI dac
                           JOIN CARACTERISTICA c ON c.id_caracteristica = dac.id_caracteristica
                           WHERE dac.id_dispozitiv = r_disp.id_dispozitiv) LOOP
                v_caracteristici(r_disp.nume) := v_caracteristici(r_disp.nume) || r_caract.info || '; ';
            END LOOP;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('1. Lista tuturor dispozitivelor:');
        FOR i IN 1..v_dispozitive.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('   - ' || v_dispozitive(i).nume || ' (' || v_dispozitive(i).categorie || ', ' || v_dispozitive(i).pret || ' RON)');
            DBMS_OUTPUT.PUT_LINE('      Caracteristici: ' || v_caracteristici(v_dispozitive(i).nume));
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('2. Top 3 cele mai scumpe dispozitive:');
        FOR i IN 1..v_top_dispozitive.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('   ' || i || '. ' || v_top_dispozitive(i).nume || ' (' || v_top_dispozitive(i).categorie || ', ' || v_top_dispozitive(i).pret || ' RON)');
        END LOOP;

    END LOOP;
END;
/

BEGIN
    EX6;
END;
/

CREATE OR REPLACE PROCEDURE EX7 IS

    CURSOR c_categories IS 
        SELECT DISTINCT categorie
        FROM DISPOZITIV
        ORDER BY categorie;
    
    CURSOR c_category_devices(p_categorie VARCHAR2) IS 
        SELECT nume, marca, pret_mediu
        FROM DISPOZITIV
        WHERE categorie = p_categorie
        ORDER BY pret_mediu DESC;
BEGIN
    
    FOR cat IN c_categories LOOP
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('   Categorie: ' || cat.categorie);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        
        FOR disp IN c_category_devices(cat.categorie) LOOP
            DBMS_OUTPUT.PUT_LINE(disp.marca || ' ' || disp.nume || ' - ' || disp.pret_mediu || ' RON');
        END LOOP;
    END LOOP;
END;
/

BEGIN
    EX7;
END;
/

CREATE OR REPLACE TYPE RET_EX8 AS OBJECT(
    NUME VARCHAR2(50),
    NUME_DISPOZITIV VARCHAR2(50),
    NOTA NUMBER,
    COMENTARIU VARCHAR2(255)
);
/

CREATE OR REPLACE FUNCTION EX8 (NR_COMENTARII NUMBER)
    RETURN RET_EX8 IS
    V_RET RET_EX8;
    V_ID_USER UTILIZATOR.ID_UTILIZATOR%TYPE;
BEGIN
    SELECT ID_UTILIZATOR INTO V_ID_USER
    FROM UTILIZATOR U
    WHERE (SELECT COUNT(*) FROM COMENTARIU C WHERE C.ID_UTILIZATOR = U.ID_UTILIZATOR) = NR_COMENTARII;

    SELECT RET_EX8(U.USERNAME, D.NUME, R.NOTA, C.TEXT)
    INTO V_RET
    FROM COMENTARIU C
    JOIN UTILIZATOR U ON C.ID_UTILIZATOR = U.ID_UTILIZATOR
    JOIN RECENZIE R ON C.ID_RECENZIE = R.ID_RECENZIE
    JOIN DISPOZITIV D ON R.ID_DISPOZITIV = D.ID_DISPOZITIV
    WHERE U.ID_UTILIZATOR = V_ID_USER
    ORDER BY C.DATA_POSTARE DESC
    FETCH FIRST ROW ONLY;
    RETURN V_RET;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista utilizator cu ' || NR_COMENTARII || ' comentarii.');
        RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exista mai multi utilizatori cu ' || NR_COMENTARII || ' comentarii.');
        RETURN NULL;
END EX8;
/

DECLARE 
    V_RET RET_EX8;
BEGIN
    V_RET := EX8(1);
    IF V_RET IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Username: ' || V_RET.NUME);
        DBMS_OUTPUT.PUT_LINE('Nume dispozitiv: ' || V_RET.NUME_DISPOZITIV);
        DBMS_OUTPUT.PUT_LINE('Nota: ' || V_RET.NOTA);
        DBMS_OUTPUT.PUT_LINE('Comentariu: ' || V_RET.COMENTARIU);
    END IF;
END;    
/

CREATE OR REPLACE TYPE RET_EX9 AS OBJECT(
    NUME VARCHAR2(50),
    NR_APRECIERI NUMBER,
    CARACTERISTICA VARCHAR2(50),
    NOTA_CARACTERISTICA NUMBER,
    NOTA NUMBER
);
/

CREATE OR REPLACE FUNCTION EX9 (V_CAT IN VARCHAR2,
                                V_TIP_INFO IN VARCHAR2)
    RETURN RET_EX9 IS
    V_RET RET_EX9;
    V_NR_MAX_APRECIERI NUMBER;

BEGIN
    V_RET := RET_EX9(NULL, NULL, NULL, NULL, NULL);
    SELECT MAX(COUNT(*))
    INTO V_NR_MAX_APRECIERI
    FROM APRECIAZA A
    JOIN DISPOZITIV D ON D.ID_DISPOZITIV = A.ID_DISPOZITIV
    WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT)
    GROUP BY A.ID_DISPOZITIV;

    IF UPPER(V_TIP_INFO) = 'PROCESOR' THEN
        SELECT D.NUME, (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV), DC.VALOARE, N.NOTA, R.NOTA
        INTO V_RET.NUME, V_RET.NR_APRECIERI, V_RET.CARACTERISTICA, V_RET.NOTA_CARACTERISTICA, V_RET.NOTA
        FROM DISPOZITIV D
        JOIN DISPOZITIV_ARE_CARACTERISTICI DC ON D.ID_DISPOZITIV = DC.ID_DISPOZITIV
        LEFT JOIN RECENZIE R ON R.ID_DISPOZITIV = D.ID_DISPOZITIV
        LEFT JOIN NOTEAZA N ON N.ID_RECENZIE = R.ID_RECENZIE
        WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT) AND (N.ID_CRITERIU = 3 OR N.ID_CRITERIU IS NULL) AND DC.ID_CARACTERISTICA = 2 AND (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV) = V_NR_MAX_APRECIERI;

    ELSIF UPPER(V_TIP_INFO) = 'BATERIE' THEN
        SELECT D.NUME, (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV), DC.VALOARE, N.NOTA, R.NOTA
        INTO V_RET.NUME, V_RET.NR_APRECIERI, V_RET.CARACTERISTICA, V_RET.NOTA_CARACTERISTICA, V_RET.NOTA
        FROM DISPOZITIV D
        JOIN DISPOZITIV_ARE_CARACTERISTICI DC ON D.ID_DISPOZITIV = DC.ID_DISPOZITIV
        LEFT JOIN RECENZIE R ON R.ID_DISPOZITIV = D.ID_DISPOZITIV
        LEFT JOIN NOTEAZA N ON N.ID_RECENZIE = R.ID_RECENZIE
        WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT) AND (N.ID_CRITERIU = 2 OR N.ID_CRITERIU IS NULL) AND DC.ID_CARACTERISTICA = 5 AND (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV) = V_NR_MAX_APRECIERI;

    ELSE 
        RAISE_APPLICATION_ERROR(-20001, 'Tipul de catacteristica nu este valid.');
    END IF;

    IF V_RET.NOTA IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Dispozitivul nu are recenzie.');
    END IF;

    RETURN V_RET;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Nu exista dispozitive in categoria ' || V_CAT);
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20004, 'S-au gasit mai multe dispozitive in categoria ' || V_CAT || ' cu numarul maxim de aprecieri.');
END EX9;
/

DECLARE
    V_RET RET_EX9;
BEGIN 
    V_RET := EX9('laptop gaming', 'procesor');
    IF V_RET IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Numele: ' || V_RET.NUME);
        DBMS_OUTPUT.PUT_LINE('Numar aprecieri: ' || V_RET.NR_APRECIERI);
        DBMS_OUTPUT.PUT_LINE('Caracteristica: ' || V_RET.CARACTERISTICA);
        DBMS_OUTPUT.PUT_LINE('Nota caracteristica: ' || V_RET.NOTA_CARACTERISTICA);
        DBMS_OUTPUT.PUT_LINE('Nota: ' || V_RET.NOTA);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION EX9_modified (V_CAT IN VARCHAR2,
                                V_TIP_INFO IN VARCHAR2)
    RETURN RET_EX9 IS
    V_RET RET_EX9;
    V_NR_MAX_APRECIERI NUMBER;
    exception CARACTERISTICA_INVALIDA;
    exception DISP_NU_ARE_RECENZII;

BEGIN
    V_RET := RET_EX9(NULL, NULL, NULL, NULL, NULL);
    SELECT MAX(COUNT(*))
    INTO V_NR_MAX_APRECIERI
    FROM APRECIAZA A
    JOIN DISPOZITIV D ON D.ID_DISPOZITIV = A.ID_DISPOZITIV
    WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT)
    GROUP BY A.ID_DISPOZITIV;

    IF UPPER(V_TIP_INFO) = 'PROCESOR' THEN
        SELECT D.NUME, (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV), DC.VALOARE, N.NOTA, R.NOTA
        INTO V_RET.NUME, V_RET.NR_APRECIERI, V_RET.CARACTERISTICA, V_RET.NOTA_CARACTERISTICA, V_RET.NOTA
        FROM DISPOZITIV D
        JOIN DISPOZITIV_ARE_CARACTERISTICI DC ON D.ID_DISPOZITIV = DC.ID_DISPOZITIV
        LEFT JOIN RECENZIE R ON R.ID_DISPOZITIV = D.ID_DISPOZITIV
        LEFT JOIN NOTEAZA N ON N.ID_RECENZIE = R.ID_RECENZIE
        WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT) AND (N.ID_CRITERIU = 3 OR N.ID_CRITERIU IS NULL) AND DC.ID_CARACTERISTICA = 2 AND (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV) = V_NR_MAX_APRECIERI;

    ELSIF UPPER(V_TIP_INFO) = 'BATERIE' THEN
        SELECT D.NUME, (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV), DC.VALOARE, N.NOTA, R.NOTA
        INTO V_RET.NUME, V_RET.NR_APRECIERI, V_RET.CARACTERISTICA, V_RET.NOTA_CARACTERISTICA, V_RET.NOTA
        FROM DISPOZITIV D
        JOIN DISPOZITIV_ARE_CARACTERISTICI DC ON D.ID_DISPOZITIV = DC.ID_DISPOZITIV
        LEFT JOIN RECENZIE R ON R.ID_DISPOZITIV = D.ID_DISPOZITIV
        LEFT JOIN NOTEAZA N ON N.ID_RECENZIE = R.ID_RECENZIE
        WHERE UPPER(D.CATEGORIE) = UPPER(V_CAT) AND (N.ID_CRITERIU = 2 OR N.ID_CRITERIU IS NULL) AND DC.ID_CARACTERISTICA = 5 AND (SELECT COUNT(*) FROM APRECIAZA A WHERE A.ID_DISPOZITIV = D.ID_DISPOZITIV) = V_NR_MAX_APRECIERI;

    ELSE 
        RAISE(CARACTERISTICA_INVALIDA);
    END IF;

    IF V_RET.NOTA IS NULL THEN 
        RAISE(DISP_NU_ARE_RECENZII);
    END IF;

    RETURN V_RET;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Nu exista dispozitive in categoria ' || V_CAT);
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20004, 'S-au gasit mai multe dispozitive in categoria ' || V_CAT || ' cu numarul maxim de aprecieri.');
END EX9;
/

DECLARE
    V_RET RET_EX9;
BEGIN 
    V_RET := EX9_modified('laptop gaming', 'procesor');
    IF V_RET IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Numele: ' || V_RET.NUME);
        DBMS_OUTPUT.PUT_LINE('Numar aprecieri: ' || V_RET.NR_APRECIERI);
        DBMS_OUTPUT.PUT_LINE('Caracteristica: ' || V_RET.CARACTERISTICA);
        DBMS_OUTPUT.PUT_LINE('Nota caracteristica: ' || V_RET.NOTA_CARACTERISTICA);
        DBMS_OUTPUT.PUT_LINE('Nota: ' || V_RET.NOTA);
    END IF;
EXCEPTION
    WHEN CARACTERISTICA_INVALIDA THEN
        DBMS_OUTPUT.PUT_LINE('Tipul de catacteristica nu este valid.');
    WHEN DISP_NU_ARE_RECENZII THEN
        DBMS_OUTPUT.PUT_LINE('Dispozitivul nu are recenzie.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

create table aux_disp as
select * from dispozitiv; 

CREATE OR REPLACE TRIGGER trg_stergere_dispozitive
AFTER DELETE ON aux_disp
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM aux_disp;
    DBMS_OUTPUT.PUT_LINE('Au mai ramas ' || v_count || ' dispozitive.');
END;
/

delete from aux_disp where id_dispozitiv = 1;
delete from aux_disp where id_dispozitiv = 2;

CREATE TABLE LOG_INFO (
    ID_INFO NUMBER(5) PRIMARY KEY,
    USER_NAME VARCHAR2(50),
    TABLE_NAME VARCHAR2(50),
    OPERATION VARCHAR2(50),
    DATE_TIME DATE DEFAULT SYSDATE
);


CREATE OR REPLACE TRIGGER TRG_INFO
AFTER DROP OR ALTER OR CREATE ON SCHEMA
WHEN (ORA_DICT_OBJ_TYPE = 'TABLE')
BEGIN
    INSERT INTO LOG_INFO (ID_INFO, USER_NAME, TABLE_NAME, OPERATION, DATE_TIME)
    VALUES (
        SEQ_INFO.NEXTVAL,
        SYS_CONTEXT('USERENV', 'CURRENT_USER'),
        ORA_DICT_OBJ_NAME,
        ORA_SYSEVENT,
        SYSDATE
    );
END;
/

CREATE TABLE TEST(
    id NUMBER(5)
);

alter table test add constraint test_pk primary key(id);

drop table test;

select * from log_info;


