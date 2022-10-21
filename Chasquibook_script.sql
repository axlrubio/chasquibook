use chasquibook;

-- -Tabla categorias
create table categorias(
	id			integer			primary key		auto_increment,
    nombre		varchar(200),
    activo		tinyint(1)
);

-- - Tabla autore
create table autores(
	id			integer			primary key		auto_increment,
    nombre		varchar(200),
    activo		tinyint(1)
);

-- - Tabla editoriales
create table editoriales(
	id			integer			primary key		auto_increment,
    nombre		varchar(200),
    activo		tinyint(1)
);

-- - Tabla libros
create table libros(
	id					integer			primary key		auto_increment,
    titulo				varchar(200),
    fecha_lanzamiento	datetime,
    autores_id			integer,
    categorias_id		integer,
    editorial_id		integer,
    idioma				varchar(10),
    paginas				integer,
    descripcion			text,
    imagen				text,
    precio				decimal(9, 2),
    estreno				tinyint(1),
    vista_previa		int,
    activo				tinyint(1),
    constraint	fk_autores			foreign key(autores_id) 	references autores(id),
    constraint	fk_categorias		foreign key(categorias_id) 	references categorias(id),
    constraint	fk_editorial		foreign key(editorial_id) 	references editoriales(id)
);

-- - Tabla lectores
create table lectores(
	id				integer			primary key		auto_increment,
    dni				varchar(8)		not null,
    nombre			varchar(200)	not null,
    telefono		varchar(15),
    direccion		varchar(200),
    codigo_postal	varchar(20),
    observaciones	text,
    activo 			tinyint(1)
);

-- - Tabla alquileres
create table alquileres(
	id				integer			primary key		auto_increment,
    lector_id		integer,
    libro_id		integer,
    fecha_salida	datetime,
    fecha_entrada	datetime,
    activo 			tinyint(1),
    constraint	fk_lectores		foreign key(lector_id) references lectores(id),
    constraint	fk_libros		foreign key(libro_id) references libros(id)
);

-- - Tabla ventas
create table ventas(
	id				integer			primary key		auto_increment,
    lector_id		integer,
    libro_id		integer,
    cantidad		integer,
    precio_total	decimal(15, 2),
    fecha_compra	datetime,
    activo 			tinyint(1),
    constraint	fk_lector_comprador	foreign key(lector_id) references lectores(id),
    constraint	fk_libros_comprado	foreign key(libro_id) references libros(id)
);

-- - Tabla recomendaciones
create table recomendaciones(
	id				integer			primary key		auto_increment,
    lector_id		integer,
    categoria_id	integer,
    activo 			tinyint(1),
    constraint	fk_lector_recomendar		foreign key(lector_id) references lectores(id),
    constraint	fk_categoria_recomendar		foreign key(categoria_id) references categorias(id)
);