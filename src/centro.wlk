object centro {
	var aparatos = []
	var pacientes = []
	
	method aparatos() = aparatos
	method pacientes() = pacientes
	
	method colorAparatos() = aparatos.map({n => n.color()}).asSet().AsList()
	method PacientesMenoresDe8() = pacientes.filter({n => n.edad() < 8})
	method cantidadPacientesQueNoPuedenHacerRutina() = pacientes.count({n => !n.puedeHacerRutina()})
}
