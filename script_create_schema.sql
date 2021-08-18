create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(10), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
create sequence custom_sequence start 1 increment 50
create table address (id int4 not null, created_at timestamp, updated_at timestamp, version int4, address_type varchar(255), city varchar(50) not null, complement varchar(60), district varchar(30) not null, state varchar(2) not null, street_address varchar(60) not null, zip_code varchar(8) not null, student_id int4, primary key (id))
create table client (id  serial not null, birthday varchar(255) not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, primary key (id))
create table configuracao (usuario_id int4 not null, encerrar_sessao_automaticamente boolean not null, receber_notificacoes boolean not null, primary key (usuario_id))
create table dominio (id int4 not null, nome varchar(100) not null, primary key (id))
create table email_entity (id int4 not null, created_at timestamp, updated_at timestamp, version int4, email varchar(255), student_id int4, primary key (id))
create table grupo (id int4 not null, nome varchar(100) not null, primary key (id))
create table phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, code_area int4 not null, number varchar(50) not null, operator varchar(50), telephone_types varchar(255), student_id int4, primary key (id))
create table profile (id int4 not null, created_at timestamp, updated_at timestamp, version int4, profile_name varchar(255), primary key (id))
create table student (id int4 not null, created_at timestamp, updated_at timestamp, version int4, cpf varchar(14), date_of_birth date, email varchar(60), gender_type varchar(255), name varchar(50) not null, profession varchar(60), status_type varchar(255), primary key (id))
create table student_address (address_id int4, student_id int4 not null, primary key (student_id))
create table student_phone (phone_id int4, student_id int4 not null, primary key (student_id))
create table tb_payment (id  bigserial not null, moment timestamp, primary key (id))
create table tb_product (id  bigserial not null, description varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id))
create table tb_user (id  bigserial not null, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id))
create table temporal_values (id  bigserial not null, calendar_date date, calendar_timestamp timestamp, instant timestamp, local_date date, local_date_time timestamp, local_time time, offset_date_time timestamp, offset_time time, sql_date date, sql_time time, sql_timestamp timestamp, util_date date, util_time time, util_timestamp timestamp, zoned_date_time timestamp, primary key (id))
create table userconfiguration (created_at timestamp, updated_at timestamp, version int4, end_automatic_session boolean not null, send_notification boolean not null, users_id int4 not null, primary key (users_id))
create table users (id int4 not null, created_at timestamp, updated_at timestamp, version int4, active boolean not null, admin boolean, last_login_date timestamp, name varchar(60) not null, password varchar(60) not null, status int4, username varchar(60) not null, primary key (id))
create table users_phone (id int4 not null, created_at timestamp, updated_at timestamp, version int4, primary key (id))
create table users_profile (profile_id int4, users_id int4 not null, primary key (users_id))
create table usuario (id int4 not null, login varchar(50) not null, nome varchar(100) not null, senha varchar(100), ultimo_acesso timestamp, dominio_id int4 not null, primary key (id))
create table usuario_grupo (usuario_id int4 not null, grupo_id int4 not null)
alter table client add constraint UK_plnstg0h55xcbwkkf8iehxo71 unique (cpf)
alter table client add constraint UK_bfgjs3fem0hmjhvih80158x29 unique (email)
alter table dominio add constraint un_nome unique (nome)
alter table grupo add constraint un_nome unique (nome)
alter table student add constraint UK_2emmcjb5ot34n3fhedf1mktma unique (cpf)
create index id_nome on usuario (nome)
alter table usuario add constraint un_login unique (login)
alter table address add constraint FKg6qcywqtp08ksr5r9lpv16g1k foreign key (student_id) references student
alter table configuracao add constraint fk_configuracao_usuario foreign key (usuario_id) references usuario
alter table email_entity add constraint FKdjnij1xj64twxe7nle3erjn9h foreign key (student_id) references student
alter table phone add constraint FK3wql5uvlg7a9y93qpgccvh9oj foreign key (student_id) references student
alter table student_address add constraint FKri7u57cq6xu0spcc1aii9prvw foreign key (address_id) references address
alter table student_address add constraint FK10mpuj1mmky2gmxxtxt0sbqdr foreign key (student_id) references student
alter table student_phone add constraint FK660eaucw2dd4d21bkusnlrtyl foreign key (phone_id) references phone
alter table student_phone add constraint FKcmaqce3eg166eeer7wk90fmy1 foreign key (student_id) references student
alter table userconfiguration add constraint FKjqk18j3pigibdbeaslwli4jvc foreign key (users_id) references users
alter table users_profile add constraint FKori9a2k03im1lb5c71jb0jjw7 foreign key (profile_id) references profile
alter table users_profile add constraint FKfc2ktn0dd34entljh9t4sirwx foreign key (users_id) references users
alter table usuario add constraint fk_usuario_dominio foreign key (dominio_id) references dominio
alter table usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo
alter table usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario
