-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-05 20:22:51.038

-- tables
-- Table: Arma
CREATE TABLE Arma (
    Nombre varchar(25) NOT NULL,
    Damage integer NOT NULL,
    Tipo varchar(20) NOT NULL,
    Habilidad varchar(20),
    Objeto_ID_Objeto varchar(20) NOT NULL CONSTRAINT Arma_pk PRIMARY KEY,
    CONSTRAINT Arma_Objeto FOREIGN KEY (Objeto_ID_Objeto)
    REFERENCES Objeto (ID_Objeto)
);

-- Table: Armadura
CREATE TABLE Armadura (
    Nombre varchar(25) NOT NULL,
    Defensa integer NOT NULL,
    Pasiva varchar(20),
    Tipo varchar(20) NOT NULL,
    Objeto_ID_Objeto varchar(20) NOT NULL CONSTRAINT Armadura_pk PRIMARY KEY,
    CONSTRAINT Armadura_Objeto FOREIGN KEY (Objeto_ID_Objeto)
    REFERENCES Objeto (ID_Objeto)
);

-- Table: Boss
CREATE TABLE Boss (
    NFases integer NOT NULL,
    Acto integer NOT NULL,
    Habilidades varchar(80) NOT NULL,
    Enemigo_ID_Enemigo character(3) NOT NULL CONSTRAINT Boss_pk PRIMARY KEY,
    CONSTRAINT Boss_Enemigo FOREIGN KEY (Enemigo_ID_Enemigo)
    REFERENCES Enemigo (ID_Enemigo)
);

-- Table: Consumible
CREATE TABLE Consumible (
    Nombre varchar(25) NOT NULL,
    Tipo varchar(20) NOT NULL,
    Efecto varchar(20) NOT NULL,
    Objeto_ID_Objeto varchar(20) NOT NULL CONSTRAINT Consumible_pk PRIMARY KEY,
    CONSTRAINT Consumible_Objeto FOREIGN KEY (Objeto_ID_Objeto)
    REFERENCES Objeto (ID_Objeto)
);

-- Table: Enemigo
CREATE TABLE Enemigo (
    ID_Enemigo character(3) NOT NULL CONSTRAINT Enemigo_pk PRIMARY KEY,
    Nombre varchar(25) NOT NULL,
    Tipo varchar(20) NOT NULL,
    Fuerza integer NOT NULL,
    Destreza integer NOT NULL,
    Constitucion integer NOT NULL,
    Inteligencia integer NOT NULL,
    Sabiduria integer NOT NULL,
    Carisma integer NOT NULL,
    Mapa_ID_Sitio integer NOT NULL,
    CONSTRAINT Enemigo_Mapa FOREIGN KEY (Mapa_ID_Sitio)
    REFERENCES Mapa (ID_Sitio)
);

-- Table: Formabestia
CREATE TABLE Formabestia (
    Animal varchar(20) NOT NULL CONSTRAINT Formabestia_pk PRIMARY KEY,
    Habilidad varchar(20) NOT NULL
);

-- Table: Hechizos
CREATE TABLE Hechizos (
    Nombre_Hechizo varchar(20) NOT NULL CONSTRAINT Hechizos_pk PRIMARY KEY,
    Damage integer,
    Curacion integer
);

-- Table: Mapa
CREATE TABLE Mapa (
    ID_Sitio integer NOT NULL CONSTRAINT Mapa_pk PRIMARY KEY,
    Sitio varchar(20) NOT NULL,
    Subterraneo boolean NOT NULL
);

-- Table: NPC
CREATE TABLE NPC (
    Nombre_NPC varchar(20) NOT NULL CONSTRAINT NPC_pk PRIMARY KEY,
    Tipo varchar(20) NOT NULL,
    Fuerza integer NOT NULL,
    Destreza integer NOT NULL,
    Constitucion integer NOT NULL,
    Inteligencia integer NOT NULL,
    Sabiduria integer NOT NULL,
    Carisma integer NOT NULL,
    Mapa_ID_Sitio integer NOT NULL,
    CONSTRAINT NPC_Mapa FOREIGN KEY (Mapa_ID_Sitio)
    REFERENCES Mapa (ID_Sitio)
);

-- Table: Objeto
CREATE TABLE Objeto (
    ID_Objeto varchar(20) NOT NULL CONSTRAINT Objeto_pk PRIMARY KEY,
    Rareza varchar(20) NOT NULL,
    Valor decimal(10000,2) NOT NULL
);

-- Table: Partida
CREATE TABLE Partida (
    Escenario varchar(20) NOT NULL CONSTRAINT Partida_pk PRIMARY KEY,
    Duracion integer NOT NULL,
    Progreso integer NOT NULL,
    Usuario_Nick varchar(20) NOT NULL,
    CONSTRAINT Partida_Usuario FOREIGN KEY (Usuario_Nick)
    REFERENCES Usuario (Nick)
);

-- Table: Partida_Mapa
CREATE TABLE Partida_Mapa (
    Partida_Escenario varchar(20) NOT NULL,
    Mapa_ID_Sitio integer NOT NULL,
    CONSTRAINT Partida_Mapa_pk PRIMARY KEY (Partida_Escenario,Mapa_ID_Sitio),
    CONSTRAINT Partida_Mapa_Partida FOREIGN KEY (Partida_Escenario)
    REFERENCES Partida (Escenario),
    CONSTRAINT Partida_Mapa_Mapa FOREIGN KEY (Mapa_ID_Sitio)
    REFERENCES Mapa (ID_Sitio)
);

-- Table: Personaje
CREATE TABLE Personaje (
    ID_Personaje character(3) NOT NULL CONSTRAINT Personaje_pk PRIMARY KEY,
    Nombre varchar(20) NOT NULL,
    Raza varchar(20) NOT NULL,
    Clase varchar(20) NOT NULL,
    Avatar boolean,
    Nivel integer NOT NULL,
    Fuerza integer NOT NULL,
    Destreza integer NOT NULL,
    Constitucion integer NOT NULL,
    Inteligencia integer NOT NULL,
    Sabiduria integer NOT NULL,
    Carisma integer NOT NULL,
    HechizosDisponibles integer NOT NULL
);

-- Table: Personaje_Formabestia
CREATE TABLE Personaje_Formabestia (
    Personaje_ID_Personaje character(3) NOT NULL,
    Formabestia_Animal varchar(20) NOT NULL,
    CONSTRAINT Personaje_Formabestia_pk PRIMARY KEY (Personaje_ID_Personaje,Formabestia_Animal),
    CONSTRAINT Personaje_Formabestia_Personaje FOREIGN KEY (Personaje_ID_Personaje)
    REFERENCES Personaje (ID_Personaje),
    CONSTRAINT Personaje_Formabestia_Formabestia FOREIGN KEY (Formabestia_Animal)
    REFERENCES Formabestia (Animal)
);

-- Table: Personaje_Hechizos
CREATE TABLE Personaje_Hechizos (
    Personaje_ID_Personaje character(3) NOT NULL,
    Hechizos_Nombre_Hechizo varchar(20) NOT NULL,
    CONSTRAINT Personaje_Hechizos_pk PRIMARY KEY (Personaje_ID_Personaje,Hechizos_Nombre_Hechizo),
    CONSTRAINT Personaje_Hechizos_Personaje FOREIGN KEY (Personaje_ID_Personaje)
    REFERENCES Personaje (ID_Personaje),
    CONSTRAINT Personaje_Hechizos_Hechizos FOREIGN KEY (Hechizos_Nombre_Hechizo)
    REFERENCES Hechizos (Nombre_Hechizo)
);

-- Table: Personaje_Objeto
CREATE TABLE Personaje_Objeto (
    Personaje_ID_Personaje character(3) NOT NULL,
    Objeto_ID_Objeto varchar(20) NOT NULL,
    CONSTRAINT Personaje_Objeto_pk PRIMARY KEY (Personaje_ID_Personaje,Objeto_ID_Objeto),
    CONSTRAINT Personaje_Objeto_Personaje FOREIGN KEY (Personaje_ID_Personaje)
    REFERENCES Personaje (ID_Personaje),
    CONSTRAINT Personaje_Objeto_Objeto FOREIGN KEY (Objeto_ID_Objeto)
    REFERENCES Objeto (ID_Objeto)
);

-- Table: Personaje_Partida
CREATE TABLE Personaje_Partida (
    Personaje_ID_Personaje character(3) NOT NULL,
    Partida_Escenario varchar(20) NOT NULL,
    CONSTRAINT Personaje_Partida_pk PRIMARY KEY (Personaje_ID_Personaje,Partida_Escenario),
    CONSTRAINT Personaje_Partida_Personaje FOREIGN KEY (Personaje_ID_Personaje)
    REFERENCES Personaje (ID_Personaje),
    CONSTRAINT Personaje_Partida_Partida FOREIGN KEY (Partida_Escenario)
    REFERENCES Partida (Escenario)
);

-- Table: Usuario
CREATE TABLE Usuario (
    Nick varchar(20) NOT NULL CONSTRAINT Usuario_pk PRIMARY KEY,
    Password varchar(10) NOT NULL
);

-- End of file.

