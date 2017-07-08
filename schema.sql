--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


--
-- Name: acesso_ace_cace_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acesso_ace_cace_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE acesso (
    ace_cace integer DEFAULT nextval('acesso_ace_cace_seq'::regclass) NOT NULL,
    ace_cpes integer,
    ace_logi character varying(20),
    ace_senh character varying(50),
    ace_perf character varying(6)
);


--
-- Name: campo_variavel_cva_ccva_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campo_variavel_cva_ccva_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campo_variavel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campo_variavel (
    cva_ccva integer DEFAULT nextval('campo_variavel_cva_ccva_seq'::regclass) NOT NULL,
    cva_ccme integer,
    cva_shab boolean,
    cva_shob boolean,
    cva_shde character varying(50),
    cva_evab boolean,
    cva_evob boolean,
    cva_cfab boolean,
    cva_cfob boolean,
    cva_fpab boolean,
    cva_fpob boolean,
    cva_emab boolean,
    cva_emob boolean,
    cva_tdab boolean,
    cva_tdob boolean,
    cva_toab boolean,
    cva_toob boolean,
    cva_ecab boolean,
    cva_ecob boolean,
    cva_tpab boolean,
    cva_tpob boolean,
    cva_esab boolean,
    cva_esob boolean
);


--
-- Name: codigo_cod_ccod_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE codigo_cod_ccod_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: codigo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE codigo (
    cod_ccod integer DEFAULT nextval('codigo_cod_ccod_seq'::regclass) NOT NULL,
    cod_desc character varying(100)
);


--
-- Name: codigo_item_cit_ccit_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE codigo_item_cit_ccit_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: codigo_item; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE codigo_item (
    cit_ccit integer DEFAULT nextval('codigo_item_cit_ccit_seq'::regclass) NOT NULL,
    cit_ccod integer,
    cit_codi character varying(6),
    cit_dres character varying(100),
    cit_desc character varying(250),
    cit_cam1 character varying(20),
    cit_cam2 character varying(20)
);


--
-- Name: contato_con_ccon_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contato_con_ccon_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: contato; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contato (
    con_ccon integer DEFAULT nextval('contato_con_ccon_seq'::regclass) NOT NULL,
    con_cpes integer,
    con_data date,
    con_habi boolean,
    con_cont character varying(80),
    con_tipo integer
);


--
-- Name: curso_cur_ccur_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE curso_cur_ccur_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: curso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE curso (
    cur_ccur integer DEFAULT nextval('curso_cur_ccur_seq'::regclass) NOT NULL,
    cur_ccme integer,
    cur_inst integer,
    cur_vaga integer,
    cur_dpin date,
    cur_drin date,
    cur_dpfi date,
    cur_drfi date,
    cur_ctot double precision,
    cur_ased character varying(6),
    cur_csed text,
    cur_aund character varying(6),
    cur_cund text,
    cur_uf character varying(6),
    cur_qpol integer,
    cur_pta bytea,
    cur_habi boolean,
    cur_aunc character varying(6),
    cur_cunc text
);


--
-- Name: curso_mestre_cme_ccme_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE curso_mestre_cme_ccme_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: curso_mestre; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE curso_mestre (
    cme_ccme integer DEFAULT nextval('curso_mestre_cme_ccme_seq'::regclass) NOT NULL,
    cme_nome character varying(300),
    cme_emen text,
    cme_oger text,
    cme_oesp text,
    cme_palv text,
    cme_modu text,
    cme_dura integer,
    cme_moda character varying(6),
    cme_hpre integer,
    cme_nive character varying(6),
    cme_chor integer,
    cme_requ text,
    cme_ofer integer,
    cme_titu character varying(6),
    cme_habi boolean
);


--
-- Name: instituicoes_ins_cins_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE instituicoes_ins_cins_seq
    START WITH 5600
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: instituicoes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE instituicoes (
    ins_cins integer DEFAULT nextval('instituicoes_ins_cins_seq'::regclass) NOT NULL,
    ins_uf character varying(50),
    ins_rede character varying(20),
    ins_dadm character varying(30),
    ins_muni character varying(100),
    ins_nome character varying(150),
    ins_cmun character varying(50),
    ins_sleg character varying(20)
);


--
-- Name: curso_nome; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW curso_nome AS
    SELECT curso.cur_ccur, curso.cur_ccme, curso.cur_inst, curso.cur_vaga, curso.cur_dpin, curso.cur_drin, curso.cur_dpfi, curso.cur_drfi, curso.cur_ctot, curso.cur_ased, curso.cur_csed, curso.cur_aund, curso.cur_cund, curso.cur_uf, curso.cur_qpol, curso.cur_pta, curso.cur_habi, curso_mestre.cme_ccme, curso_mestre.cme_nome, curso_mestre.cme_emen, curso_mestre.cme_oger, curso_mestre.cme_oesp, curso_mestre.cme_palv, curso_mestre.cme_modu, curso_mestre.cme_dura, curso_mestre.cme_moda, curso_mestre.cme_hpre, curso_mestre.cme_nive, curso_mestre.cme_chor, curso_mestre.cme_requ, curso_mestre.cme_ofer, curso_mestre.cme_titu, curso_mestre.cme_habi, instituicoes.ins_cins, instituicoes.ins_uf, instituicoes.ins_rede, instituicoes.ins_dadm, instituicoes.ins_muni, instituicoes.ins_nome, instituicoes.ins_cmun, instituicoes.ins_sleg, (((instituicoes.ins_nome)::text || ' - '::text) || (curso_mestre.cme_nome)::text) AS cur_nome FROM ((curso JOIN curso_mestre ON ((curso.cur_ccme = curso_mestre.cme_ccme))) JOIN instituicoes ON ((curso.cur_inst = instituicoes.ins_cins)));


--
-- Name: endereco_end_cend_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE endereco_end_cend_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: endereco; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE endereco (
    end_cend integer DEFAULT nextval('endereco_end_cend_seq'::regclass) NOT NULL,
    end_cpes integer,
    end_data date,
    end_habi boolean,
    end_uf character varying(6),
    end_cida character varying(60),
    end_bair character varying(100),
    end_plin character varying(50),
    end_slin character varying(50),
    end_cep character varying(10),
    end_tipo character varying(6)
);


--
-- Name: equipe_curso_mestre_ecm_cecm_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE equipe_curso_mestre_ecm_cecm_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: equipe_curso_mestre; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE equipe_curso_mestre (
    ecm_cecm integer DEFAULT nextval('equipe_curso_mestre_ecm_cecm_seq'::regclass) NOT NULL,
    ecm_func character varying(6),
    ecm_nive character varying(6),
    ecm_quan integer,
    ecm_fdoc boolean,
    ecm_ccme integer
);


--
-- Name: evento_eve_ceve_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE evento_eve_ceve_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: evento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE evento (
    eve_ceve integer DEFAULT nextval('evento_eve_ceve_seq'::regclass) NOT NULL,
    eve_ctur integer,
    eve_tipo character varying(6),
    eve_data date
);


--
-- Name: modulo_curso_mestre_mcm_cmcm_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE modulo_curso_mestre_mcm_cmcm_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: modulo_curso_mestre; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE modulo_curso_mestre (
    mcm_cmcm integer DEFAULT nextval('modulo_curso_mestre_mcm_cmcm_seq'::regclass) NOT NULL,
    mcm_dres character varying(100),
    mcm_desc character varying(200),
    mcm_chor integer,
    mcm_ccme integer
);


--
-- Name: municipios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipios (
    mun_cmun character varying(20) NOT NULL,
    mun_uf character varying(10),
    mun_desc character varying(100)
);


--
-- Name: municipios_mun_cmun_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipios_mun_cmun_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: municipios_prioritarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipios_prioritarios (
    mpr_cmpr character varying(20) NOT NULL,
    mpr_uf character varying(10),
    mpr_desc character varying(100)
);


--
-- Name: outra_experiencia_oex_coex_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outra_experiencia_oex_coex_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoa_pes_cpes_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_pes_cpes_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pessoa (
    pes_cpes integer DEFAULT nextval('pessoa_pes_cpes_seq'::regclass) NOT NULL,
    pes_cpf character varying(20),
    pes_nome character varying(250),
    pes_snom character varying(300),
    pes_rg character varying(30),
    pes_oexp character varying(30),
    pes_dnas date,
    pes_sexo character varying(6),
    pes_dcad date,
    pes_ddes date,
    pes_nesc character varying(6),
    pes_habi boolean
);


--
-- Name: pessoa_campo_variavel_pcv_cpcv_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_campo_variavel_pcv_cpcv_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoa_campo_variavel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pessoa_campo_variavel (
    pcv_cpcv integer DEFAULT nextval('pessoa_campo_variavel_pcv_cpcv_seq'::regclass) NOT NULL,
    pcv_cpes integer NOT NULL,
    pcv_cvtu integer NOT NULL,
    pcv_shno character varying(250),
    pcv_shem character varying(80),
    pcv_shte character varying(20),
    pcv_evde character varying(6),
    pcv_cfde character varying(6),
    pcv_fpde character varying(6),
    pcv_emde character varying(80),
    pcv_tdde character varying(80),
    pcv_tode character varying(80),
    pcv_ecde character varying(80),
    pcv_tpde character varying(80),
    pcv_esde character varying(80)
);


--
-- Name: pessoa_docente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pessoa_docente (
    pdo_cpdo integer NOT NULL,
    pdo_cpes integer NOT NULL,
    pdo_viof character varying(6)
);


--
-- Name: pessoa_docente_pdo_cpdo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_docente_pdo_cpdo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoa_docente_pdo_cpdo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_docente_pdo_cpdo_seq OWNED BY pessoa_docente.pdo_cpdo;


--
-- Name: pessoa_nome; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW pessoa_nome AS
    SELECT (((pessoa.pes_nome)::text || ' '::text) || (pessoa.pes_snom)::text) AS nome, pessoa.pes_cpes, pessoa.pes_cpf, pessoa.pes_nome, pessoa.pes_snom, pessoa.pes_rg, pessoa.pes_oexp, pessoa.pes_dnas, pessoa.pes_sexo, pessoa.pes_dcad, pessoa.pes_ddes, pessoa.pes_nesc, pessoa.pes_habi FROM pessoa;


--
-- Name: pessoa_professor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pessoa_professor (
    ppr_cppr integer NOT NULL,
    ppr_cpes integer NOT NULL,
    ppr_latt character varying(300),
    ppr_emag character varying(80)
);


--
-- Name: pessoa_professor_ppr_cppr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoa_professor_ppr_cppr_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoa_professor_ppr_cppr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoa_professor_ppr_cppr_seq OWNED BY pessoa_professor.ppr_cppr;


--
-- Name: polo_pol_cpol_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE polo_pol_cpol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: polo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE polo (
    pol_cpol integer DEFAULT nextval('polo_pol_cpol_seq'::regclass) NOT NULL,
    pol_dres character varying(200),
    pol_ccur integer
);


--
-- Name: rel_participantes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW rel_participantes AS
    SELECT pessoa.pes_cpes, pessoa.pes_cpf, pessoa.pes_nome, pessoa.pes_snom, pessoa.pes_rg, pessoa.pes_oexp, pessoa.pes_dnas, pessoa.pes_sexo, pessoa.pes_dcad, pessoa.pes_ddes, pessoa.pes_nesc, pessoa.pes_habi, (SELECT contato.con_cont FROM contato WHERE ((contato.con_cpes = pessoa.pes_cpes) AND (contato.con_tipo = 2)) ORDER BY contato.con_ccon DESC LIMIT 1) AS email FROM pessoa;


--
-- Name: suporte_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suporte_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: suporte_admin; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suporte_admin (
    id integer DEFAULT nextval('suporte_admin_seq'::regclass) NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    address character varying(255),
    phone character varying(255),
    adm_date date,
    email character varying(255),
    id_course character varying(255)
);


--
-- Name: suporte_coord_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suporte_coord_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: suporte_coord; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suporte_coord (
    id integer DEFAULT nextval('suporte_coord_seq'::regclass) NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    address character varying(255),
    phone character varying(255),
    adm_date date,
    email character varying(255),
    id_course character varying(255)
);


--
-- Name: suporte_status_curso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suporte_status_curso (
    id_course character varying(255) NOT NULL,
    id_coord integer,
    id_admin integer,
    status character varying(255),
    is_coord integer,
    is_admin integer
);


--
-- Name: titulo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE titulo (
    tit_ctit integer NOT NULL,
    tit_cpes integer,
    tit_nive character varying(6),
    tit_desc character varying(50),
    tit_acon integer,
    tit_moda character varying(6),
    tit_inst integer
);


--
-- Name: titulo_tit_ctit_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE titulo_tit_ctit_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: titulo_tit_ctit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE titulo_tit_ctit_seq OWNED BY titulo.tit_ctit;


--
-- Name: turma_tur_ctur_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE turma_tur_ctur_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: turma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE turma (
    tur_ctur integer DEFAULT nextval('turma_tur_ctur_seq'::regclass) NOT NULL,
    tur_ccur integer NOT NULL,
    tur_desc character varying(100)
);


--
-- Name: vinculo_vin_cvtu_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vinculo_vin_cvtu_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: vinculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vinculo (
    vin_cvtu integer DEFAULT nextval('vinculo_vin_cvtu_seq'::regclass) NOT NULL,
    vin_tipo character varying(6),
    vin_cpes integer,
    vin_ctur integer,
    vin_ccur integer,
    vin_cmcm integer,
    vin_situ character varying(6),
    vin_dini date,
    vin_dfim date
);


--
-- Name: vinculo_trabalho_vtr_cvtr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vinculo_trabalho_vtr_cvtr_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: vinculo_trabalho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vinculo_trabalho (
    vtr_cvtr integer DEFAULT nextval('vinculo_trabalho_vtr_cvtr_seq'::regclass) NOT NULL,
    vtr_uf character varying(6),
    vtr_muni character varying(10),
    vtr_esco character varying(10),
    vtr_carg character varying(6),
    vtr_fpca character varying(6),
    vtr_dini date,
    vtr_dfim date
);


--
-- Name: pdo_cpdo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_docente ALTER COLUMN pdo_cpdo SET DEFAULT nextval('pessoa_docente_pdo_cpdo_seq'::regclass);


--
-- Name: ppr_cppr; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_professor ALTER COLUMN ppr_cppr SET DEFAULT nextval('pessoa_professor_ppr_cppr_seq'::regclass);


--
-- Name: tit_ctit; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY titulo ALTER COLUMN tit_ctit SET DEFAULT nextval('titulo_tit_ctit_seq'::regclass);


--
-- Name: acesso_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY acesso
    ADD CONSTRAINT acesso_pkey PRIMARY KEY (ace_cace);


--
-- Name: campo_variavel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campo_variavel
    ADD CONSTRAINT campo_variavel_pkey PRIMARY KEY (cva_ccva);


--
-- Name: codigo_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY codigo_item
    ADD CONSTRAINT codigo_item_pkey PRIMARY KEY (cit_ccit);


--
-- Name: codigo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY codigo
    ADD CONSTRAINT codigo_pkey PRIMARY KEY (cod_ccod);


--
-- Name: contato_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (con_ccon);


--
-- Name: curso_mestre_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY curso_mestre
    ADD CONSTRAINT curso_mestre_pkey PRIMARY KEY (cme_ccme);


--
-- Name: curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (cur_ccur);


--
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (end_cend);


--
-- Name: equipe_curso_mestre_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipe_curso_mestre
    ADD CONSTRAINT equipe_curso_mestre_pkey PRIMARY KEY (ecm_cecm);


--
-- Name: evento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (eve_ceve);


--
-- Name: instituicoes_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY instituicoes
    ADD CONSTRAINT instituicoes_pk PRIMARY KEY (ins_cins);


--
-- Name: modulo_curso_mestre_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modulo_curso_mestre
    ADD CONSTRAINT modulo_curso_mestre_pkey PRIMARY KEY (mcm_cmcm);


--
-- Name: municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (mun_cmun);


--
-- Name: pessoa_campo_variavel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pessoa_campo_variavel
    ADD CONSTRAINT pessoa_campo_variavel_pkey PRIMARY KEY (pcv_cpcv);


--
-- Name: pessoa_docente_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pessoa_docente
    ADD CONSTRAINT pessoa_docente_pkey PRIMARY KEY (pdo_cpdo);


--
-- Name: pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (pes_cpes);


--
-- Name: pessoa_professor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pessoa_professor
    ADD CONSTRAINT pessoa_professor_pkey PRIMARY KEY (ppr_cppr);


--
-- Name: polo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY polo
    ADD CONSTRAINT polo_pkey PRIMARY KEY (pol_cpol);


--
-- Name: suporte_admin_id_course_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_admin
    ADD CONSTRAINT suporte_admin_id_course_key UNIQUE (id_course);


--
-- Name: suporte_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_admin
    ADD CONSTRAINT suporte_admin_pkey PRIMARY KEY (id);


--
-- Name: suporte_coord_id_course_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_coord
    ADD CONSTRAINT suporte_coord_id_course_key UNIQUE (id_course);


--
-- Name: suporte_coord_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_coord
    ADD CONSTRAINT suporte_coord_pkey PRIMARY KEY (id);


--
-- Name: suporte_status_curso_id_course_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_status_curso
    ADD CONSTRAINT suporte_status_curso_id_course_key UNIQUE (id_course, is_coord);


--
-- Name: suporte_status_curso_id_course_key1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suporte_status_curso
    ADD CONSTRAINT suporte_status_curso_id_course_key1 UNIQUE (id_course, is_admin);


--
-- Name: titulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY titulo
    ADD CONSTRAINT titulo_pkey PRIMARY KEY (tit_ctit);


--
-- Name: turma_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (tur_ctur);


--
-- Name: vinculo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_pkey PRIMARY KEY (vin_cvtu);


--
-- Name: vinculo_trabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vinculo_trabalho
    ADD CONSTRAINT vinculo_trabalho_pkey PRIMARY KEY (vtr_cvtr);


--
-- Name: acesso_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX acesso_fkindex1 ON acesso USING btree (ace_cpes);


--
-- Name: campo_variavel_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX campo_variavel_fkindex1 ON campo_variavel USING btree (cva_ccme);


--
-- Name: codigo_item_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX codigo_item_fkindex1 ON codigo_item USING btree (cit_ccod);


--
-- Name: contato_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX contato_fkindex1 ON contato USING btree (con_cpes);


--
-- Name: curso_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX curso_fkindex1 ON curso USING btree (cur_ccme);


--
-- Name: endereco_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX endereco_fkindex1 ON endereco USING btree (end_cpes);


--
-- Name: equipe_curso_mestre_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX equipe_curso_mestre_fkindex1 ON equipe_curso_mestre USING btree (ecm_ccme);


--
-- Name: evento_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX evento_fkindex1 ON evento USING btree (eve_ctur);


--
-- Name: ifk_codigoxitem; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_codigoxitem ON codigo_item USING btree (cit_ccod);


--
-- Name: ifk_cursomestrexcampovariavel; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursomestrexcampovariavel ON campo_variavel USING btree (cva_ccme);


--
-- Name: ifk_cursomestrexcurso; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursomestrexcurso ON curso USING btree (cur_ccme);


--
-- Name: ifk_cursomestrexequipe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursomestrexequipe ON equipe_curso_mestre USING btree (ecm_ccme);


--
-- Name: ifk_cursomestrexmodulo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursomestrexmodulo ON modulo_curso_mestre USING btree (mcm_ccme);


--
-- Name: ifk_cursoxpolo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursoxpolo ON polo USING btree (pol_ccur);


--
-- Name: ifk_cursoxturma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursoxturma ON turma USING btree (tur_ccur);


--
-- Name: ifk_cursoxvinculo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_cursoxvinculo ON vinculo USING btree (vin_ccur);


--
-- Name: ifk_moduloxvinculo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_moduloxvinculo ON vinculo USING btree (vin_cmcm);


--
-- Name: ifk_pessoaxacesso; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxacesso ON acesso USING btree (ace_cpes);


--
-- Name: ifk_pessoaxcontato; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxcontato ON contato USING btree (con_cpes);


--
-- Name: ifk_pessoaxendereco; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxendereco ON endereco USING btree (end_cpes);


--
-- Name: ifk_pessoaxpessoacampovariavel; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxpessoacampovariavel ON pessoa_campo_variavel USING btree (pcv_cpes);


--
-- Name: ifk_pessoaxpessoadocente; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxpessoadocente ON pessoa_docente USING btree (pdo_cpes);


--
-- Name: ifk_pessoaxpessoaprofessor; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxpessoaprofessor ON pessoa_professor USING btree (ppr_cpes);


--
-- Name: ifk_pessoaxtitulo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxtitulo ON titulo USING btree (tit_cpes);


--
-- Name: ifk_pessoaxvinculo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_pessoaxvinculo ON vinculo USING btree (vin_cpes);


--
-- Name: ifk_turmaxevento; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_turmaxevento ON evento USING btree (eve_ctur);


--
-- Name: ifk_turmaxvinculo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_turmaxvinculo ON vinculo USING btree (vin_ctur);


--
-- Name: ifk_vinculoxpessoacampovariave; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ifk_vinculoxpessoacampovariave ON pessoa_campo_variavel USING btree (pcv_cvtu);


--
-- Name: modulo_curso_mestre_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX modulo_curso_mestre_fkindex1 ON modulo_curso_mestre USING btree (mcm_ccme);


--
-- Name: pessoa_campo_variavel_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pessoa_campo_variavel_fkindex1 ON pessoa_campo_variavel USING btree (pcv_cpes);


--
-- Name: pessoa_campo_variavel_fkindex2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pessoa_campo_variavel_fkindex2 ON pessoa_campo_variavel USING btree (pcv_cvtu);


--
-- Name: pessoa_docente_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pessoa_docente_fkindex1 ON pessoa_docente USING btree (pdo_cpes);


--
-- Name: pessoa_graduacao_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pessoa_graduacao_fkindex1 ON pessoa_professor USING btree (ppr_cpes);


--
-- Name: polo_fkindex2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX polo_fkindex2 ON polo USING btree (pol_ccur);


--
-- Name: titulo_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX titulo_fkindex1 ON titulo USING btree (tit_cpes);


--
-- Name: turma_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX turma_fkindex1 ON turma USING btree (tur_ccur);


--
-- Name: vinculo_fkindex4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX vinculo_fkindex4 ON vinculo USING btree (vin_cmcm);


--
-- Name: vinculo_turma_fkindex1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX vinculo_turma_fkindex1 ON vinculo USING btree (vin_cpes);


--
-- Name: vinculo_turma_fkindex2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX vinculo_turma_fkindex2 ON vinculo USING btree (vin_ctur);


--
-- Name: vinculo_turma_fkindex3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX vinculo_turma_fkindex3 ON vinculo USING btree (vin_ccur);


--
-- Name: acesso_ace_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acesso
    ADD CONSTRAINT acesso_ace_cpes_fkey FOREIGN KEY (ace_cpes) REFERENCES pessoa(pes_cpes) ON DELETE CASCADE;


--
-- Name: campo_variavel_cva_ccme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY campo_variavel
    ADD CONSTRAINT campo_variavel_cva_ccme_fkey FOREIGN KEY (cva_ccme) REFERENCES curso_mestre(cme_ccme) ON DELETE CASCADE;


--
-- Name: codigo_item_cit_ccod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY codigo_item
    ADD CONSTRAINT codigo_item_cit_ccod_fkey FOREIGN KEY (cit_ccod) REFERENCES codigo(cod_ccod) ON DELETE CASCADE;


--
-- Name: contato_con_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_con_cpes_fkey FOREIGN KEY (con_cpes) REFERENCES pessoa(pes_cpes) ON DELETE CASCADE;


--
-- Name: curso_cur_ccme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_cur_ccme_fkey FOREIGN KEY (cur_ccme) REFERENCES curso_mestre(cme_ccme) ON DELETE CASCADE;


--
-- Name: endereco_end_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_end_cpes_fkey FOREIGN KEY (end_cpes) REFERENCES pessoa(pes_cpes) ON DELETE CASCADE;


--
-- Name: equipe_curso_mestre_ecm_ccme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY equipe_curso_mestre
    ADD CONSTRAINT equipe_curso_mestre_ecm_ccme_fkey FOREIGN KEY (ecm_ccme) REFERENCES curso_mestre(cme_ccme) ON DELETE CASCADE;


--
-- Name: evento_eve_ctur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_eve_ctur_fkey FOREIGN KEY (eve_ctur) REFERENCES turma(tur_ctur) ON DELETE CASCADE;


--
-- Name: modulo_curso_mestre_mcm_ccme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modulo_curso_mestre
    ADD CONSTRAINT modulo_curso_mestre_mcm_ccme_fkey FOREIGN KEY (mcm_ccme) REFERENCES curso_mestre(cme_ccme) ON DELETE CASCADE;


--
-- Name: pessoa_campo_variavel_pcv_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_campo_variavel
    ADD CONSTRAINT pessoa_campo_variavel_pcv_cpes_fkey FOREIGN KEY (pcv_cpes) REFERENCES pessoa(pes_cpes);


--
-- Name: pessoa_campo_variavel_pcv_cvtu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoa_campo_variavel
    ADD CONSTRAINT pessoa_campo_variavel_pcv_cvtu_fkey FOREIGN KEY (pcv_cvtu) REFERENCES vinculo(vin_cvtu);


--
-- Name: polo_pol_ccur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polo
    ADD CONSTRAINT polo_pol_ccur_fkey FOREIGN KEY (pol_ccur) REFERENCES curso(cur_ccur) ON DELETE CASCADE;


--
-- Name: titulo_tit_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY titulo
    ADD CONSTRAINT titulo_tit_cpes_fkey FOREIGN KEY (tit_cpes) REFERENCES pessoa(pes_cpes) ON DELETE CASCADE;


--
-- Name: turma_tur_ccur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_tur_ccur_fkey FOREIGN KEY (tur_ccur) REFERENCES curso(cur_ccur) ON DELETE CASCADE;


--
-- Name: vinculo_vin_ccur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_vin_ccur_fkey FOREIGN KEY (vin_ccur) REFERENCES curso(cur_ccur) ON DELETE CASCADE;


--
-- Name: vinculo_vin_cmcm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_vin_cmcm_fkey FOREIGN KEY (vin_cmcm) REFERENCES modulo_curso_mestre(mcm_cmcm) ON DELETE CASCADE;


--
-- Name: vinculo_vin_cpes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_vin_cpes_fkey FOREIGN KEY (vin_cpes) REFERENCES pessoa(pes_cpes) ON DELETE CASCADE;


--
-- Name: vinculo_vin_ctur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_vin_ctur_fkey FOREIGN KEY (vin_ctur) REFERENCES turma(tur_ctur) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

