--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: TEUSAPP_CRM; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TEUSAPP_CRM" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


ALTER DATABASE "TEUSAPP_CRM" OWNER TO postgres;

\connect "TEUSAPP_CRM"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE "TEUSAPP_CRM"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "TEUSAPP_CRM" IS 'Aplicativo para la movilidad';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: TBL_RBARRIO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RBARRIO" (
    "BAR_NID" bigint NOT NULL,
    "BAR_CDESCRIPCION" character(150),
    "LOC_NID" smallint
);


ALTER TABLE public."TBL_RBARRIO" OWNER TO postgres;

--
-- Name: TBL_RCENTRO_TECNICO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RCENTRO_TECNICO" (
    "CTEC_NID" smallint NOT NULL,
    "CTEC_CDESCRIPCION" character(150)
);


ALTER TABLE public."TBL_RCENTRO_TECNICO" OWNER TO postgres;

--
-- Name: TBL_RLOCALIDAD; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RLOCALIDAD" (
    "LOC_NID" smallint NOT NULL,
    "LOC_CDESCRIPCION" character(100)
);


ALTER TABLE public."TBL_RLOCALIDAD" OWNER TO postgres;

--
-- Name: TBL_RNORMA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RNORMA" (
    "NORM_NID" bigint NOT NULL,
    "NORM_CDESCRIPCION" character(150),
    "NORM_OESTADO" bit(1)
);


ALTER TABLE public."TBL_RNORMA" OWNER TO postgres;

--
-- Name: TBL_RPERFIL; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RPERFIL" (
    "PER_NID" smallint NOT NULL,
    "PER_CDESCRIPCION" character(50),
    "PER_OESTADO" bit(1)
);


ALTER TABLE public."TBL_RPERFIL" OWNER TO postgres;

--
-- Name: TBL_RTIPO_VEHICULO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RTIPO_VEHICULO" (
    "TIPV_NID" integer NOT NULL,
    "TIPV_OESTADO" boolean,
    "TIPV_CDESCRIPCION" text
);


ALTER TABLE public."TBL_RTIPO_VEHICULO" OWNER TO postgres;

--
-- Name: TABLE "TBL_RTIPO_VEHICULO"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TBL_RTIPO_VEHICULO" IS 'Maestro relacional de los tipos de vehiculos';


--
-- Name: COLUMN "TBL_RTIPO_VEHICULO"."TIPV_OESTADO"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TBL_RTIPO_VEHICULO"."TIPV_OESTADO" IS 'ESTADOS
0= FALSE
1= TRUE';


--
-- Name: TBL_RUSUARIO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_RUSUARIO" (
    "USU_NID" smallint NOT NULL,
    "USU_CNOMAPELL" character(80),
    "USU_CTELEFONO" character(20),
    "USU_OESTADO" bit(1),
    "PER_NID" smallint
);


ALTER TABLE public."TBL_RUSUARIO" OWNER TO postgres;

--
-- Name: TBL_TCAPACITACION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_TCAPACITACION" (
    "CAP_NID" bigint NOT NULL,
    "CAP_DFECHA" date,
    "CAP_NETAPA" integer,
    "CAP_COBSERVACION" text,
    "CTEC_NID" smallint
);


ALTER TABLE public."TBL_TCAPACITACION" OWNER TO postgres;

--
-- Name: TBL_TEVIDENCIA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_TEVIDENCIA" (
    "EVID_NID" bigint NOT NULL,
    "EVID_CRUTA_FILE" character(150),
    "EVID_OESTADO" bit(1)
);


ALTER TABLE public."TBL_TEVIDENCIA" OWNER TO postgres;

--
-- Name: TBL_TINFRACION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_TINFRACION" (
    "INF_NID" bigint NOT NULL,
    "INF_DFECHA" date,
    "INF_NIDENTIFICACION" numeric,
    "INF_CPLACA" character(10),
    "TIPV_NID" integer,
    "USU_NID" integer,
    "INF_COBSERVACION" text,
    "BAR_NID" smallint
);


ALTER TABLE public."TBL_TINFRACION" OWNER TO postgres;

--
-- Name: TABLE "TBL_TINFRACION"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TBL_TINFRACION" IS 'Encabezado de infraciones (transaccional)';


--
-- Name: TBL_TINFRACION_DET; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_TINFRACION_DET" (
    "DINF_NID" bigint NOT NULL,
    "INF_NID" bigint,
    "NORM_NID" bigint,
    "DINF_OESTADO" bit(1)
);


ALTER TABLE public."TBL_TINFRACION_DET" OWNER TO postgres;

--
-- Name: TABLE "TBL_TINFRACION_DET"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TBL_TINFRACION_DET" IS 'Detalle de infracciones';


--
-- Name: TBL_UCAPACITACION_INFRACCION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_UCAPACITACION_INFRACCION" (
    "CAP_NID" bigint,
    "INF_NID" bigint
);


ALTER TABLE public."TBL_UCAPACITACION_INFRACCION" OWNER TO postgres;

--
-- Name: TBL_UINFRACION_EVIDENCIA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TBL_UINFRACION_EVIDENCIA" (
    "INF_NID" bigint,
    "EVID_NID" bigint
);


ALTER TABLE public."TBL_UINFRACION_EVIDENCIA" OWNER TO postgres;

--
-- Name: TBL_RTIPO_VEHICULO FK_TIPV_NID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RTIPO_VEHICULO"
    ADD CONSTRAINT "FK_TIPV_NID" PRIMARY KEY ("TIPV_NID");


--
-- Name: TBL_RBARRIO TBL_RBARRIO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RBARRIO"
    ADD CONSTRAINT "TBL_RBARRIO_pkey" PRIMARY KEY ("BAR_NID");


--
-- Name: TBL_RCENTRO_TECNICO TBL_RCENTRO_TECNICO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RCENTRO_TECNICO"
    ADD CONSTRAINT "TBL_RCENTRO_TECNICO_pkey" PRIMARY KEY ("CTEC_NID");


--
-- Name: TBL_RLOCALIDAD TBL_RLOCALIDAD_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RLOCALIDAD"
    ADD CONSTRAINT "TBL_RLOCALIDAD_pkey" PRIMARY KEY ("LOC_NID");


--
-- Name: TBL_RNORMA TBL_RNORMA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RNORMA"
    ADD CONSTRAINT "TBL_RNORMA_pkey" PRIMARY KEY ("NORM_NID");


--
-- Name: TBL_RPERFIL TBL_RPERFIL_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RPERFIL"
    ADD CONSTRAINT "TBL_RPERFIL_pkey" PRIMARY KEY ("PER_NID");


--
-- Name: TBL_RUSUARIO TBL_RUSUARIO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RUSUARIO"
    ADD CONSTRAINT "TBL_RUSUARIO_pkey" PRIMARY KEY ("USU_NID");


--
-- Name: TBL_TCAPACITACION TBL_TCAPACITACION_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TCAPACITACION"
    ADD CONSTRAINT "TBL_TCAPACITACION_pkey" PRIMARY KEY ("CAP_NID");


--
-- Name: TBL_TEVIDENCIA TBL_TEVIDENCIA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TEVIDENCIA"
    ADD CONSTRAINT "TBL_TEVIDENCIA_pkey" PRIMARY KEY ("EVID_NID");


--
-- Name: TBL_TINFRACION_DET TBL_TINFRACION_DET_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION_DET"
    ADD CONSTRAINT "TBL_TINFRACION_DET_pkey" PRIMARY KEY ("DINF_NID");


--
-- Name: TBL_TINFRACION TBL_TINFRACION_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION"
    ADD CONSTRAINT "TBL_TINFRACION_pkey" PRIMARY KEY ("INF_NID");


--
-- Name: TBL_RBARRIO TBL_RBARRIO_LOC_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RBARRIO"
    ADD CONSTRAINT "TBL_RBARRIO_LOC_NID_fkey" FOREIGN KEY ("LOC_NID") REFERENCES public."TBL_RLOCALIDAD"("LOC_NID");


--
-- Name: TBL_RUSUARIO TBL_RUSUARIO_PER_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_RUSUARIO"
    ADD CONSTRAINT "TBL_RUSUARIO_PER_NID_fkey" FOREIGN KEY ("PER_NID") REFERENCES public."TBL_RPERFIL"("PER_NID");


--
-- Name: TBL_TCAPACITACION TBL_TCAPACITACION_CTEC_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TCAPACITACION"
    ADD CONSTRAINT "TBL_TCAPACITACION_CTEC_NID_fkey" FOREIGN KEY ("CTEC_NID") REFERENCES public."TBL_RCENTRO_TECNICO"("CTEC_NID");


--
-- Name: TBL_TINFRACION TBL_TINFRACION_BAR_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION"
    ADD CONSTRAINT "TBL_TINFRACION_BAR_NID_fkey" FOREIGN KEY ("BAR_NID") REFERENCES public."TBL_RBARRIO"("BAR_NID");


--
-- Name: TBL_TINFRACION_DET TBL_TINFRACION_DET_INF_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION_DET"
    ADD CONSTRAINT "TBL_TINFRACION_DET_INF_NID_fkey" FOREIGN KEY ("INF_NID") REFERENCES public."TBL_TINFRACION"("INF_NID");


--
-- Name: TBL_TINFRACION_DET TBL_TINFRACION_DET_NORM_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION_DET"
    ADD CONSTRAINT "TBL_TINFRACION_DET_NORM_NID_fkey" FOREIGN KEY ("NORM_NID") REFERENCES public."TBL_RNORMA"("NORM_NID");


--
-- Name: TBL_TINFRACION TBL_TINFRACION_TIPV_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION"
    ADD CONSTRAINT "TBL_TINFRACION_TIPV_NID_fkey" FOREIGN KEY ("TIPV_NID") REFERENCES public."TBL_RTIPO_VEHICULO"("TIPV_NID");


--
-- Name: TBL_TINFRACION TBL_TINFRACION_USU_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_TINFRACION"
    ADD CONSTRAINT "TBL_TINFRACION_USU_NID_fkey" FOREIGN KEY ("USU_NID") REFERENCES public."TBL_RUSUARIO"("USU_NID");


--
-- Name: TBL_UCAPACITACION_INFRACCION TBL_UCAPACITACION_INFRACCION_CAP_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_UCAPACITACION_INFRACCION"
    ADD CONSTRAINT "TBL_UCAPACITACION_INFRACCION_CAP_NID_fkey" FOREIGN KEY ("CAP_NID") REFERENCES public."TBL_TCAPACITACION"("CAP_NID");


--
-- Name: TBL_UCAPACITACION_INFRACCION TBL_UCAPACITACION_INFRACCION_INF_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_UCAPACITACION_INFRACCION"
    ADD CONSTRAINT "TBL_UCAPACITACION_INFRACCION_INF_NID_fkey" FOREIGN KEY ("INF_NID") REFERENCES public."TBL_TINFRACION"("INF_NID");


--
-- Name: TBL_UINFRACION_EVIDENCIA TBL_UINFRACION_EVIDENCIA_EVID_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_UINFRACION_EVIDENCIA"
    ADD CONSTRAINT "TBL_UINFRACION_EVIDENCIA_EVID_NID_fkey" FOREIGN KEY ("EVID_NID") REFERENCES public."TBL_TEVIDENCIA"("EVID_NID");


--
-- Name: TBL_UINFRACION_EVIDENCIA TBL_UINFRACION_EVIDENCIA_INF_NID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TBL_UINFRACION_EVIDENCIA"
    ADD CONSTRAINT "TBL_UINFRACION_EVIDENCIA_INF_NID_fkey" FOREIGN KEY ("INF_NID") REFERENCES public."TBL_TINFRACION"("INF_NID");


--
-- Name: TABLE "TBL_RBARRIO"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RBARRIO" TO PUBLIC;


--
-- Name: TABLE "TBL_RCENTRO_TECNICO"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RCENTRO_TECNICO" TO PUBLIC;


--
-- Name: TABLE "TBL_RLOCALIDAD"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RLOCALIDAD" TO PUBLIC;


--
-- Name: TABLE "TBL_RNORMA"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RNORMA" TO PUBLIC;


--
-- Name: TABLE "TBL_RPERFIL"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RPERFIL" TO PUBLIC;


--
-- Name: TABLE "TBL_RTIPO_VEHICULO"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RTIPO_VEHICULO" TO PUBLIC;


--
-- Name: TABLE "TBL_RUSUARIO"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_RUSUARIO" TO PUBLIC;


--
-- Name: TABLE "TBL_TCAPACITACION"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_TCAPACITACION" TO PUBLIC;


--
-- Name: TABLE "TBL_TEVIDENCIA"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_TEVIDENCIA" TO PUBLIC;


--
-- Name: TABLE "TBL_TINFRACION"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_TINFRACION" TO PUBLIC;


--
-- Name: TABLE "TBL_TINFRACION_DET"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_TINFRACION_DET" TO PUBLIC;


--
-- Name: TABLE "TBL_UCAPACITACION_INFRACCION"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_UCAPACITACION_INFRACCION" TO PUBLIC;


--
-- Name: TABLE "TBL_UINFRACION_EVIDENCIA"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."TBL_UINFRACION_EVIDENCIA" TO PUBLIC;


--
-- PostgreSQL database dump complete
--

