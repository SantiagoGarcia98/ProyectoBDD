CREATE DATABASE PROYECTO_BDD_CENTRO_MEDICO -- creacion del nuevo BDD , con los cambios aplicados que menciono el profesor al momento de corregir el DER.
GO

USE PROYECTO_BDD_CENTRO_MEDICO 
GO

--Tabla datos personales

CREATE TABLE DatosPersonales (
    IdDatosPersonales INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    DNI NVARCHAR(100) NOT NULL UNIQUE,
    FechaNacimiento DATE,
    Celular NVARCHAR(25),
    Email NVARCHAR(100),
)
GO

--Tabla especialidades medicas

CREATE TABLE EspecialidadesMedicas (
    IDEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
)
GO

--Tabla medicos

CREATE TABLE Medicos (
    IDMedico INT IDENTITY(1,1) PRIMARY KEY,
    IdDatosPersonales INT NOT NULL,
    Matricula NVARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FOREIGN KEY (IdDatosPersonales) REFERENCES DatosPersonales(IdDatosPersonales)

)
GO

--Tabla de la especialidad del medico

CREATE TABLE MedicoEspecialidad(
    IDMedico INT NOT NULL,
    IDEspecialidad INT NOT NULL,
    PRIMARY KEY (IDMedico , IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDEspecialidad) REFERENCES EspecialidadesMedicas(IDEspecialidad)
)
GO

--Tabla obra social

CREATE TABLE  ObrasSociales(
    IDObraSocial INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Codigo NVARCHAR(10) NOT NULL
)
GO

--Tabla de Planes de las obras sociales

CREATE TABLE PlanesObraSocial(
    IdPlan INT IDENTITY(1,1) PRIMARY KEY,
    IDObraSocial INT NOT NULL,
    NombrePlan NVARCHAR (100) NOT NULL,
    CoberturaPorcentaje DECIMAL(5,2) DEFAULT 100,
    FOREIGN KEY (IDObraSocial) REFERENCES ObrasSociales(IDObraSocial),
)


--Tabla Pacientes

CREATE TABLE Pacientes(
    IDPaciente INT IDENTITY(1,1) PRIMARY KEY,
    IdDatosPersonales INT NOT NULL,
    IdPlan INT NULL,
    FechaAlta DATE DEFAULT GETDATE(),
    Estado NVARCHAR(50) DEFAULT 'activo',
    FOREIGN KEY (IdDatosPersonales) REFERENCES DatosPersonales(IdDatosPersonales),
    FOREIGN KEY (IdPlan) REFERENCES PlanesObraSocial(IdPlan)
)
GO

--Tabla Consultorios 

CREATE TABLE Consultorios(
    IDConsultorio INT IDENTITY(1,1) PRIMARY KEY,
    Numero NVARCHAR(10) NULL,
    Calle NVARCHAR(100) NOT NULL,
    Localidad NVARCHAR(100) NOT NULL,
    Provincia NVARCHAR(100) NOT NULL,
)
GO

--Tabla Tipos de turnos(Tipo de urgencia y/o categorizar los turnos)

CREATE TABLE TiposTurnos(
    IDTipoTurno INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(25) NOT NULL
)
GO

--Tabla Turno

CREATE TABLE Turnos(
    IDTurno int IDENTITY(1,1) PRIMARY KEY,
    IDPaciente int NOT NULL,
    IDMedico INT NOT NULL,
    IDConsultorio INT NOT NULL,
    FechaHoraTurno DATETIME NOT NULL,
    IDTipoTurno INT NOT NULL,
    Estado NVARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDMedico) REFERENCES medicos(IDMedico),
    FOREIGN KEY (IDConsultorio) REFERENCES Consultorios(IDConsultorio),
    FOREIGN KEY (IDTipoTurno) REFERENCES TiposTurnos(IDTipoTurno)
)
GO

--Tabla Atenciones (Informacion medica del turno)

CREATE TABLE Atenciones(
    IDAtenciones INT IDENTITY(1,1) PRIMARY KEY,
    IDTurno INT NOT NULL,
    Diagnostico NVARCHAR(300),
    Observaciones NVARCHAR(300),
    FechaRegistro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IDTurno) REFERENCES Turnos(IDTurno)
)
GO

--Tabla Recetas ( esta esta vinculada a una atencion)

CREATE TABLE Recetas(
    IDReceta int IDENTITY(1,1) PRIMARY KEY,
    IDAtenciones INT NOT NULL,
    Indicaciones NVARCHAR(300),
    FechaHoraReceta DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IDAtenciones) REFERENCES Atenciones(IDAtenciones)
)
GO