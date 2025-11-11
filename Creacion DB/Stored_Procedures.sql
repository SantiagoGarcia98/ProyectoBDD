use PROYECTO_BDD_CENTRO_MEDICO

-- sp_ReporteTurnosPorMedico: Genera reporte de turnos para un medico especifico

Create procedure sp_ReporteTurnosPorMedico
    @IDMedico int
As
Begin
    Select * From vw_TurnosPorFecha
    Where DNIMedico in (
        Select DP.DNI From Medicos M
        Inner join DatosPersonales DP On M.IdDatosPersonales = DP.IdDatosPersonales
        Where M.IDMedico = @IDMedico
    )
    Order By Fecha Desc, HoraTurno Desc;
End;