class Paciente {
	var dolor 
	var	fortaleza
	var edad
	var rutina = []
	
	method dolor() = dolor
	method fortaleza() = fortaleza
	method edad() = edad
	
	method usarAparato(aparato){
		if (aparato.puedeSerUsadoPor(self)){
			dolor = 0.max(dolor - aparato.dolorQueDisminuye(self))
			fortaleza += aparato.fortalezaQueAumenta(self)
			aparato.desgastar()
		}
		else{
			self.error("esta persona no puede usar el aparato")
		}
	}
	
	method asignarAparatoALaRutina(listaDeAparatos){
		rutina.addAll(listaDeAparatos)
	}
	method puedeHacerRutina() = rutina.all({a => a.puedeSerUsadoPor(self)})
	method hacerRutina(){
		if (!self.puedeHacerRutina()){
			self.error("el Paciente no puede hacer la rutina")
		}
		else{
			rutina.forEach({n => self.usarAparato(n)})
		}
	}
}

class Resistente inherits Paciente{
	override method hacerRutina(){
		super()
		fortaleza += rutina.size()
	}
}
class Caprichoso inherits Paciente{
	
	override method puedeHacerRutina() = super() and rutina.any({n => n.color() == "rojo"})
	
	override method hacerRutina(){
		(1..2).forEach({r => super()})
	} 
}
class RecuperacionRapida inherits Paciente{
	override method hacerRutina(){
		super()
		dolor = 0.max(dolor - nivelRecuperacion.valor()) 
	}
}

object nivelRecuperacion {
	var property valor = 3
}
