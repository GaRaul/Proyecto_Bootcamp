DROP table IF EXISTS Juego;
DROP table IF EXISTS Grupo;
DROP table IF EXISTS Usuario;
DROP table IF EXISTS Chat;
DROP table IF EXISTS Mensaje;
DROP table IF EXISTS Se_Une;

create table Juego (
Id_juego int unsigned auto_increment primary key,
Nombre varchar(100) unique,
Descripcion varchar(500) not null,
Imagen mediumblob,
Genero varchar(100));

create table Grupo (
Id_grupo int unsigned auto_increment primary key,
Id_juego int unsigned,
Modo_de_Juego enum('Coop', 'PvP', 'PvE'),
Dimension int unsigned default 2,
Descripcion varchar(500),
Juego_nuevo varchar(100),
foreign key (Id_juego) references Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE);

create table Usuario (
Nombre_Usuario varchar(20) primary key,
Nombe varchar(20),
Apellidos varchar(50),
Email varchar(100) unique not null,
Palabra_clave varchar(100) not null,
Foto_perfil mediumblob,
Usuario_Steam varchar(20));

create table Chat (
Id_chat int unsigned auto_increment primary key,
Id_grupo int unsigned,
foreign key (Id_grupo) references Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

create table Mensaje (
Id_mensaje int unsigned auto_increment primary key,
Id_chat int unsigned,
Usuario varchar(20),
Contenido varchar(500),
Hora time,
foreign key (Id_chat) references Chat(Id_chat) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

create table Se_Une (
Id_grupo int unsigned,
Nombre_Usuario varchar(20),
primary key(Id_grupo, Nombre_Usuario),
foreign key(Id_grupo) references Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Nombre_Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);