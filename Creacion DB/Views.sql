--Aqui estaran las views--

USE PROYECTO_BDD_CENTRO_MEDICO 
GO

CREATE VIEW vw_TurnosPorFecha AS
SELECT 
    t.IDTurno, CONVERT(time, FechaHoraTurno) AS HoraTurno,CONVERT(date, t.FechaHoraTurno) AS Fecha,t.Estado,
    dp_pac.Apellido + ', ' + dp_pac.Nombre AS Paciente,
    dp_pac.DNI AS DNIPaciente,
    dp_med.Apellido + ', ' + dp_med.Nombre AS Medico,dp_med.DNI AS DNIMedico,
    e.Nombre AS Especialidad,
    tt.Nombre AS TipoTurno

FROM Turnos t
INNER JOIN Pacientes p ON t.IDPaciente = p.IDPaciente
INNER JOIN DatosPersonales dp_pac ON p.IdDatosPersonales = dp_pac.IdDatosPersonales

INNER JOIN Medicos m ON t.IDMedico = m.IDMedico
INNER JOIN DatosPersonales dp_med ON m.IdDatosPersonales = dp_med.IdDatosPersonales


LEFT JOIN MedicoEspecialidad me ON m.IDMedico = me.IDMedico
LEFT JOIN EspecialidadesMedicas e ON me.IDEspecialidad = e.IDEspecialidad
--Se utiliza left por que puede haber algun medico sin especialidad cargada

INNER JOIN TiposTurnos tt ON t.IDTipoTurno = tt.IDTipoTurno;
GO


SELECT * FROM vw_TurnosPorFecha
ORDER BY Fecha;