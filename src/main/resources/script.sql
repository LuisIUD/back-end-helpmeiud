--DROP DATABASE helpme_iud;

CREATE DATABASE IF NOT EXISTS helpme_iud;

USE helpme_iud;

CREATE TABLE IF NOT EXISTS roles(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR (45) NOT NULL,
	PRIMARY KEY (id)
	);
	
CREATE TABLE IF NOT EXISTS usuarios(
	id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(120) NOT NULL,
	nombre VARCHAR (120) NOT NULL,
	apellido VARCHAR(120) NULL,
	password VARCHAR(250) NULL,
	fecha_nacimiento DATE NULL,
	enabled TINYINT NULL DEFAULT 1,
	red_social TINYINT NULL DEFAULT 0,
	image TEXT NULL DEFAULT 'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
	PRIMARY KEY(id),
	UNIQUE(username)
);

CREATE TABLE IF NOT EXISTS roles_usuario(
	roles_id INT NOT NULL,
	usuarios_id INT NOT NULL,
	PRIMARY KEY(roles_id, usuarios_id),
	FOREIGN KEY (roles_id) REFERENCES roles(id),
	FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS delitos(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR (45) NOT NULL,
	descripcion TEXT NULL,
    usuarios_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS casos(
    id INT NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME NULL DEFAULT now(),
    latitud FLOAT NULL,
    longitud FLOAT NULL,
    altitud FLOAT NULL,
    visible TINYINT NULL DEFAULT 1,
    descripcion VARCHAR(200) NULL,
    url_map TEXT NULL,
    rmi_url TEXT NULL,
    usuarios_id INT NOT NULL,
    delitos_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    FOREIGN KEY (delitos_id) REFERENCES delitos(id)
);
