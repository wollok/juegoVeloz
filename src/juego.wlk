import wollok.game.*

object alien {
	
	var puntaje = 0
	var property position = game.center()
	
	method image() = "alien.png"
	
	method ganar(cant){
		puntaje = puntaje + cant
	}
	method puntaje() = puntaje
}


object tablero{
	method position() = game.at(10,game.height()-1)
	method text() =  "Puntos:" + alien.puntaje()
}

class Auto{
	
	var position
	var puntos = 1
	
	method position() = position
	
	method image() = "auto.png"
	
	
	method desaparecer() {
		game.removeVisual(self)
		alien.ganar(puntos)
	}
}

object pantalla {
	
	var cantAutos = 10
	
	method iniciar() {
		self.configurarInicio()
		self.agregarVisuales()
		self.programarTeclas()
		self.definirColisiones()
	}
	method configurarInicio() {
		game.height(12)
		game.width(20)
		game.title("juego veloz")
	}
	method agregarVisuales() {
		game.addVisualCharacter(alien)
		cantAutos.times({
			i => game.addVisual(new Auto(position = game.at(i+3,10)))
		})
		game.addVisual(tablero)
		
		 
	}
	method programarTeclas() {
		//TODO: Código autogenerado 
	}
	method definirColisiones() {
		game.onCollideDo(alien,{algo => algo.desaparecer() }) 
	}
	
	
}
