create database heroku_17d9f263de3e5e0;

use heroku_17d9f263de3e5e0;

create table Juego (
Id int unsigned auto_increment primary key,
Nombre varchar(100) unique,
Descripcion varchar(500) not null,
Imagen mediumblob,
Genero varchar(100));

create table Grupo (
Id int unsigned auto_increment primary key,
Id_Juego int unsigned,
Modo_de_Juego enum('Coop', 'PvP', 'PvE'),
Dimension int unsigned default 2,
Descripcion varchar(500),
Juego_nuevo varchar(100),
foreign key (Id_Juego) references Juego(Id) ON DELETE CASCADE ON UPDATE CASCADE);

create table Usuario (
Nombre_Usuario varchar(20) primary key,
Nombe varchar(20),
Apellidos varchar(50),
Email varchar(100) unique not null,
Palabra_clave varchar(100) not null,
Foto_perfil mediumblob,
Usuario_Steam varchar(20));

create table Chat (
Id int unsigned auto_increment primary key,
Id_Grupo int unsigned,
foreign key (Id_Grupo) references Grupo(Id) ON DELETE CASCADE ON UPDATE CASCADE);

create table Mensaje (
Id int unsigned auto_increment primary key,
Id_Chat int unsigned,
Usuario varchar(20),
Contenido varchar(500),
Hora time,
foreign key (Id_Chat) references Chat(Id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

create table Se_Une (
Id_Grupo int unsigned,
Nombre_Usuario varchar(20),
primary key(Id_Grupo, Nombre_Usuario),
foreign key(Id_Grupo) references Grupo(Id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Nombre_Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);