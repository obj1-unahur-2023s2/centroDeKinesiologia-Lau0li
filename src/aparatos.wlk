import pacientes.*
class Aparato {
	var color = "blanco"
	
	method color() = color
	method puedeSerUsadoPor(persona) = true
	method dolorQueDisminuye(persona) = 0
	method fortalezaQueAumenta(persona) = 0
	method cambiarColor(uncolor){
		color = uncolor
	}
	method hacerMantenimiento(){}
	method desgastar(_){}
	method necesitaMantenimiento() = false
}

class Magneto inherits Aparato {
	var imantacion = 800
	override method dolorQueDisminuye(persona) = persona.dolor() * 0.1 
	override method hacerMantenimiento() {
		imantacion += 500
	}
	
	override method desgastar(_){
		imantacion --
	}
	override method necesitaMantenimiento() = imantacion < 100
	
}

class Bicicleta inherits Aparato {
	var cantidadVecesPierdeAceite = 0
	var cantidadVecesDesajustaTornillos = 0
	
	override method dolorQueDisminuye(persona) = 4
	override method fortalezaQueAumenta(persona) = 3
	override method puedeSerUsadoPor(persona) = persona.edad() > 8

	override method hacerMantenimiento() {
		cantidadVecesPierdeAceite = 0
		cantidadVecesDesajustaTornillos = 0
	}
	
	override method desgastar(persona){
		if (persona.dolor() > 30){
			cantidadVecesDesajustaTornillos ++
		}
		if (persona.edad().between(30, 50)){
			cantidadVecesPierdeAceite ++
		}
	}
	override method necesitaMantenimiento() = cantidadVecesDesajustaTornillos >= 10 or cantidadVecesPierdeAceite >= 5
}

class Minitramp inherits Aparato {
	override method puedeSerUsadoPor(persona) = persona.dolor() < 20
	override method fortalezaQueAumenta(persona) = persona.edad() * 0.1
}
