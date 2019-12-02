-- DROP SCHEMA ayrealiza;

CREATE SCHEMA ayrealiza AUTHORIZATION datama2mi182;


-- Drop table

-- DROP TABLE ayrealiza.client;

CREATE TABLE ayrealiza.client (
	id serial NOT NULL,
	cli_name varchar(50) NULL,
	cli_addr varchar(50) NULL,
	cli_desc varchar(50) NULL,
	CONSTRAINT client_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE ayrealiza.account;

CREATE TABLE ayrealiza.account (
	id serial NOT NULL,
	acc_name varchar(50) NULL,
	acc_desc varchar(50) NULL,
	cli_id int4 NULL,
	CONSTRAINT account_pkey PRIMARY KEY (id),
	CONSTRAINT account_cli_id_fkey FOREIGN KEY (cli_id) REFERENCES ayrealiza.client(id)
);

CREATE UNIQUE INDEX account_pkey ON ayrealiza.account USING btree (id);

CREATE UNIQUE INDEX client_pkey ON ayrealiza.client USING btree (id);

-- DROP SEQUENCE ayrealiza.account_id_seq;

CREATE SEQUENCE ayrealiza.account_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ayrealiza.client_id_seq;

CREATE SEQUENCE ayrealiza.client_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	CACHE 1
	NO CYCLE;