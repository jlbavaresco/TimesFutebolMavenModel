--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13 (Debian 11.13-1.pgdg100+1)
-- Dumped by pg_dump version 11.13 (Debian 11.13-1.pgdg100+1)

-- Started on 2021-09-21 13:55:07 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.permissoes DROP CONSTRAINT fksvnmcccxhr3ivf0io79vhafkg;
ALTER TABLE ONLY public.jogador DROP CONSTRAINT fkju3raetrq5m1rbvxx5csr259n;
ALTER TABLE ONLY public.permissoes DROP CONSTRAINT fkhu7byq8yjq4b4pegvox97bli1;
ALTER TABLE ONLY public."time" DROP CONSTRAINT fkhdx9wo4ouhh9i5kbxovv9n2nt;
ALTER TABLE ONLY public."time" DROP CONSTRAINT fkh6xgwaldy7ag2gua3skpo02it;
ALTER TABLE ONLY public.jogador DROP CONSTRAINT fkh1cfee31xu1jv8q3nm0rxc2rg;
ALTER TABLE ONLY public.cidade DROP CONSTRAINT fkedwmmd3jtkssgrwyugrindb7j;
ALTER TABLE ONLY public.jogador DROP CONSTRAINT fka3p2268d11v0u72yepscons01;
ALTER TABLE ONLY public."time" DROP CONSTRAINT fk4f4p8w6jhvx5lcidu02u4aqr1;
ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
ALTER TABLE ONLY public.posicao DROP CONSTRAINT posicao_pkey;
ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_pkey;
ALTER TABLE ONLY public.permissao DROP CONSTRAINT permissao_pkey;
ALTER TABLE ONLY public.jogador DROP CONSTRAINT jogador_pkey;
ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
ALTER TABLE ONLY public.cidade DROP CONSTRAINT cidade_pkey;
DROP TABLE public.usuario;
DROP TABLE public."time";
DROP SEQUENCE public.seq_time_id;
DROP SEQUENCE public.seq_posicao_id;
DROP SEQUENCE public.seq_pessoa_id;
DROP SEQUENCE public.seq_estado_id;
DROP SEQUENCE public.seq_cidade_id;
DROP TABLE public.posicao;
DROP TABLE public.pessoa;
DROP TABLE public.permissoes;
DROP TABLE public.permissao;
DROP TABLE public.jogador;
DROP TABLE public.estado;
DROP TABLE public.cidade;
DROP FUNCTION public.inseredadosestados(length integer);
--
-- TOC entry 210 (class 1255 OID 28771)
-- Name: inseredadosestados(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inseredadosestados(length integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare

begin

  for i in 1..length loop
    insert into estado (id, nome, uf ) values 
	(nextval('seq_estado_id'), 
	md5(random()::text) , SUBSTRING(md5(random()::text) FROM 0 FOR 3));
  end loop;
  
end;
$$;


ALTER FUNCTION public.inseredadosestados(length integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 19174)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    estado integer NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 19167)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    uf character varying(2) NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19300)
-- Name: jogador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogador (
    altura numeric(4,2) NOT NULL,
    peso numeric(6,3) NOT NULL,
    id integer NOT NULL,
    posicao integer NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.jogador OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19248)
-- Name: permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissao (
    nome character varying(30) NOT NULL,
    descricao character varying(40) NOT NULL
);


ALTER TABLE public.permissao OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 19253)
-- Name: permissoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissoes (
    nome_usuario character varying(20) NOT NULL,
    permissao character varying(30) NOT NULL
);


ALTER TABLE public.permissoes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19268)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    id integer NOT NULL,
    cpf character varying(14) NOT NULL,
    nascimento date NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 19219)
-- Name: posicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posicao (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.posicao OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 19179)
-- Name: seq_cidade_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_cidade_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_cidade_id OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 19172)
-- Name: seq_estado_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_estado_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_estado_id OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 19273)
-- Name: seq_pessoa_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pessoa_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pessoa_id OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 19224)
-- Name: seq_posicao_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_posicao_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_posicao_id OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 19283)
-- Name: seq_time_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_time_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_time_id OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 19275)
-- Name: time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."time" (
    id integer NOT NULL,
    data_fundacao date NOT NULL,
    historia text,
    nome character varying(50) NOT NULL,
    cidade integer NOT NULL,
    tecnico integer NOT NULL,
    usuario character varying(20) NOT NULL
);


ALTER TABLE public."time" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 19186)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    nome_usuario character varying(20) NOT NULL,
    ativo boolean NOT NULL,
    data_cadastro date NOT NULL,
    email character varying(50) NOT NULL,
    nome character varying(50) NOT NULL,
    senha character varying(20) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 19174)
-- Dependencies: 198
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cidade (id, nome, estado) FROM stdin;
1	Passo Fundo	1
2	Porto Alegre	1
\.


--
-- TOC entry 2965 (class 0 OID 19167)
-- Dependencies: 196
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id, nome, uf) FROM stdin;
1	Rio Grande do Sul	RS
5	Paraná	PR
2	Santa Catarina	SC
6	São Paulo	SP
10	Rio de Janeiro	RJ
11	Minas Gerais	MG
12	Distrito Federal	DF
13	Bahia	PE
14	Minas Gerais	BA
15	Minas Gerais	RJ
16	Ceará	BA
17	Rio de Janeiro	RS
18	Ceará	SP
19	São Paulo	RJ
20	Pernambuco	SP
21	Rio Grande do Sul	MG
22	Bahia	CE
23	São Paulo	PA
24	Ceará	BA
25	Paraná	BA
26	Minas Gerais	PE
27	Minas Gerais	SP
29	Pará	SP
30	Rio Grande do Sul	BA
31	Rio Grande do Sul	PR
32	Pernambuco	CE
33	Goiás	RJ
34	São Paulo	SP
35	Paraíba	RJ
36	Bahia	RJ
37	Minas Gerais	RJ
38	São Paulo	RJ
39	Paraná	SP
40	Rio de Janeiro	PA
41	Paraná	PE
42	Goiás	BA
43	Minas Gerais	MG
45	Paraná	SP
46	Bahia	MG
47	Santa Catarina	SP
48	Ceará	SP
49	São Paulo	SP
50	Pernambuco	SP
51	Bahia	SP
52	Rio Grande do Sul	SP
53	Paraíba	CE
54	Rio de Janeiro	GO
55	Bahia	PE
56	Pernambuco	RJ
57	Santa Catarina	PR
58	Minas Gerais	MG
59	São Paulo	MG
60	Rio Grande do Sul	SP
61	Paraná	SP
62	Pará	SP
63	Paraná	RS
64	Minas Gerais	MG
65	Ceará	PA
66	São Paulo	RJ
67	Rio de Janeiro	SC
68	Paraná	MG
69	Ceará	PE
70	São Paulo	CE
71	Rio Grande do Sul	RJ
72	São Paulo	BA
73	Minas Gerais	SP
74	Rio de Janeiro	PE
75	Rio de Janeiro	SC
76	Pará	BA
77	Paraná	MG
78	São Paulo	PE
79	São Paulo	MA
80	Pernambuco	BA
81	Santa Catarina	PE
82	Minas Gerais	PR
83	Pará	RJ
84	São Paulo	GO
85	Bahia	MG
86	Rio Grande do Sul	MA
87	Rio Grande do Sul	SP
88	Goiás	SP
89	Rio de Janeiro	RS
90	São Paulo	SP
91	Paraná	MG
92	Minas Gerais	BA
93	Pernambuco	BA
94	Minas Gerais	SP
95	Minas Gerais	RJ
96	Minas Gerais	BA
97	São Paulo	BA
98	Maranhão	PE
99	Ceará	PR
100	Minas Gerais	BA
\.


--
-- TOC entry 2978 (class 0 OID 19300)
-- Dependencies: 209
-- Data for Name: jogador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogador (altura, peso, id, posicao, "time") FROM stdin;
1.84	80.500	3	1	1
1.90	90.000	7	3	2
1.65	70.000	8	6	2
86.00	1.900	9	2	1
\.


--
-- TOC entry 2972 (class 0 OID 19248)
-- Dependencies: 203
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissao (nome, descricao) FROM stdin;
ADMINISTRADOR	Permissão para adminstradores
USUARIO	Permissão para usuários comuns
\.


--
-- TOC entry 2973 (class 0 OID 19253)
-- Dependencies: 204
-- Data for Name: permissoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissoes (nome_usuario, permissao) FROM stdin;
jlbavaresco	USUARIO
jlbavaresco	ADMINISTRADOR
teste	ADMINISTRADOR
teste123	USUARIO
\.


--
-- TOC entry 2974 (class 0 OID 19268)
-- Dependencies: 205
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoa (id, cpf, nascimento, nome) FROM stdin;
1	632.140.010-60	2021-02-10	João
2	077.323.070-03	2021-02-10	João
3	908.316.230-39	2021-02-10	Lucas
7	052.452.900-06	2021-04-05	João
8	052.452.900-06	2021-04-14	Sergio
9	052.452.900-06	2021-04-14	Geromel
\.


--
-- TOC entry 2970 (class 0 OID 19219)
-- Dependencies: 201
-- Data for Name: posicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posicao (id, nome) FROM stdin;
1	Goleiro
2	Zagueiro
3	Lateral Direito
4	Lateral Esquerdo
5	Volante
6	Meio Campo
\.


--
-- TOC entry 2976 (class 0 OID 19275)
-- Dependencies: 207
-- Data for Name: time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."time" (id, data_fundacao, historia, nome, cidade, tecnico, usuario) FROM stdin;
2	2000-10-05	<p>Clube teste CURDere tetete</p>	Gaucho	1	2	jlbavaresco
1	1903-09-15	<p>Time fundado em 1903 na cidade de Porto Alegre</p>	Grêmio FBPA	1	1	jlbavaresco
\.


--
-- TOC entry 2969 (class 0 OID 19186)
-- Dependencies: 200
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (nome_usuario, ativo, data_cadastro, email, nome, senha) FROM stdin;
jlbavaresco	t	2021-02-03	jorgebavaresco@ifsul.edu.br	Jorge Luis Boeira Bavaresco	123456
jlbavaresco2	t	2021-02-03	jorgebavarescoifsul.edu.br	Jorge Luis Boeira Bavaresco	123456
teste	t	2021-04-22	teste@gmail.com	teste	1222
teste123	t	2021-04-27	teste@gmail.com	teste123	123456
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 199
-- Name: seq_cidade_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_cidade_id', 3, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 197
-- Name: seq_estado_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_estado_id', 130423, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 206
-- Name: seq_pessoa_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pessoa_id', 9, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 202
-- Name: seq_posicao_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_posicao_id', 6, true);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 208
-- Name: seq_time_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_time_id', 3, true);


--
-- TOC entry 2820 (class 2606 OID 19178)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 19171)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 19304)
-- Name: jogador jogador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT jogador_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 19252)
-- Name: permissao permissao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (nome);


--
-- TOC entry 2828 (class 2606 OID 19257)
-- Name: permissoes permissoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (nome_usuario, permissao);


--
-- TOC entry 2830 (class 2606 OID 19272)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 19223)
-- Name: posicao posicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posicao
    ADD CONSTRAINT posicao_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 19282)
-- Name: time time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 19190)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (nome_usuario);


--
-- TOC entry 2838 (class 2606 OID 19285)
-- Name: time fk4f4p8w6jhvx5lcidu02u4aqr1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT fk4f4p8w6jhvx5lcidu02u4aqr1 FOREIGN KEY (cidade) REFERENCES public.cidade(id);


--
-- TOC entry 2841 (class 2606 OID 19305)
-- Name: jogador fka3p2268d11v0u72yepscons01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT fka3p2268d11v0u72yepscons01 FOREIGN KEY (posicao) REFERENCES public.posicao(id);


--
-- TOC entry 2835 (class 2606 OID 19181)
-- Name: cidade fkedwmmd3jtkssgrwyugrindb7j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT fkedwmmd3jtkssgrwyugrindb7j FOREIGN KEY (estado) REFERENCES public.estado(id);


--
-- TOC entry 2843 (class 2606 OID 19315)
-- Name: jogador fkh1cfee31xu1jv8q3nm0rxc2rg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT fkh1cfee31xu1jv8q3nm0rxc2rg FOREIGN KEY (id) REFERENCES public.pessoa(id);


--
-- TOC entry 2839 (class 2606 OID 19290)
-- Name: time fkh6xgwaldy7ag2gua3skpo02it; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT fkh6xgwaldy7ag2gua3skpo02it FOREIGN KEY (tecnico) REFERENCES public.pessoa(id);


--
-- TOC entry 2840 (class 2606 OID 19295)
-- Name: time fkhdx9wo4ouhh9i5kbxovv9n2nt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT fkhdx9wo4ouhh9i5kbxovv9n2nt FOREIGN KEY (usuario) REFERENCES public.usuario(nome_usuario);


--
-- TOC entry 2837 (class 2606 OID 19263)
-- Name: permissoes fkhu7byq8yjq4b4pegvox97bli1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT fkhu7byq8yjq4b4pegvox97bli1 FOREIGN KEY (nome_usuario) REFERENCES public.usuario(nome_usuario);


--
-- TOC entry 2842 (class 2606 OID 19310)
-- Name: jogador fkju3raetrq5m1rbvxx5csr259n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT fkju3raetrq5m1rbvxx5csr259n FOREIGN KEY ("time") REFERENCES public."time"(id);


--
-- TOC entry 2836 (class 2606 OID 19258)
-- Name: permissoes fksvnmcccxhr3ivf0io79vhafkg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT fksvnmcccxhr3ivf0io79vhafkg FOREIGN KEY (permissao) REFERENCES public.permissao(nome);


-- Completed on 2021-09-21 13:55:07 -03

--
-- PostgreSQL database dump complete
--

