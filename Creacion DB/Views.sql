--Aqui estaran las views--

USE PROYECTO_BDD_CENTRO_MEDICO 
GO

CREATE VIEW vw_TurnosPorFecha AS
SELECT 

    t.IDTurno, CONVERT(time, FechaHoraTurno) as HoraTurno,CONVERT(date, t.FechaHoraTurno) as Fecha,t.Estado,
    dp_pac.Apellido + ', ' + dp_pac.Nombre as Paciente,
    dp_pac.DNI as DNIPaciente,
    dp_med.Apellido + ', ' + dp_med.Nombre as Medico,dp_med.DNI as DNIMedico,
    e.Nombre as Especialidad,
    tt.Nombre as TipoTurno

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
GO

CREATE VIEW vw_Pacientes AS
SELECT 

    p.IDPaciente,
    dp.Apellido + ', '+ dp.Nombre as Paciente , dp.DNI , dp.FechaNacimiento ,dp.Celular ,dp.Email,
    p.FechaAlta , p.Estado,
    os.Nombre as obraSocial , os.Codigo as CodigoObraSocial,
    pos.NombrePlan as PlanActivo ,pos.CoberturaPorcentaje as '% Cobertura'

FROM Pacientes p
INNER JOIN DatosPersonales dp ON p.IdDatosPersonales = dp.IdDatosPersonales
LEFT JOIN PlanesObraSocial pos ON p.IdPlan = pos.IdPlan
LEFT JOIN ObrasSociales os ON pos.IDObraSocial = os.IDObraSocial
--Aqui se utiliza Left por que pueden haber pacientes sin obra social
GO 

CREATE VIEW vw_Medico AS
SELECT

    m.IDMedico,
    dp.Apellido + ', '+ dp.Nombre as Medico , dp.DNI , dp.Celular , dp.Email,
    m.Matricula , case when m.activo =1 then 'Activo' else 'inactivo' end as Estado,
    em.Nombre as especialidad

FROM medicos m 
INNER JOIN DatosPersonales dp on m.IdDatosPersonales = dp.IdDatosPersonales
LEFT JOIN MedicoEspecialidad me on m.idmedico = me.idmedico
LEFT JOIN EspecialidadesMedicas em on me.IDEspecialidad = em.IDEspecialidad;
-- se utiliza left para incluir medicos sin una especialidad cargada
GO

SELECT

    r.IDReceta, r.FechaHoraReceta , r.Indicaciones,
    a.IDAtenciones , a.Diagnostico , a.Observaciones,
    dp_med.Apellido + ' , ' + dp_med.Nombre as Medico,
    dp_pac.Apellido + ' , ' + dp_pac.Nombre as Paciente,
    m.Matricula,
    e.Nombre as Especialidad

FROM Recetas r
INNER JOIN Atenciones a ON r.IDAtenciones = a.IDAtenciones
INNER JOIN Turnos t ON a.IDTurno = t.IDTurno
INNER JOIN Pacientes p ON t.IDPaciente = p.IDPaciente
INNER JOIN DatosPersonales dp_pac ON p.IdDatosPersonales = dp_pac.IdDatosPersonales
INNER JOIN Medicos m ON t.IDMedico = m.IDMedico
INNER JOIN DatosPersonales dp_med ON m.IdDatosPersonales = dp_med.IdDatosPersonales
LEFT JOIN MedicoEspecialidad me ON m.IdDatosPersonales = me.IDEspecialidad
LEFT JOIN EspecialidadesMedicas e ON me.IDEspecialidad = e.IDEspecialidad
GO

SELECT name
FROM sys.views;
