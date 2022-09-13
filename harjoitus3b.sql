CREATE TABLE public.korttityyppi (
                tyyppi VARCHAR(20) NOT NULL,
                CONSTRAINT korttityyppi_pk PRIMARY KEY (tyyppi)
);
COMMENT ON TABLE public.korttityyppi IS 'For the UI drop down list';
 

CREATE SEQUENCE public.valmistaja_valmistaja_id_seq;
 
CREATE TABLE public.valmistaja (
                valmistaja_id INTEGER NOT NULL DEFAULT nextval('public.valmistaja_valmistaja_id_seq'),
                valmistajan_nimi VARCHAR(30) NOT NULL,
                CONSTRAINT valmistaja_pk PRIMARY KEY (valmistaja_id)
);
COMMENT ON TABLE public.valmistaja IS 'Table is intended to populate a drop down list in the UI';
 

ALTER SEQUENCE public.valmistaja_valmistaja_id_seq OWNED BY public.valmistaja.valmistaja_id;
 
CREATE SEQUENCE public.kortti_kortti_id_seq;
 
CREATE TABLE public.kortti (
                kortti_id INTEGER NOT NULL DEFAULT nextval('public.kortti_kortti_id_seq'),
                valmistaja_id INTEGER NOT NULL,
                tyyppi VARCHAR(20) NOT NULL,
                tuotenimi VARCHAR(30) NOT NULL,
                CONSTRAINT kortti_pk PRIMARY KEY (kortti_id)
);
COMMENT ON TABLE public.kortti IS 'Adapters added to the computer';
COMMENT ON COLUMN public.kortti.tuotenimi IS 'Product name of the adapter eg. Radeon 6300';
 

ALTER SEQUENCE public.kortti_kortti_id_seq OWNED BY public.kortti.kortti_id;
 
CREATE TABLE public.malli (
                mallinimi VARCHAR(30) NOT NULL,
                valmistaja_id INTEGER NOT NULL,
                cpu VARCHAR(20) NOT NULL,
                hdd INTEGER NOT NULL,
                ram INTEGER NOT NULL,
                CONSTRAINT malli_pk PRIMARY KEY (mallinimi)
);
COMMENT ON COLUMN public.malli.hdd IS 'Amount in GB';
COMMENT ON COLUMN public.malli.ram IS 'Amount in GB';
 

CREATE TABLE public.tietokone (
                sarjanumero VARCHAR(50) NOT NULL,
                mallinimi VARCHAR(30) NOT NULL,
                CONSTRAINT tietokone_pk PRIMARY KEY (sarjanumero)
);
 

CREATE SEQUENCE public.asennettu_kortti_asennus_id_seq;
 
CREATE TABLE public.asennettu_kortti (
                asennus_id INTEGER NOT NULL DEFAULT nextval('public.asennettu_kortti_asennus_id_seq'),
                sarjanumero VARCHAR(50) NOT NULL,
                kortti_id INTEGER NOT NULL,
                CONSTRAINT asennettu_kortti_pk PRIMARY KEY (asennus_id)
);
 

ALTER SEQUENCE public.asennettu_kortti_asennus_id_seq OWNED BY public.asennettu_kortti.asennus_id;
 
CREATE SEQUENCE public.levypaivitys_paivitys_id_seq;
 
CREATE TABLE public.levypaivitys (
                paivitys_id INTEGER NOT NULL DEFAULT nextval('public.levypaivitys_paivitys_id_seq'),
                sarjanumero VARCHAR(50) NOT NULL,
                lisays BOOLEAN NOT NULL,
                levytila INTEGER NOT NULL,
                CONSTRAINT levypaivitys_pk PRIMARY KEY (paivitys_id)
);
COMMENT ON COLUMN public.levypaivitys.lisays IS 'True if more disks added, false when replaced with a new disk';
COMMENT ON COLUMN public.levypaivitys.levytila IS 'Amount of storage space added or replaced in GB';
 

ALTER SEQUENCE public.levypaivitys_paivitys_id_seq OWNED BY public.levypaivitys.paivitys_id;
 
CREATE SEQUENCE public.ram_paivitys_paivitys_id_seq;
 
CREATE TABLE public.ram_paivitys (
                paivitys_id INTEGER NOT NULL DEFAULT nextval('public.ram_paivitys_paivitys_id_seq'),
                sarjanumero VARCHAR(50) NOT NULL,
                lisays INTEGER NOT NULL,
                CONSTRAINT ram_paivitys_pk PRIMARY KEY (paivitys_id)
);
COMMENT ON COLUMN public.ram_paivitys.lisays IS 'Amount of RAM added in GB';
 

ALTER SEQUENCE public.ram_paivitys_paivitys_id_seq OWNED BY public.ram_paivitys.paivitys_id;
 
CREATE TABLE public.ryhma (
                nimi VARCHAR(30) NOT NULL,
                vastuuopettaja VARCHAR(30) NOT NULL,
                CONSTRAINT ryhma_pk PRIMARY KEY (nimi)
);
COMMENT ON TABLE public.ryhma IS 'Table is for the UI to populate drop down list for Opiskelija window / tab';
 

CREATE TABLE public.opiskelija (
                opiskelijanumero VARCHAR(8) NOT NULL,
                nimi VARCHAR(30) NOT NULL,
                etunimi VARCHAR(20) NOT NULL,
                sukunimi VARCHAR(20) NOT NULL,
                puhelin VARCHAR(15),
                sahkoposti VARCHAR(50),
                postinumero VARCHAR(10) NOT NULL,
                postitoimipaikka VARCHAR(30) NOT NULL,
                jakeluosoite VARCHAR(20) NOT NULL,
                valokuva BYTEA,
                CONSTRAINT opiskelija_pk PRIMARY KEY (opiskelijanumero)
);
COMMENT ON TABLE public.opiskelija IS 'Basic student information';
 

CREATE SEQUENCE public.lainaus_lainausnumero_seq;
 
CREATE TABLE public.lainaus (
                lainausnumero INTEGER NOT NULL DEFAULT nextval('public.lainaus_lainausnumero_seq'),
                opiskelijanumero VARCHAR(8) NOT NULL,
                sarjanumero VARCHAR(50) NOT NULL,
                lainauspaiva DATE NOT NULL,
                palautuspaiva DATE,
                CONSTRAINT lainaus_pk PRIMARY KEY (lainausnumero)
);
 

ALTER SEQUENCE public.lainaus_lainausnumero_seq OWNED BY public.lainaus.lainausnumero;
 
ALTER TABLE public.kortti ADD CONSTRAINT korttityyppi_kortti_fk
FOREIGN KEY (tyyppi)
REFERENCES public.korttityyppi (tyyppi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.malli ADD CONSTRAINT valmistaja_malli_fk
FOREIGN KEY (valmistaja_id)
REFERENCES public.valmistaja (valmistaja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.kortti ADD CONSTRAINT valmistaja_kortti_fk
FOREIGN KEY (valmistaja_id)
REFERENCES public.valmistaja (valmistaja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.asennettu_kortti ADD CONSTRAINT kortti_asennettu_kortti_fk
FOREIGN KEY (kortti_id)
REFERENCES public.kortti (kortti_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.tietokone ADD CONSTRAINT malli_tietokone_fk
FOREIGN KEY (mallinimi)
REFERENCES public.malli (mallinimi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.lainaus ADD CONSTRAINT tietokone_lainaus_fk
FOREIGN KEY (sarjanumero)
REFERENCES public.tietokone (sarjanumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.ram_paivitys ADD CONSTRAINT tietokone_ram_paivitys_fk
FOREIGN KEY (sarjanumero)
REFERENCES public.tietokone (sarjanumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.levypaivitys ADD CONSTRAINT tietokone_levypaivitys_fk
FOREIGN KEY (sarjanumero)
REFERENCES public.tietokone (sarjanumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.asennettu_kortti ADD CONSTRAINT tietokone_asennettu_kortti_fk
FOREIGN KEY (sarjanumero)
REFERENCES public.tietokone (sarjanumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.opiskelija ADD CONSTRAINT ryhma_opiskelija_fk
FOREIGN KEY (nimi)
REFERENCES public.ryhma (nimi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
 
ALTER TABLE public.lainaus ADD CONSTRAINT opiskelija_lainaus_fk
FOREIGN KEY (opiskelijanumero)
REFERENCES public.opiskelija (opiskelijanumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;