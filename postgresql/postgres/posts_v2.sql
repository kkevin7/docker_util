-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2-beta
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: posts | type: DATABASE --
-- -- DROP DATABASE IF EXISTS posts;
-- CREATE DATABASE posts
-- ;
-- -- ddl-end --
-- 

-- object: public.tipo_paso | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_paso CASCADE;
CREATE TABLE public.tipo_paso(
	id_tipo_paso serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_tipo_paso PRIMARY KEY (id_tipo_paso)

);
-- ddl-end --
ALTER TABLE public.tipo_paso OWNER TO mortal2017;
-- ddl-end --

-- object: public.paso | type: TABLE --
-- DROP TABLE IF EXISTS public.paso CASCADE;
CREATE TABLE public.paso(
	id_paso serial NOT NULL,
	id_tipo_paso integer,
	id_categoria integer,
	id_rol integer,
	nombre character varying(150) NOT NULL,
	comentarios text,
	CONSTRAINT pk_paso PRIMARY KEY (id_paso)

);
-- ddl-end --
ALTER TABLE public.paso OWNER TO mortal2017;
-- ddl-end --

-- object: public.post | type: TABLE --
-- DROP TABLE IF EXISTS public.post CASCADE;
CREATE TABLE public.post(
	id_post serial NOT NULL,
	id_tipo_post integer,
	id_categoria integer,
	fecha timestamp NOT NULL,
	aprobacion_comentarios boolean DEFAULT false,
	titulo character varying(150) NOT NULL,
	descripcion text,
	CONSTRAINT pk_post PRIMARY KEY (id_post)

);
-- ddl-end --
ALTER TABLE public.post OWNER TO mortal2017;
-- ddl-end --

-- object: public.categoria | type: TABLE --
-- DROP TABLE IF EXISTS public.categoria CASCADE;
CREATE TABLE public.categoria(
	id_categoria serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)

);
-- ddl-end --
ALTER TABLE public.categoria OWNER TO mortal2017;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario(
	id_usuario serial NOT NULL,
	apellidos character varying(150) NOT NULL,
	nombres character varying(150) NOT NULL,
	fecha_nacimiento date NOT NULL,
	activo boolean DEFAULT true,
	comentarios text,
	username character varying(50) NOT NULL,
	password character varying(50) NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)

);
-- ddl-end --
ALTER TABLE public.usuario OWNER TO mortal2017;
-- ddl-end --

-- object: public.rol | type: TABLE --
-- DROP TABLE IF EXISTS public.rol CASCADE;
CREATE TABLE public.rol(
	id_rol serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_rol PRIMARY KEY (id_rol)

);
-- ddl-end --
ALTER TABLE public.rol OWNER TO mortal2017;
-- ddl-end --

-- object: public.tipo_post | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_post CASCADE;
CREATE TABLE public.tipo_post(
	id_tipo_post serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_tipo_post PRIMARY KEY (id_tipo_post)

);
-- ddl-end --
ALTER TABLE public.tipo_post OWNER TO mortal2017;
-- ddl-end --

-- object: public.seccion | type: TABLE --
-- DROP TABLE IF EXISTS public.seccion CASCADE;
CREATE TABLE public.seccion(
	id_seccion serial NOT NULL,
	id_tipo_seccion integer,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_seccion PRIMARY KEY (id_seccion)

);
-- ddl-end --
ALTER TABLE public.seccion OWNER TO mortal2017;
-- ddl-end --

-- object: public.tipo_seccion | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_seccion CASCADE;
CREATE TABLE public.tipo_seccion(
	id_tipo_seccion serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_tipo_seccion PRIMARY KEY (id_tipo_seccion)

);
-- ddl-end --
ALTER TABLE public.tipo_seccion OWNER TO mortal2017;
-- ddl-end --

-- object: public.cometario | type: TABLE --
-- DROP TABLE IF EXISTS public.cometario CASCADE;
CREATE TABLE public.cometario(
	id_comentario serial NOT NULL,
	id_post integer,
	fecha timestamp NOT NULL,
	id_usuario integer NOT NULL,
	comentario text,
	aprobado boolean DEFAULT false,
	CONSTRAINT pk_comentario PRIMARY KEY (id_comentario)

);
-- ddl-end --
ALTER TABLE public.cometario OWNER TO mortal2017;
-- ddl-end --

-- object: public.meta | type: TABLE --
-- DROP TABLE IF EXISTS public.meta CASCADE;
CREATE TABLE public.meta(
	id_meta serial NOT NULL,
	nombre character varying(150) NOT NULL,
	activo boolean DEFAULT true,
	descripcion text,
	CONSTRAINT pk_meta PRIMARY KEY (id_meta)

);
-- ddl-end --
ALTER TABLE public.meta OWNER TO mortal2017;
-- ddl-end --

-- object: public.post_paso | type: TABLE --
-- DROP TABLE IF EXISTS public.post_paso CASCADE;
CREATE TABLE public.post_paso(
	id_post integer,
	id_paso integer,
	id_usuario integer,
	id_categoria integer,
	id_rol integer,
	aprobado boolean DEFAULT false,
	comentarios text,
	CONSTRAINT post_paso_pk PRIMARY KEY (id_paso,id_post)

);
-- ddl-end --
ALTER TABLE public.post_paso OWNER TO mortal2017;
-- ddl-end --

-- object: public.rol_categoria | type: TABLE --
-- DROP TABLE IF EXISTS public.rol_categoria CASCADE;
CREATE TABLE public.rol_categoria(
	id_rol integer,
	id_categoria integer,
	activo boolean DEFAULT true,
	CONSTRAINT rol_categoria_pk PRIMARY KEY (id_categoria,id_rol)

);
-- ddl-end --
ALTER TABLE public.rol_categoria OWNER TO mortal2017;
-- ddl-end --

-- object: public.usuario_rol_categoria | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario_rol_categoria CASCADE;
CREATE TABLE public.usuario_rol_categoria(
	id_usuario integer,
	id_categoria integer,
	id_rol integer,
	activo boolean DEFAULT true,
	CONSTRAINT usuario_rol_categoria_pk PRIMARY KEY (id_usuario,id_categoria,id_rol)

);
-- ddl-end --
ALTER TABLE public.usuario_rol_categoria OWNER TO mortal2017;
-- ddl-end --

-- object: public.tipo_post_seccion | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_post_seccion CASCADE;
CREATE TABLE public.tipo_post_seccion(
	id_seccion integer,
	id_tipo_post integer,
	activo boolean DEFAULT true,
	obligatorio boolean DEFAULT false,
	peso integer NOT NULL DEFAULT 0,
	CONSTRAINT tipo_post_seccion_pk PRIMARY KEY (id_seccion,id_tipo_post)

);
-- ddl-end --
ALTER TABLE public.tipo_post_seccion OWNER TO mortal2017;
-- ddl-end --

-- object: public.post_seccion | type: TABLE --
-- DROP TABLE IF EXISTS public.post_seccion CASCADE;
CREATE TABLE public.post_seccion(
	id_post integer,
	id_seccion integer NOT NULL,
	valor text NOT NULL,
	CONSTRAINT post_seccion_pk PRIMARY KEY (id_post,id_seccion)

);
-- ddl-end --
ALTER TABLE public.post_seccion OWNER TO mortal2017;
-- ddl-end --

-- object: public.post_meta | type: TABLE --
-- DROP TABLE IF EXISTS public.post_meta CASCADE;
CREATE TABLE public.post_meta(
	id_post integer,
	id_meta integer,
	CONSTRAINT post_meta_pk PRIMARY KEY (id_post,id_meta)

);
-- ddl-end --
ALTER TABLE public.post_meta OWNER TO mortal2017;
-- ddl-end --

-- object: tipo_paso_fk | type: CONSTRAINT --
-- ALTER TABLE public.paso DROP CONSTRAINT IF EXISTS tipo_paso_fk CASCADE;
ALTER TABLE public.paso ADD CONSTRAINT tipo_paso_fk FOREIGN KEY (id_tipo_paso)
REFERENCES public.tipo_paso (id_tipo_paso) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: paso_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_paso DROP CONSTRAINT IF EXISTS paso_fk CASCADE;
ALTER TABLE public.post_paso ADD CONSTRAINT paso_fk FOREIGN KEY (id_paso)
REFERENCES public.paso (id_paso) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: post_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_paso DROP CONSTRAINT IF EXISTS post_fk CASCADE;
ALTER TABLE public.post_paso ADD CONSTRAINT post_fk FOREIGN KEY (id_post)
REFERENCES public.post (id_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tipo_post_fk | type: CONSTRAINT --
-- ALTER TABLE public.post DROP CONSTRAINT IF EXISTS tipo_post_fk CASCADE;
ALTER TABLE public.post ADD CONSTRAINT tipo_post_fk FOREIGN KEY (id_tipo_post)
REFERENCES public.tipo_post (id_tipo_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: seccion_fk | type: CONSTRAINT --
-- ALTER TABLE public.tipo_post_seccion DROP CONSTRAINT IF EXISTS seccion_fk CASCADE;
ALTER TABLE public.tipo_post_seccion ADD CONSTRAINT seccion_fk FOREIGN KEY (id_seccion)
REFERENCES public.seccion (id_seccion) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tipo_post_fk | type: CONSTRAINT --
-- ALTER TABLE public.tipo_post_seccion DROP CONSTRAINT IF EXISTS tipo_post_fk CASCADE;
ALTER TABLE public.tipo_post_seccion ADD CONSTRAINT tipo_post_fk FOREIGN KEY (id_tipo_post)
REFERENCES public.tipo_post (id_tipo_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: post_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_seccion DROP CONSTRAINT IF EXISTS post_fk CASCADE;
ALTER TABLE public.post_seccion ADD CONSTRAINT post_fk FOREIGN KEY (id_post)
REFERENCES public.post (id_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: post_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_meta DROP CONSTRAINT IF EXISTS post_fk CASCADE;
ALTER TABLE public.post_meta ADD CONSTRAINT post_fk FOREIGN KEY (id_post)
REFERENCES public.post (id_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: meta_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_meta DROP CONSTRAINT IF EXISTS meta_fk CASCADE;
ALTER TABLE public.post_meta ADD CONSTRAINT meta_fk FOREIGN KEY (id_meta)
REFERENCES public.meta (id_meta) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: post_fk | type: CONSTRAINT --
-- ALTER TABLE public.cometario DROP CONSTRAINT IF EXISTS post_fk CASCADE;
ALTER TABLE public.cometario ADD CONSTRAINT post_fk FOREIGN KEY (id_post)
REFERENCES public.post (id_post) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.rol_categoria DROP CONSTRAINT IF EXISTS categoria_fk CASCADE;
ALTER TABLE public.rol_categoria ADD CONSTRAINT categoria_fk FOREIGN KEY (id_categoria)
REFERENCES public.categoria (id_categoria) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: rol_fk | type: CONSTRAINT --
-- ALTER TABLE public.rol_categoria DROP CONSTRAINT IF EXISTS rol_fk CASCADE;
ALTER TABLE public.rol_categoria ADD CONSTRAINT rol_fk FOREIGN KEY (id_rol)
REFERENCES public.rol (id_rol) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.usuario_rol_categoria DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.usuario_rol_categoria ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: rol_categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.usuario_rol_categoria DROP CONSTRAINT IF EXISTS rol_categoria_fk CASCADE;
ALTER TABLE public.usuario_rol_categoria ADD CONSTRAINT rol_categoria_fk FOREIGN KEY (id_categoria,id_rol)
REFERENCES public.rol_categoria (id_categoria,id_rol) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.post DROP CONSTRAINT IF EXISTS categoria_fk CASCADE;
ALTER TABLE public.post ADD CONSTRAINT categoria_fk FOREIGN KEY (id_categoria)
REFERENCES public.categoria (id_categoria) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: rol_categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.paso DROP CONSTRAINT IF EXISTS rol_categoria_fk CASCADE;
ALTER TABLE public.paso ADD CONSTRAINT rol_categoria_fk FOREIGN KEY (id_categoria,id_rol)
REFERENCES public.rol_categoria (id_categoria,id_rol) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tipo_seccion_fk | type: CONSTRAINT --
-- ALTER TABLE public.seccion DROP CONSTRAINT IF EXISTS tipo_seccion_fk CASCADE;
ALTER TABLE public.seccion ADD CONSTRAINT tipo_seccion_fk FOREIGN KEY (id_tipo_seccion)
REFERENCES public.tipo_seccion (id_tipo_seccion) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- RELATION MODIFIED
-- object: seccion_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_seccion DROP CONSTRAINT IF EXISTS seccion_fk CASCADE;
-- ALTER TABLE public.post_seccion ADD CONSTRAINT seccion_fk FOREIGN KEY (id_seccion)
-- REFERENCES public.seccion (id_seccion) MATCH FULL
-- ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- RELATION MODIFIED
-- object: usuario_rol_categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.post_paso DROP CONSTRAINT IF EXISTS usuario_rol_categoria_fk CASCADE;
-- ALTER TABLE public.post_paso ADD CONSTRAINT usuario_rol_categoria_fk FOREIGN KEY (id_usuario,id_categoria,id_rol)
-- REFERENCES public.usuario_rol_categoria (id_usuario,id_categoria,id_rol) MATCH FULL
-- ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


