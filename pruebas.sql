exec borrarRegistros

exec insertarPuestos 'Ingeniero Civil',6000
exec insertarPuestos 'Arquitecto',4000
exec insertarPuestos 'CEO',15000
exec insertarPuestos 'Ingeniero en sistemas',4500
exec insertarPuestos 'Gerente general',3000

exec insertarTipos_Movimientos 'Bono vacacional'
exec insertarTipos_Movimientos 'Ajuste +'
exec insertarTipos_Movimientos 'Devolución de débito'
exec insertarTipos_Movimientos 'Venta'
exec insertarTipos_Movimientos 'Ajuste -'
exec insertarTipos_Movimientos 'Devolución de crédito'

exec insertarEmpleados 0,0,'Carla45','nuevenueve',167008745,'Carla María','Sánchez Brenes','2015-04-02',1,'carla.maiaa@gmail.com'
exec insertarJefes 1

exec insertarAdministradores 'admin1','admin1'

select * from EMPLEADOS
select * from TIPOS_MOVIMIENTOS
select * from PUESTOS
exec obtenerRegistrosJefes