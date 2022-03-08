CREATE DATABASE heroku_17d9f263de3e5e0;

USE heroku_17d9f263de3e5e0;

SET auto_increment_increment = 1;

CREATE TABLE Juego (
Id_juego int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre varchar(100) DEFAULT NULL,
Descripcion varchar(500) DEFAULT NULL,
Imagen varchar(255) DEFAULT NULL,
Genero varchar(100) DEFAULT NULL
);

CREATE TABLE Grupo (
Id_grupo int AUTO_INCREMENT PRIMARY KEY,
Id_juego int NOT NULL,
Modo_de_Juego enum('Coop', 'PvP', 'PvE') DEFAULT NULL,
Dimension int DEFAULT 2,
Descripcion varchar(500) DEFAULT NULL,
Juego_nuevo varchar(100) DEFAULT NULL,
FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Usuario (
Nombre_Usuario varchar(20) NOT NULL PRIMARY KEY,
Nombre varchar(20) DEFAULT NULL,
Apellidos varchar(50) DEFAULT NULL,
Email varchar(100) DEFAULT NULL,
Palabra_clave varchar(100) DEFAULT NULL,
Usuario_steam varchar(20) DEFAULT NULL,
Foto_perfil varchar(255) DEFAULT NULL,
Fecha_creación datetime NOT NULL,
Fecha_modificacion datetime NOT NULL,
Rol varchar(50) DEFAULT NULL,
Id_grupo int NOT NULL,
FOREIGN KEY (Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Chat (
Id_chat int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_grupo int NOT NULL,
foreign key (Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Mensaje (
Id_mensaje int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_chat int NOT NULL,
Nombre_Usuario varchar(20) DEFAULT NULL,
Contenido varchar(500) DEFAULT NULL,
Hora datetime DEFAULT NULL,
FOREIGN KEY (Id_chat) REFERENCES Chat(Id_chat) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Nombre_Usuario) REFERENCES Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Se_Une (
Id_seune int NOT NULL AUTO_INCREMENT,
Id_grupo int NOT NULL,
Nombre_Usuario varchar(20) NOT NULL,
PRIMARY KEY(Id_seune, Id_grupo, Nombre_Usuario),
FOREIGN KEY(Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(Nombre_Usuario) REFERENCES Usuario(Nombre_Usuario) ON DELETE CASCADE ON UPDATE CASCADE);

/*INSERCIONES*/
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('League of Legends', '2 equipos de 5 jugadores pelean por destruir el Nexo enemigo', 'https://www.leagueoflegends.com/static/placeholder-1c66220c6149b49352c4cf496f70ad86.jpg', 'MOBA');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Elden Ring', 'Juego RPG de fantasía oscura', 'https://i.redd.it/3e2afpjsi4f61.png', 'ARPG');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Valorant', 'Shooter competitivo', 'https://images.cults3d.com/4QqRV9kLYYEuw9ur_X3yjQl1sjk=/516x516/https://files.cults3d.com/uploaders/15024335/illustration-file/a86d53e4-2bd9-4a8f-9550-986686c3131a/gi0mAjIh_400x400.png', 'FPS');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Mario Kart', 'Juego de conducción', 'https://upload.wikimedia.org/wikipedia/commons/3/30/Mario_kart_first_logo.png', 'CONDUCCIÓN');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Age of Empires IV', 'Juego de estrategia medieval', 'https://i.blogs.es/50a9b3/age-of-empires-iv/1366_2000.jpg', 'ESTRATEGIA');

INSERT INTO Grupo (Id_juego, Modo_de_Juego, Dimension, Descripcion) VALUES (1, 'Coop', 2, 'Busco jugadores para jugar a LOL');
INSERT INTO Grupo (Id_juego, Modo_de_Juego, Dimension, Descripcion) VALUES(2, 'Coop', 2, 'Busco jugadores para jugar a Elden Ring');
INSERT INTO Grupo (Id_juego, Modo_de_Juego, Dimension, Descripcion) VALUES (3, 'Coop', 2, 'Busco jugadores para jugar a Valorant');
INSERT INTO Grupo (Id_juego, Modo_de_Juego, Dimension, Descripcion) VALUES (4, 'PvP', 2, 'Busco jugadores para jugar a Mario Kart');
INSERT INTO Grupo (Id_juego, Modo_de_Juego, Dimension, Descripcion) VALUES (5, 'Coop', 2, 'Busco jugadores para jugar a Age of Empires IV');

INSERT INTO Usuario VALUES ('albert', 'Albert', 'Notario Mestres', 'albertnotariomestres@gmail.com', '12345', 'Nones', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', current_timestamp(), 'user', 1);
INSERT INTO Usuario VALUES ('abel', 'Abel', 'Jornet Molero', 'abel_jornet@gmail.com', '56789', 'JoMo', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'user', 1);
INSERT INTO Usuario VALUES ('raul', 'Raul', 'Garrido Rasillo', 'rgarrido@gmail.com', '13468', 'GaRa', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'user', 2);
INSERT INTO Usuario VALUES ('edgar', 'Edgar', 'Falcó Mestres', 'e.falco@gmail.com', '25836', 'FaMe', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'user', 2);
INSERT INTO Usuario VALUES ('jordi', 'Jordi', 'Pámies Navarro', 'jpamiesnavarro@gmail.com', '14785', 'PaNa', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'user', 3);
INSERT INTO Usuario VALUES ('beatriz', 'Beatriz', 'Hervás Ruiz', 'bhervasruiz@gmail.com', '25356', 'HeRu', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'user', 3);

INSERT INTO Chat (Id_grupo) VALUES (1);
INSERT INTO Chat (Id_grupo) VALUES (2);
INSERT INTO Chat (Id_grupo) VALUES (3);
INSERT INTO Chat (Id_grupo) VALUES (4);
INSERT INTO Chat (Id_grupo) VALUES (5);

INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (1, 'albert', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (1, 'abel', 'bien y tu', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (2, 'raul', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (2, 'edgar', 'bien y tu', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (3, 'jordi', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_Usuario, Contenido, Hora) VALUES (3, 'beatriz', 'bien y tu', '1998-01-23 12:45:56');

INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (1, 'albert');
INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (1, 'abel');
INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (2, 'raul');
INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (2, 'edgar');
INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (3, 'jordi');
INSERT INTO Se_Une (Id_grupo, Nombre_Usuario) values (3, 'beatriz');

/*SELECTS*/
SELECT * FROM Juego;
SELECT * FROM Grupo;
SELECT * FROM Usuario;
SELECT * FROM Chat;
SELECT * FROM Mensaje;
SELECT * FROM Se_Une;