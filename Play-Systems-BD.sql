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
Nombre_grupo varchar(20) DEFAULT NULL,
Id_juego int DEFAULT NULL,
Descripcion varchar(500) DEFAULT NULL,
FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Usuario (
Username varchar(20) NOT NULL PRIMARY KEY,
Nombre varchar(20) DEFAULT NULL,
Apellidos varchar(50) DEFAULT NULL,
Email varchar(100) DEFAULT NULL,
Password varchar(100) DEFAULT NULL,
Usuario_steam varchar(20) DEFAULT NULL,
Foto_perfil varchar(255) DEFAULT NULL,
Fecha_creacion datetime DEFAULT NULL,
Fecha_modificacion datetime DEFAULT NULL,
Role enum('ROLE_ADMIN', 'ROLE_USER') DEFAULT NULL,
Id_grupo int DEFAULT NULL,
FOREIGN KEY (Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Chat (
Id_chat int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_grupo int NOT NULL,
foreign key (Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Mensaje (
Id_mensaje int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_chat int NOT NULL,
Nombre_usuario varchar(20) DEFAULT NULL,
Contenido varchar(500) DEFAULT NULL,
Hora datetime DEFAULT NULL,
FOREIGN KEY (Id_chat) REFERENCES Chat(Id_chat) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Nombre_usuario) REFERENCES Usuario(Username) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Se_Une (
Id_seune int NOT NULL AUTO_INCREMENT,
Id_grupo int NOT NULL,
Nombre_usuario varchar(20) NOT NULL,
PRIMARY KEY(Id_seune, Id_grupo, Nombre_usuario),
FOREIGN KEY(Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(Nombre_usuario) REFERENCES Usuario(Username) ON DELETE CASCADE ON UPDATE CASCADE);

/*INSERCIONES*/
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('League of Legends', '2 equipos de 5 jugadores pelean por destruir el Nexo enemigo', 'https://phantom-marca.unidadeditorial.es/abfd01e815b28d5553ed7ba9fa2e9647/crop/0x0/1980x1112/resize/1320/f/jpg/assets/multimedia/imagenes/2022/03/16/16474267987028.jpg', 'MOBA');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Elden Ring', 'Juego RPG de fantasía oscura', 'https://images.gnwcdn.com/2022/articles/2022-03-11-17-06/elden-ring-walkthrough-8042-1647018411119.jpg/EG11/resize/1200x-1/elden-ring-walkthrough-8042-1647018411119.jpg', 'ARPG');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Valorant', 'Shooter competitivo', 'https://media.vandal.net/i/1200x630/4-2020/20204271333472_2.jpg', 'FPS');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Mario Kart', 'Juego de conducción', 'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_MarioKart8Deluxe_image1600w.jpg', 'CONDUCCIÓN');
INSERT INTO Juego (Nombre, Descripcion, Imagen, Genero) VALUES ('Age of Empires IV', 'Juego de estrategia medieval', 'https://i.blogs.es/50a9b3/age-of-empires-iv/1366_2000.jpg', 'ESTRATEGIA');

INSERT INTO Grupo (Id_juego, Nombre_grupo, Descripcion) VALUES (1, 'Grupo1', 'Busco jugadores para jugar a LOL');
INSERT INTO Grupo (Id_juego, Nombre_grupo, Descripcion) VALUES(2, 'Grupo2', 'Busco jugadores para jugar a Elden Ring');
INSERT INTO Grupo (Id_juego, Nombre_grupo, Descripcion) VALUES (3, 'Grupo3', 'Busco jugadores para jugar a Valorant');
INSERT INTO Grupo (Id_juego, Nombre_grupo, Descripcion) VALUES (4, 'Grupo4', 'Busco jugadores para jugar a Mario Kart');
INSERT INTO Grupo (Id_juego, Nombre_grupo, Descripcion) VALUES (5, 'Grupo5', 'Busco jugadores para jugar a Age of Empires IV');

INSERT INTO Usuario VALUES ('albert', 'Albert', 'Notario Mestres', 'albertnotariomestres@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'Nones', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_USER', 1);
INSERT INTO Usuario VALUES ('abel', 'Abel', 'Jornet Molero', 'abel_jornet@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'JoMo', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_ADMIN', 1);
INSERT INTO Usuario VALUES ('raul', 'Raul', 'Garrido Rasillo', 'rgarrido@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'GaRa', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_USER', 2);
INSERT INTO Usuario VALUES ('edgar', 'Edgar', 'Falcó Mestres', 'e.falco@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'FaMe', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_USER', 2);
INSERT INTO Usuario VALUES ('jordi', 'Jordi', 'Pámies Navarro', 'jpamiesnavarro@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'PaNa', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_USER', 3);
INSERT INTO Usuario VALUES ('beatriz', 'Beatriz', 'Hervás Ruiz', 'bhervasruiz@gmail.com', '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 'HeRu', 'https://logos-marcas.com/wp-content/uploads/2020/12/Danone-Logotipo-2017-presente.jpg', '1998-01-23 12:45:56', '1998-01-23 12:45:56', 'ROLE_USER', 3);

INSERT INTO Chat (Id_grupo) VALUES (1);
INSERT INTO Chat (Id_grupo) VALUES (2);
INSERT INTO Chat (Id_grupo) VALUES (3);
INSERT INTO Chat (Id_grupo) VALUES (4);
INSERT INTO Chat (Id_grupo) VALUES (5);

INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (1, 'albert', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (1, 'abel', 'bien y tu', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (2, 'raul', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (2, 'edgar', 'bien y tu', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (3, 'jordi', 'hola que tal', '1998-01-23 12:45:56');
INSERT INTO Mensaje (Id_Chat, Nombre_usuario, Contenido, Hora) VALUES (3, 'beatriz', 'bien y tu', '1998-01-23 12:45:56');

INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (1, 'albert');
INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (1, 'abel');
INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (2, 'raul');
INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (2, 'edgar');
INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (3, 'jordi');
INSERT INTO Se_Une (Id_grupo, Nombre_usuario) values (3, 'beatriz');

/*SELECTS*/
SELECT * FROM Juego;
SELECT * FROM Grupo;
SELECT * FROM Usuario;
SELECT * FROM Chat;
SELECT * FROM Mensaje;
SELECT * FROM Se_Une;