create table USUARIO (
ID_USUARIO INT primary KEY not null,
NOME  varchar(255),
EMAIL varchar(255),
SENHA varchar(30)
)

create sequence GEN_ID_USUARIO;

set term ^^;
    create trigger TRG_ID_USUARIO FOR usuario
    active before insert position 0
as
begin
    if (NEW.ID_USUARIO is NULL) then
       NEW.ID_USUARIO = next value for gen_id_usuario;
end ^^
set term;^^


create table CASA (
ID_CASA INT primary KEY not null,
DESCRICAO varchar(255),
ID_USUARIO INT not null,
shoRt_id char(4)
)

ALTER TABLE CASA
ADD CONSTRAINT FK_CASA_ID_USUARIO
FOREIGN KEY (ID_USUARIO)
REFERENCES USUARIO(ID_USUARIO)

create table USUARIOS_CASA (
ID INT primary key not null,
ID_CASA INT not null,
ID_USUARIO INT not null
)

ALTER TABLE USUARIOS_CASA
ADD CONSTRAINT FK_USUARIOS_CASA_ID_USUARIO
FOREIGN KEY (ID_USUARIO)
REFERENCES USUARIO(ID_USUARIO)


ALTER TABLE USUARIOS_CASA
ADD CONSTRAINT FK_USUARIOS_CASA_ID_CASA
FOREIGN KEY (ID_CASA)
REFERENCES CASA(ID_CASA)


create table PRODUTO (
ID_PRODUTO INT primary key not null,
DESCRICAO varchar (255) not null,
QTDE numeric (15,3) not null,
VALOR_ULT_COMPRA numeric (15,2) not null,
VALOR_ATUAL numeric (15,2) not null,
UND CHAR (3) not null,
VALIDADE date,
ESTOQUE_MIN numeric (15,3),
ID_USUARIO INT not null,
ID_CASA INT not null
)

create sequence GEN_ID_PRODUTO;

set term ^^;
    create trigger TRG_ID_PRODUTO FOR produto
    active before insert position 0
as
begin
    if (NEW.ID_PRODUTO is NULL) then
       NEW.ID_PRODUTO = next value for gen_ID_PRODUTO;
end ^^
set term;^^


alter table produto
add constraint FK_produto_ID_USUARIO
foreign key (ID_USUARIO)
references usuario (ID_USUARIO)


alter table produto
add constraint FK_PRODUTO_IDCASA
foreign key (ID_CASA)
references CASA (ID_CASA)

alter table usuario
