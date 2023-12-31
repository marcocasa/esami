COPY decessi
FROM 'C:\Users\Marco\progetto_dati_non_strutturati\dataset\morti\tabella_decessi.csv'
DELIMITER ','
CSV Header;


COPY stazioni(id_staz, nome, tipo_zona, tipo_staz, lat, long, id_comune)
FROM 'C:\Users\Marco\progetto_dati_non_strutturati\dataset\indicatori\stazioni.csv'
DELIMITER ','
CSV Header;
UPDATE stazioni SET geom = ST_SETSRID(ST_MakePoint(long, lat),4326);

COPY indicatori
FROM 'C:\Users\Marco\progetto_dati_non_strutturati\dataset\indicatori\indicatori.csv'
DELIMITER ','
CSV HEADER;


COPY rileva
FROM 'C:\Users\Marco\progetto_dati_non_strutturati\dataset\indicatori\rileva.csv'
DELIMITER ','
CSV HEADER;


COPY rilevazioni(id_rilevazione,anno,giorni_superamento,media_annuale,nome_indicatore,massimo,id_stazione)
FROM 'C:\Users\Marco\progetto_dati_non_strutturati\dataset\indicatori\rilevazioni.csv'
DELIMITER ','
CSV HEADER;


SELECT UpdateGeometrySRID('province', 'geom', 4326);
SELECT UpdateGeometrySRID('comuni', 'geom', 4326);
