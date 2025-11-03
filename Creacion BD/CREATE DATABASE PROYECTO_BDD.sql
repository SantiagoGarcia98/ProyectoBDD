CREATE DATABASE PROYECTO_BDD
GO
USE PROYECTO_BDD
GO


-- TABLAS


-- TABLA: Especialidades Médicas

CREATE TABLE EspecialidadesMedicas (
    IDEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);

-- TABLA: Médicos

CREATE TABLE Medicos (
    IDMedico INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Matricula NVARCHAR(20) NOT NULL,
    IDEspecialidad INT NOT NULL,
    Activo BIT DEFAULT 1,
    FOREIGN KEY (IDEspecialidad) REFERENCES EspecialidadesMedicas(IDEspecialidad)
);

-- TABLA: Obras Sociales

CREATE TABLE ObrasSociales (
    IDObraSocial INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Codigo NVARCHAR(10) NOT NULL
);

-- TABLA: Pacientes

CREATE TABLE Pacientes (
    IDPaciente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    DNI NVARCHAR(20) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Telefono NVARCHAR(25),
    Email NVARCHAR(100),
    IDObraSocial INT,
    Activo BIT DEFAULT 1,
    FOREIGN KEY (IDObraSocial) REFERENCES ObrasSociales(IDObraSocial)
);

-- TABLA: Consultorios

CREATE TABLE Consultorios (
    IDConsultorio INT IDENTITY(1,1) PRIMARY KEY,
    Numero NVARCHAR(10),
    Calle NVARCHAR(100),
    Localidad NVARCHAR(100),
    Provincia NVARCHAR(100)
);

-- TABLA: Tipos de Turnos

CREATE TABLE TiposTurnos (
    IDTipoTurno INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(25) NOT NULL
);

-- TABLA: Turnos

CREATE TABLE Turnos (
    IDTurno INT IDENTITY(1,1) PRIMARY KEY,
    IDPaciente INT NOT NULL,
    IDMedico INT NOT NULL,
    IDConsultorio INT NOT NULL,
    FechaHoraTurno DATETIME NOT NULL,
    IDTipoTurno INT NOT NULL,
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDConsultorio) REFERENCES Consultorios(IDConsultorio),
    FOREIGN KEY (IDTipoTurno) REFERENCES TiposTurnos(IDTipoTurno)
);

--TABLA: Recetas

CREATE TABLE Recetas (
    IDReceta INT IDENTITY(1,1) PRIMARY KEY,
    IDMedico INT NOT NULL,
    IDPaciente INT NOT NULL,
    FechaHoraReceta DATETIME NOT NULL,
    Indicaciones NVARCHAR(255),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente)
);