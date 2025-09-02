-- PostgreSQL Tables

-- CREATE SCHEMA if not exists dev_305 AUTHORIZATION dev_305;

-- Table for entity metadata
select * from entity_meta;

drop TABLE entity_meta cascade ;

CREATE TABLE dev_305.entity_meta (
                                     id serial4 NOT NULL,
                                     entity_name varchar(255) NOT NULL unique ,
                                     table_name varchar(255) NULL,
                                     fields_json jsonb NULL,
                                     i18n_key varchar NULL,
                                     project_root varchar NULL,
                                     app_name varchar NULL,
                                     description varchar NULL,
                                     CONSTRAINT entity_meta_pkey PRIMARY KEY (id)
);

-- Table for fields metadata

drop TABLE field_meta;
CREATE TABLE field_meta (
                            id BIGSERIAL PRIMARY KEY,
                             entity_id INT NOT NULL REFERENCES entity_meta(id) ON DELETE CASCADE,
                            entity_name varchar(255) NOT NULL REFERENCES entity_meta(entity_name) ON DELETE CASCADE,
                            column_name varchar(255) NULL,
                            fields_json jsonb NULL,
                            field_name VARCHAR(255) NOT NULL,
                            field_type VARCHAR(255),
                            i18n_key VARCHAR(255),
                            app_name varchar(255) null
                            required BOOLEAN DEFAULT FALSE,
                            is_array BOOLEAN DEFAULT FALSE,
                            description varchar NULL,
                            UNIQUE (entity_name, field_name)

);

select * from field_meta;

drop TABLE relation_meta;

CREATE TABLE relation_meta (
                               id BIGSERIAL PRIMARY KEY,
                               entity_id BIGINT REFERENCES entity_meta(id) ON DELETE CASCADE,
--                                entity_name VARCHAR(255) entity_meta(entity_name) ON DELETE CASCADE,
                               type VARCHAR(50),
                               target_entity VARCHAR(255)


);

-- generate tables for all entities can deprecat this
CREATE TABLE code_common (
                                     id int8 NOT NULL,
                                     code varchar(255) NULL,
                                     "key" varchar(255) NULL,
                                     value varchar(255) NULL,
                                     description varchar(255) NULL,
                                     created_by varchar(50) NOT NULL,
                                     created_date timestamp NOT NULL,
                                     last_modified_by varchar(50) NOT NULL,
                                     last_modified_date timestamp NOT NULL,
                                     CONSTRAINT code_common_pkey PRIMARY KEY (id)
);

create table i18n(
    lang_cd varchar(3),
    i18n_key VARCHAR(255),
    i18n_value VARCHAR(255),
    constraint unique_i18n unique (lang_cd,i18n_key)

);


delete from entity_meta
where app_name IS NULL;

delete from field_meta
where entity_id IS NULL;

SELECT currval('entity_meta_id_seq');

SELECT currval('entity_meta_id_seq');

select nextval('entity_meta_id_seq'::regclass);