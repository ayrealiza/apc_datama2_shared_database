
-- Drop table

-- DROP TABLE "MI182_ayrealiza".account;

CREATE TABLE "MI182_ayrealiza".account (
	id int4 NOT NULL,
	acc_name varchar(50) NULL,
	acc_desc varchar(50) NULL,
	cli_id int4 NULL,
	balance numeric(5,2) NULL,
	CONSTRAINT account_pkey PRIMARY KEY (id)
);

ALTER TABLE "MI182_ayrealiza".account ADD CONSTRAINT cli_id_key FOREIGN KEY (cli_id) REFERENCES client(id);



-- Drop table

-- DROP TABLE "MI182_ayrealiza".client;

CREATE TABLE "MI182_ayrealiza".client (
	id int4 NOT NULL,
	cli_name varchar(50) NULL,
	cli_addr varchar(50) NULL,
	cli_desc varchar(50) NULL,
	CONSTRAINT client_pkey PRIMARY KEY (id)
);

ALTER TABLE "MI182_ayrealiza".client ADD id int4 NOT NULL;

ALTER TABLE "MI182_ayrealiza".client ADD cli_name varchar(50) NULL;

ALTER TABLE "MI182_ayrealiza".client ADD cli_addr varchar(50) NULL;

ALTER TABLE "MI182_ayrealiza".client ADD cli_desc varchar(50) NULL;

ALTER TABLE "MI182_ayrealiza".client ADD CONSTRAINT client_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX client_pkey ON "MI182_ayrealiza".client USING btree (id);




ALTER TABLE "MI182_ayrealiza".account ADD id int4 NOT NULL;

ALTER TABLE "MI182_ayrealiza".account ADD acc_name varchar(50) NULL;

ALTER TABLE "MI182_ayrealiza".account ADD acc_desc varchar(50) NULL;

ALTER TABLE "MI182_ayrealiza".account ADD cli_id int4 NULL;

ALTER TABLE "MI182_ayrealiza".account ADD balance numeric(5,2) NULL;

ALTER TABLE "MI182_ayrealiza".account ADD CONSTRAINT account_pkey PRIMARY KEY (id);

ALTER TABLE "MI182_ayrealiza".account ADD CONSTRAINT cli_id_key FOREIGN KEY (cli_id) REFERENCES client(id);

CREATE UNIQUE INDEX account_pkey ON "MI182_ayrealiza".account USING btree (id);


CREATE OR REPLACE PROCEDURE "MI182_ayrealiza".transfer(integer, integer, numeric)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  
    UPDATE "MI182_ayrealiza".account
    SET balance = balance - $3
    WHERE id = $1;
 
    UPDATE "MI182_ayrealiza".account 
    SET balance = balance + $3
    WHERE id = $2;
 
    COMMIT;
END;
$procedure$
;
