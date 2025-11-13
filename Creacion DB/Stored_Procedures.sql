use PROYECTO_BDD_CENTRO_MEDICO

-- sp_ReporteTurnosPorMedico: Genera reporte de turnos para un medico especifico
GO 

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


GO
Create procedure sp_AgregarObraSocial
    @Nombre NVARCHAR(100),
    @Codigo NVARCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ObrasSociales as ob WHERE ob.Nombre = @Nombre)
    BEGIN
        RAISERROR('Ya existe una obra social con ese nombre.' ,16,1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM ObrasSociales as ob WHERE ob.Codigo = @Codigo)
    BEGIN
        RAISERROR('Ya existe una obra social con ese codigo',16,1);
    END

    INSERT into ObrasSociales (Nombre, Codigo)
    VALUES(@Nombre , @Codigo);

END;
GO

EXEC sp_AgregarObraSocial @nombre = 'UTNMEDICAL' ,@codigo = 'coco'
EXEC sp_ReporteTurnosPorMedico @idMedico = 2

SELECT *
FROM ObrasSociales