object rolando {
    const mochila = []
    var capacidadMaxima = 2
    const castillo = castilloDePiedra
    const historialDeArtefactos = []
    var poderBase = 5

    method poderBase() {
        return poderBase
    }

    method poderDePelea() {
        return mochila.sum({artefacto => artefacto.poder()})
    }

    method poderDeRolando(){
        return self.poderBase() + self.poderDePelea()
    }

    method pelearBatalla() {
        const poderRolando = self.poderDeRolando() + 1
    }
    method encuentraArtefacto(art) {
        historialDeArtefactos.add(art)

        if (mochila.size() < capacidadMaxima) {
            self.recolectarArtefacto(art)
        }
    }

    method historialDeArtefactos () {
        return historialDeArtefactos
    }

    method recolectarArtefacto(art) {
        mochila.add(art)
    }

    method artefactosDeLaMochila() {
        return mochila
    }
    
    method capacidadMaxima () = capacidadMaxima

    method capacidadMaxima(_capacidadMaxima) {
        capacidadMaxima = _capacidadMaxima
    }

    method vaciarMochila(){
        mochila.clear()
    }

    method llegarACastillo() {
        castillo.guardarEnAlmacen(mochila)
    }

    method artefactosDeRolando() {
        return mochila.addAll(castillo.artefactosEnElCastillo())
    }

    method tieneElArtefacto(art) {
        return self.artefactosDeRolando().contains(art)
    }
}

object collarDivino { 
    var personaje = rolando
    const poder = 3
    var batallas = 0
    
    method poder() {
        return if(personaje.poderBase() > 6) {
            poder + 1 * batallas
        }
    }

    method batalla() {
        batallas += 1
    }

    method personaje(_personaje){
        personaje = _personaje
    }
}

object espadaDelDestino {
    var personaje = rolando
    const poder = personaje.poderBase()
    var usos = 0

    method poder() {
        return if(usos == 0) {
            poder
        }else{
            poder / 2
        }
    }

    method usos(){
        usos += 1
    }

    method personaje(_personaje) {
        personaje = _personaje
    }
    
}

object libroDeHechizos {
    const poder = 0

    method poder() {
        return poder
    }
}

object armaduraDeAceroValyrio {
    const poder = 6

    method poder() {
        return poder 
    }

}

object castilloDePiedra {
    const almacen = []

    method artefactosEnElCastillo () {
        return almacen
    }
    
    method guardarEnAlmacen (artefactos) {
        almacen.addAll(artefactos)
    }
    
}