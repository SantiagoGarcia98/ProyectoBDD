-- Trigger creado para agregar una atencion automaticamente, luego de creado un turno.
Create Trigger TR_AgregarAtencion
On Turnos
After Insert
As
Begin
    Insert into Atenciones (IDTurno, Observaciones)
    Select i.IDTurno, 'Atención generada automáticamente al crear el turno.'
    From inserted i;
End;
Go

-- Trigger Creado para eliminar una atencion correspondiente a un turno, tras el mismo ser eliminado
Create Trigger TR_EliminarAtencion
On Turnos
Instead Of Delete
As
Begin
    Delete From Atenciones
    Where IDTurno IN (Select d.IDTurno From deleted d);

    Delete From Turnos
    Where IDTurno In (Select d.IDTurno From deleted d);
End;
Go