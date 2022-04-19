--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pizzas; Type: TABLE; Schema: public; Owner: ludovico
--

CREATE TABLE public.pizzas (
    id integer NOT NULL,
    stock integer,
    costo numeric,
    nombre character varying(30),
    CONSTRAINT pizzas_stock_check CHECK (((stock)::numeric >= 0.00))
);


ALTER TABLE public.pizzas OWNER TO ludovico;

--
-- Name: ventas; Type: TABLE; Schema: public; Owner: ludovico
--

CREATE TABLE public.ventas (
    cliente character varying(20),
    fecha date,
    monto numeric,
    pizza integer
);


ALTER TABLE public.ventas OWNER TO ludovico;

--
-- Data for Name: pizzas; Type: TABLE DATA; Schema: public; Owner: ludovico
--

COPY public.pizzas (id, stock, costo, nombre) FROM stdin;
1	0	12000	Uhlalá
2	2	15000	jamón a todo dar
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: ludovico
--

COPY public.ventas (cliente, fecha, monto, pizza) FROM stdin;
\.


--
-- Name: pizzas pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: ludovico
--

ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);


--
-- Name: ventas ventas_pizza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ludovico
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pizza_fkey FOREIGN KEY (pizza) REFERENCES public.pizzas(id);


--
-- PostgreSQL database dump complete
--

