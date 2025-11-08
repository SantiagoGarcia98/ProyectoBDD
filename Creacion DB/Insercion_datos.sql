use PROYECTO_BDD_CENTRO_MEDICO
Go

INSERT INTO DatosPersonales (Nombre, Apellido, DNI, FechaNacimiento, Celular, Email) VALUES
('Carlos', 'Pérez', '30123456', '1980-03-15', '1123456789', 'carlos.perez@mail.com'),
('María', 'Gómez', '28987654', '1985-07-22', '1165478901', 'maria.gomez@mail.com'),
('Jorge', 'Rodríguez', '31222333', '1978-11-30', '1154321987', 'jorge.rodriguez@mail.com'),
('Lucía', 'Fernández', '33456789', '1990-02-10', '1176543210', 'lucia.fernandez@mail.com'),
('Ana', 'Martínez', '29876543', '1982-05-05', '1198765432', 'ana.martinez@mail.com'),
('Sofía', 'López', '36543210', '1995-06-18', '1167894321', 'sofia.lopez@mail.com'),
('Diego', 'Ramírez', '34567890', '1988-12-09', '1145678901', 'diego.ramirez@mail.com'),
('Camila', 'Torres', '35678901', '1992-09-14', '1134567890', 'camila.torres@mail.com'),
('Martín', 'Sosa', '32456789', '1984-01-27', '1187654321', 'martin.sosa@mail.com'),
('Florencia', 'Díaz', '37890123', '1998-08-11', '1123459876', 'florencia.diaz@mail.com'),
('Gonzalo', 'Ruiz', '36456234', '1991-11-20', '1189023456', 'gonzalo.ruiz@mail.com'),
('Laura', 'Cabrera', '37890111', '1996-10-02', '1143216789', 'laura.cabrera@mail.com'),
('Hernán', 'Domínguez', '35222333', '1983-07-25', '1178901234', 'hernan.dominguez@mail.com'),
('Julieta', 'Vega', '33987654', '1989-03-30', '1165432198', 'julieta.vega@mail.com'),
('Pablo', 'Silva', '34111222', '1993-04-12', '1156789432', 'pablo.silva@mail.com'),
('Carolina', 'Mendoza', '32987654', '1986-09-09', '1123456781', 'carolina.mendoza@mail.com'),
('Ramiro', 'Acosta', '34876543', '1990-02-21', '1199998888', 'ramiro.acosta@mail.com'),
('Tamara', 'Ibarra', '35678999', '1994-05-14', '1177776666', 'tamara.ibarra@mail.com'),
('Federico', 'Rojas', '36222333', '1981-10-23', '1166665555', 'federico.rojas@mail.com'),
('Valeria', 'Castro', '37111222', '1987-06-17', '1144443333', 'valeria.castro@mail.com'),
('Ignacio', 'Luna', '35999999', '1995-12-12', '1133332222', 'ignacio.luna@mail.com'),
('Natalia', 'Moreno', '37888888', '1997-07-07', '1122221111', 'natalia.moreno@mail.com'),
('Santiago', 'Paz', '36555555', '1991-11-11', '1111110000', 'santiago.paz@mail.com'),
('Emilia', 'Suárez', '38222222', '1999-09-09', '1198765123', 'emilia.suarez@mail.com'),
('Rodrigo', 'Cruz', '37999999', '1992-03-03', '1188887777', 'rodrigo.cruz@mail.com');
GO


-- 2. EspecialidadesMedicas
INSERT INTO EspecialidadesMedicas (Nombre) VALUES
('Clínica Médica'),
('Pediatría'),
('Cardiología'),
('Dermatología'),
('Traumatología');
GO


-- 3. Médicos (usan IdDatosPersonales 1–5)
INSERT INTO Medicos (IdDatosPersonales, Matricula, Activo) VALUES
(1, 'M8742', 1),
(2, 'M32187', 1),
(3, 'M34967', 1),
(4, 'M41978', 1),
(5, 'M56049', 1);
GO


-- 4. MedicoEspecialidad
INSERT INTO MedicoEspecialidad (IDMedico, IDEspecialidad) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 5),
(4, 4),
(5, 1);
GO


-- 5. ObrasSociales
INSERT INTO ObrasSociales (Nombre, Codigo) VALUES
('OSDE', 'OSD01'),
('Swiss Medical', 'SWM02'),
('Galeno', 'GAL03');
GO


-- 6. PlanesObraSocial
INSERT INTO PlanesObraSocial (IDObraSocial, NombrePlan, CoberturaPorcentaje) VALUES
(1, 'OSDE 210', 90.00),
(1, 'OSDE 310', 100.00),
(2, 'SM Blue', 85.00),
(2, 'SM Premium', 100.00),
(3, 'Galeno Plata', 80.00),
(3, 'Galeno Oro', 95.00);
GO


-- 7. Pacientes (IdDatosPersonales 6–15)
INSERT INTO Pacientes (IdDatosPersonales, IdPlan, FechaAlta, Estado) VALUES
(6, 1, GETDATE(), 'activo'),
(7, 2, GETDATE(), 'activo'),
(8, 3, GETDATE(), 'activo'),
(9, 4, GETDATE(), 'activo'),
(10, 5, GETDATE(), 'activo'),
(11, 6, GETDATE(), 'activo'),
(12, 1, GETDATE(), 'activo'),
(13, 2, GETDATE(), 'inactivo'),
(14, 3, GETDATE(), 'activo'),
(15, 4, GETDATE(), 'activo');
GO


-- 8. Consultorios
INSERT INTO Consultorios (Numero, Calle, Localidad, Provincia) VALUES
('101', 'Av. Siempre Viva 123', 'San Isidro', 'Buenos Aires'),
('102', 'Mitre 456', 'Tigre', 'Buenos Aires'),
('201', 'Belgrano 789', 'Vicente López', 'Buenos Aires'),
('202', 'Rivadavia 321', 'CABA', 'Buenos Aires'),
('301', 'Laprida 654', 'CABA', 'Buenos Aires');
GO


-- 9. TiposTurnos
INSERT INTO TiposTurnos (Nombre) VALUES
('Consulta'),
('Urgencia'),
('Control');
GO


-- 10. Turnos
INSERT INTO Turnos (IDPaciente, IDMedico, IDConsultorio, FechaHoraTurno, IDTipoTurno, Estado) VALUES
(1, 1, 1, '2025-11-05 09:00', 1, 'Pendiente'),
(2, 2, 2, '2025-11-05 10:30', 2, 'Pendiente'),
(3, 3, 3, '2025-11-05 11:00', 1, 'Pendiente'),
(4, 4, 4, '2025-11-06 09:30', 3, 'Pendiente'),
(5, 5, 5, '2025-11-06 10:00', 1, 'Pendiente'),
(6, 1, 1, '2025-11-06 11:00', 2, 'Pendiente'),
(7, 2, 2, '2025-11-07 09:00', 1, 'Pendiente'),
(8, 3, 3, '2025-11-07 10:30', 3, 'Pendiente'),
(9, 4, 4, '2025-11-08 09:30', 1, 'Pendiente'),
(10, 5, 5, '2025-11-08 11:00', 2, 'Pendiente');
GO


-- 11. Atenciones
INSERT INTO Atenciones (IDTurno, Diagnostico, Observaciones, FechaRegistro) VALUES
(1, 'Gripe común', 'Se recomienda reposo e hidratación', GETDATE()),
(2, 'Fiebre alta', 'Posible infección viral', GETDATE()),
(3, 'Dolor muscular', 'Analgesia leve recomendada', GETDATE()),
(4, 'Chequeo anual', 'Todo dentro de parámetros normales', GETDATE()),
(5, 'Revisión de alergia', 'Continuar tratamiento habitual', GETDATE()),
(6, 'Dolor abdominal', 'Se solicita ecografía', GETDATE()),
(7, 'Chequeo pediátrico', 'Peso y talla normales', GETDATE()),
(8, 'Control dermatológico', 'Revisión sin anomalías', GETDATE()),
(9, 'Consulta traumatológica', 'Posible esguince leve', GETDATE()),
(10, 'Fiebre persistente', 'Derivar a estudios', GETDATE());
GO


-- 12. Recetas
INSERT INTO Recetas (IDAtenciones, Indicaciones, FechaHoraReceta) VALUES
(1, 'Paracetamol 500mg cada 8hs por 3 días', GETDATE()),
(2, 'Ibuprofeno 400mg cada 6hs si persiste el dolor', GETDATE()),
(4, 'Vitamina C 1 comprimido diario', GETDATE()),
(6, 'Omeprazol 20mg en ayunas por 5 días', GETDATE()),
(9, 'Vendaje elástico y reposo 48hs', GETDATE());
GO