CREATE DATABASE heroku_17d9f263de3e5e0;

USE heroku_17d9f263de3e5e0;

create table Juego (
Id_juego int unsigned auto_increment primary key,
Nombre varchar(100) unique,
Descripcion varchar(500) not null,
Imagen varchar(255),
Genero varchar(100));

insert into Juego (Nombre, Descripcion, Imagen, Genero) values ('League of Legends', '2 equipos de 5 jugadores pelean por destruir el Nexo enemigo', 'https://www.leagueoflegends.com/static/placeholder-1c66220c6149b49352c4cf496f70ad86.jpg', 'MOBA');
insert into Juego (Nombre, Descripcion, Imagen, Genero) values ('Elden Ring', 'Juego RPG de fantasía oscura', 'https://i.redd.it/3e2afpjsi4f61.png', 'ARPG');
insert into Juego (Nombre, Descripcion, Imagen, Genero) values ('Valorant', 'Shooter competitivo', 'https://images.cults3d.com/4QqRV9kLYYEuw9ur_X3yjQl1sjk=/516x516/https://files.cults3d.com/uploaders/15024335/illustration-file/a86d53e4-2bd9-4a8f-9550-986686c3131a/gi0mAjIh_400x400.png', 'FPS');
insert into Juego (Nombre, Descripcion, Imagen, Genero) values ('Mario Kart', 'Juego de conducción', 'https://upload.wikimedia.org/wikipedia/commons/3/30/Mario_kart_first_logo.png', 'CONDUCCIÓN');
insert into Juego (Nombre, Descripcion, Imagen, Genero) values ('Age of Empires IV', 'Juego de estrategia medieval', 'https://i.blogs.es/50a9b3/age-of-empires-iv/1366_2000.jpg', 'ESTRATEGIA');

create table Grupo (
Id_grupo int unsigned auto_increment primary key,
Id_juego int unsigned,
Modo_de_Juego enum('Coop', 'PvP', 'PvE'),
Dimension int unsigned default 2,
Descripcion varchar(500),
Juego_nuevo varchar(100),
foreign key (Id_juego) references Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE);

insert into Grupo (Id_juego, Modo_de_Juego, Dimension, Descripción) values (1, 'Coop', 2, 'Busco jugadores para jugar a LOL');
insert into Grupo (Id_juego, Modo_de_Juego, Dimension, Descripción) values (2, 'Coop', 2, 'Busco jugadores para jugar a Elden Ring');
insert into Grupo (Id_juego, Modo_de_Juego, Dimension, Descripción) values (3, 'Coop', 2, 'Busco jugadores para jugar a Valorant');
insert into Grupo (Id_juego, Modo_de_Juego, Dimension, Descripción) values (4, 'PvP', 2, 'Busco jugadores para jugar a Mario Kart');
insert into Grupo (Id_juego, Modo_de_Juego, Dimension, Descripción) values (5, 'Coop', 2, 'Busco jugadores para jugar a Age of Empires IV');

create table Usuario (
Nombre_Usuario varchar(20) NOT NULL,
Nombre varchar(20) DEFAULT NULL,
Apellidos varchar(50) DEFAULT NULL,
Email varchar(100) DEFAULT NULL,
Palabra_clave varchar(100) DEFAULT NULL,
Usuario_steam varchar(20) DEFAULT NULL,
Foto_perfil varchar(255),
Rol varchar(50),
Id_grupo int unsigned,
PRIMARY KEY(Nombre_Usuario),
foreign key (Id_grupo) references Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

insert into Usuario values ('albert', 'Albert', 'Notario Mestres', 'albertnotariomestres@gmail.com', '12345', 'Nones', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', 'user', 1);

create table Chat (
Id_chat int unsigned auto_increment primary key,
Id_grupo int unsigned,
foreign key (Id_grupo) references Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

insert into Chat (Id_grupo) values (1);

create table Mensaje (
Id_mensaje int unsigned auto_increment primary key,
Id_chat int unsigned,
Nombre_Usuario varchar(20),
Contenido varchar(500),
Hora datetime,
foreign key (Id_chat) references Chat(Id_chat) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (Nombre_Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

insert into Mensaje (Id_Chat, Usuario, Contenido, Hora) values (1, 'albert', 'hola que tal', '23-01-1998 12:45:56');

create table Se_Une (
Id_seune int unsigned auto_increment,
Id_grupo int unsigned,
Nombre_Usuario varchar(20),
primary key(Id_seune, Id_grupo, Nombre_Usuario),
foreign key(Id_grupo) references Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Nombre_Usuario) references Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

insert into Se_Une (Id_grupo, Nombre_Usuario) values (1, 'albert');