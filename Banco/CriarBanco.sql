create table USUARIO (
ID_USUARIO INT primary KEY not null,
NOME  varchar(255),
EMAIL varchar(255),
SENHA varchar(30)
)

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

alter table produto
add constraint FK_produto_ID_USUARIO
foreign key (ID_USUARIO)
references usuario (ID_USUARIO)


alter table CASA
add constraint FK_CASA_IDCASA
foreign key (ID_CASA)
references CASA (ID_CASA)