/*viajeros*/

class Viajero {
	
	var paisDeResidencia
	var listaDeViajes
	
	method listaDeViajes() = listaDeViajes
	
	method paisDeResidencia(anio) = #{paisDeResidencia}
	
	method viajesEnElAnio(anio) = self.listaDeViajes().filter({viaje => viaje.anio() == anio})
	
	method paisesDondeViajo(anio) = self.viajesEnElAnio(anio).map({viaje => viaje.pais()}).asSet()
	
	method enQuePaisesEstuvo(anio) = self.paisesDondeViajo(anio) + (self.paisDeResidencia(anio))
		
	method coincidioCon(viajero, anio) = (self.enQuePaisesEstuvo(anio).intersection(viajero.enQuePaisesEstuvo(anio)).size() > 0)	
		
}

class Establecido inherits Viajero {
	
	
}

class Migrante inherits Viajero {
	
	var paisQueNacio
	var paisDondeSeMudo
	var anioDeMudanza
	
	override method paisDeResidencia(anio) {
		
		if (anio < anioDeMudanza) {return #{paisQueNacio}}
			else { if (anio > anioDeMudanza) {return #{paisDondeSeMudo}}
				else {return #{paisQueNacio, paisDondeSeMudo}}
			}
		}
}

class Doctor inherits Viajero {}

class Menor inherits Viajero {}

object viaje {
	
	var paisDestino
	var anioDelViaje
}


