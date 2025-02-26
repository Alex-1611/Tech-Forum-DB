-- Inserare smartphone-uri
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Galaxy S23 Ultra', 'Smartphone', 'Samsung', 5000);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('iPhone 14 Pro Max', 'Smartphone', 'Apple', 6000);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Pixel 8 Pro', 'Smartphone', 'Google', 4500);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Galaxy Z Flip 5', 'Smartphone', 'Samsung', 4500);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Galaxy A54', 'Smartphone', 'Samsung', 2000);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Galaxy A34', 'Smartphone', 'Samsung', 1500);


-- Inserare laptopuri gaming
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Alienware M16', 'Laptop Gaming', 'Dell', 10000);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('ROG Strix G16', 'Laptop Gaming', 'ASUS', 9500);

-- Inserare laptopuri 2-in-1
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('ZenBook Flip 14', 'Laptop 2-in-1', 'ASUS', 7500);
INSERT INTO DISPOZITIV (NUME, CATEGORIE, MARCA, PRET_MEDIU) VALUES ('Yoga 9i', 'Laptop 2-in-1', 'Lenovo', 8000);

-- Inserare utilizatori
INSERT INTO UTILIZATOR (USERNAME, PAROLA) VALUES ('IonPopescu', 'Parola1!');
INSERT INTO UTILIZATOR (USERNAME, PAROLA) VALUES ('MariaIonescu', 'Sigura22@');
INSERT INTO UTILIZATOR (USERNAME, PAROLA) VALUES ('AlexandraD', 'Securitate3#');
INSERT INTO UTILIZATOR (USERNAME, PAROLA) VALUES ('MihaiV', 'Unica44$');
INSERT INTO UTILIZATOR (USERNAME, PAROLA) VALUES ('AndreiC', 'Puternica5@');

-- Inserare caracteristici
INSERT INTO CARACTERISTICA (NUME) VALUES ('Memorie (RAM, ROM)');
INSERT INTO CARACTERISTICA (NUME) VALUES ('Procesor');
INSERT INTO CARACTERISTICA (NUME) VALUES ('Ecran');
INSERT INTO CARACTERISTICA (NUME) VALUES ('Camera');
INSERT INTO CARACTERISTICA (NUME) VALUES ('Baterie');

-- Galaxy S23 Ultra
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (1, 1, '8GB RAM, 256GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (1, 2, 'Snapdragon 8 Gen 2');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (1, 3, '6.8 inch AMOLED');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (1, 4, '200 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (1, 5, '5000 mAh');

-- iPhone 14 Pro Max
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (2, 1, '6GB RAM, 128GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (2, 2, 'A16 Bionic');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (2, 3, '6.7 inch OLED');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (2, 4, '48 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (2, 5, '4323 mAh');

-- Pixel 8 Pro
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (3, 1, '12GB RAM, 512GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (3, 2, 'Google Tensor G3');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (3, 3, '6.7 inch LTPO AMOLED');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (3, 4, '50 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (3, 5, '5050 mAh');

-- Galaxy Z Flip 5
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (8, 1, '8GB RAM, 256GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (8, 2, 'Snapdragon 8 Gen 2');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (8, 3, '6.7 inch Dynamic AMOLED 2X');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (8, 4, '12 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (8, 5, '3700 mAh');

-- Galaxy A54
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (9, 1, '8GB RAM, 128GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (9, 2, 'Exynos 1380');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (9, 3, '6.4 inch Super AMOLED');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (9, 4, '50 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (9, 5, '5000 mAh');

-- Galaxy A34
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (10, 1, '6GB RAM, 128GB ROM');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (10, 2, 'Dimensity 1080');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (10, 3, '6.6 inch Super AMOLED');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (10, 4, '48 MP');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (10, 5, '5000 mAh');

-- Alienware M16
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (4, 1, '16GB RAM, 1TB SSD');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (4, 2, 'Intel Core i9-13900HX');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (4, 3, '16 inch QHD+');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (4, 5, '86Wh');

-- ROG Strix G16
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (5, 1, '32GB RAM, 2TB SSD');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (5, 2, 'AMD Ryzen 9 7945HX');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (5, 3, '16 inch FHD+');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (5, 5, '90Wh');

-- ZenBook Flip 14
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (6, 1, '8GB RAM, 512GB SSD');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (6, 2, 'Intel Core i7-1255U');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (6, 3, '13 inch OLED Touch');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (6, 5, '67Wh');

-- Yoga 9i
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (7, 1, '16GB RAM, 1TB SSD');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (7, 2, 'AMD Ryzen 7 7735U');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (7, 3, '14 inch IPS Touch');
INSERT INTO DISPOZITIV_ARE_CARACTERISTICI (ID_DISPOZITIV, ID_CARACTERISTICA, VALOARE) VALUES (7, 5, '75Wh');

-- Opinii pentru Pixel 8 Pro
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (1, 3, 'Camera foto impresionanta si baterie de lunga durata. Procesorul Google Tensor G3 face fata tuturor task-urilor.', TO_DATE('2023-12-01', 'YYYY-MM-DD'));
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (2, 3, 'Display-ul AMOLED este exceptional, culorile sunt vibrante.', TO_DATE('2023-12-02', 'YYYY-MM-DD'));
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (3, 3, 'Experienta Android stock este foarte placuta, update-uri rapide.', TO_DATE('2023-12-03', 'YYYY-MM-DD'));

-- Opinii pentru Alienware M16
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (4, 4, 'Performanta excelenta pentru gaming, racire eficienta.', TO_DATE('2023-12-04', 'YYYY-MM-DD'));
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (5, 4, 'Display-ul QHD+ este perfect pentru gaming, rata de refresh ridicata.', TO_DATE('2023-12-05', 'YYYY-MM-DD'));

-- Opinii pentru ZenBook Flip 14
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (1, 6, 'Perfect pentru productivitate, ecranul tactil este foarte precis.', TO_DATE('2023-12-06', 'YYYY-MM-DD'));
INSERT INTO OPINIE (ID_UTILIZATOR, ID_DISPOZITIV, TEXT, DATA_POSTARE) VALUES (2, 6, 'Bateria tine toata ziua, design compact si elegant.', TO_DATE('2023-12-07', 'YYYY-MM-DD'));

-- IonPopescu
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (1, 1); -- Galaxy S23 Ultra
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (1, 3); -- Pixel 8 Pro
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (1, 5); -- ROG Strix G16

-- MariaIonescu
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (2, 2); -- iPhone 14 Pro Max
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (2, 4); -- Alienware M16

-- AlexandraD
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (3, 1); -- Galaxy S23 Ultra
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (3, 4); -- Alienware M16

-- MihaiV
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (4, 3); -- Pixel 8 Pro
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (4, 5); -- ROG Strix G16

-- AndreiC
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (5, 3); -- Pixel 8 Pro
INSERT INTO APRECIAZA (ID_UTILIZATOR, ID_DISPOZITIV) VALUES (5, 7); -- Yoga 9i

-- Inserare criterii
INSERT INTO CRITERIU (NUME) VALUES ('Camera');
INSERT INTO CRITERIU (NUME) VALUES ('Baterie');
INSERT INTO CRITERIU (NUME) VALUES ('Performanta');
INSERT INTO CRITERIU (NUME) VALUES ('Calitate');
INSERT INTO CRITERIU (NUME) VALUES ('Portabilitate');

-- Inserare recenzii fara note, vor fi actualizate de trigger
INSERT INTO RECENZIE (ID_DISPOZITIV, NOTA) VALUES (1, 0);
INSERT INTO RECENZIE (ID_DISPOZITIV, NOTA) VALUES (2, 0);  
INSERT INTO RECENZIE (ID_DISPOZITIV, NOTA) VALUES (3, 0);  
INSERT INTO RECENZIE (ID_DISPOZITIV, NOTA) VALUES (4, 0);  
INSERT INTO RECENZIE (ID_DISPOZITIV, NOTA) VALUES (6, 0);  

-- Galaxy S23 Ultra
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (1, 1, 9.5, 'Camera principala de 200MP impresionanta');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (1, 2, 9.0, 'Baterie de 5000mAh cu durata lunga');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (1, 3, 9.0, 'Snapdragon 8 Gen 2 optimizat');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (1, 4, 8.5, 'Constructie solida din sticla si aluminiu');

-- iPhone 14 Pro Max
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (2, 1, 9.5, 'Camera foto excelenta cu zoom optic 3x');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (2, 2, 8.0, 'Baterie de 4323mAh cu durata buna');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (2, 3, 9.5, 'Chip A16 Bionic foarte puternic');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (2, 4, 9.0, 'Constructie premium din otel inoxidabil');

-- Pixel 8 Pro
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (3, 1, 9.0, 'Sistem foto versatil cu procesare AI');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (3, 2, 8.5, 'Baterie de 5050mAh cu incarcare rapida');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (3, 3, 8.5, 'Procesor Tensor G3 cu focus pe AI');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (3, 4, 8.5, 'Design mat premium');

-- Alienware M16
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (4, 2, 9.0, 'Baterie de 86Wh pentru gaming intens');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (4, 3, 9.5, 'Intel Core i9-13900HX foarte puternic');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (4, 4, 9.0, 'Constructie robusta cu racire avansata');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (4, 5, 7.5, 'Design masiv specific gaming');

-- ZenBook Flip 14
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (5, 2, 8.5, 'Baterie de 67Wh eficienta pentru un convertibil');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (5, 3, 8.5, 'Intel Core i7-1255U eficient pentru task-uri uzuale');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (5, 4, 9.0, 'Constructie premium cu ecran OLED');
INSERT INTO NOTEAZA (ID_RECENZIE, ID_CRITERIU, NOTA, EXPLICATIE) VALUES (5, 5, 9.5, 'Design convertibil compact si versatil');

-- Comentarii pentru recenzie Alienware M16
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (1, 4, 'Sunt de acord cu review-ul, performanta este exceptionala pentru gaming.', TO_DATE('2023-12-10', 'YYYY-MM-DD')); -- IonPopescu
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (3, 4, 'Sistemul de racire face fata foarte bine in timpul sesiunilor lungi de gaming.', TO_DATE('2023-12-11', 'YYYY-MM-DD')); -- AlexandraD

-- Comentarii pentru recenzie Pixel 8 Pro
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (2, 3, 'Procesarea AI a fotografiilor este impresionanta!', TO_DATE('2023-12-12', 'YYYY-MM-DD')); -- MariaIonescu
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (4, 3, 'Bateria tine foarte bine, chiar si cu functiile AI activate.', TO_DATE('2023-12-13', 'YYYY-MM-DD')); -- MihaiV

-- Comentariu pentru recenzie Galaxy S23 Ultra
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (5, 1, 'Camera de 200MP face poze incredibile, mai ales noaptea.', TO_DATE('2023-12-14', 'YYYY-MM-DD')); -- AndreiC

-- Comentariu pentru recenzie iPhone 14 Pro Max
INSERT INTO COMENTARIU (ID_UTILIZATOR, ID_RECENZIE, TEXT, DATA_POSTARE) VALUES (3, 2, 'Procesorul A16 Bionic este cel mai rapid de pe piata.', TO_DATE('2023-12-15', 'YYYY-MM-DD')); -- AlexandraD

