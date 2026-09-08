object rolando {
    const mochila = []
    var capacidadMaxima = 2
    const castillo = castilloDePiedra
    const historialDeArtefactos = []
    var poderBase = 5
    const enemigos = #{caterina, archibaldo, astra}

    method encuentraArtefacto(art) {
        historialDeArtefactos.add(art)

        if (mochila.size() < capacidadMaxima) {
            self.recolectarArtefacto(art)
        }
    }

    method historialDeArtefactos() {
        return historialDeArtefactos
    }

    method recolectarArtefacto(art) {
        mochila.add(art)
    }

    method artefactosDeLaMochila() {
        return mochila
    }
    
    method capacidadMaxima() = capacidadMaxima

    method actualizarCapacidadMaxima () {
        capacidadMaxima += 1
    }

    method vaciarMochila(){
        mochila.clear()
    }

    method llegarACastillo() {
        castillo.guardarEnAlmacen(mochila)
        self.vaciarMochila()
    }

    method artefactosEnPosecion() {
        return mochila.addAll(castillo.artefactosEnElCastillo())
    }

    method tieneElArtefacto(art) {
        return self.artefactosEnPosecion().contains(art)
    }

    method poderBase() {
        return poderBase
    }

    method poderDePelea(){
        return poderBase + mochila.sum({artefacto => artefacto.poder(self)})
    }

    method pelearBatalla() {
        poderBase += 1
        mochila.forEach({artefacto => artefacto.usarArtefacto()})
    }

    method artefactoMasPoderosoEnCastillo() {
        castillo.artefactosEnElCastillo().max({artefacto => artefacto.poder(self)})
    }

    method enemigosQuePuedeVencer() {
        return enemigos.find({enemigo => enemigo.poder() < self.poderDePelea()})
    }

    method moradasConquistables() {
        return self.enemigosQuePuedeVencer().map({enemigo => enemigo.morada()})
    }

    method esPoderoso() {
        return (self.enemigosQuePuedeVencer().size() == enemigos.size()) || self.poderBase() >= 10
    }
}

object collarDivino { 
    const poder = 3
    var batallas = 0
    
    method poder(personaje) {
        return if(personaje.poderBase() > 6) {
            poder + 1 * batallas
        }
    }

    method usarArtefacto() {
        batallas += 1
    }
}

object espadaDelDestino {
    var usos = 0

    method poder(personaje) {
        return if(usos == 0) {
            personaje.poderBase()
        }else{
            personaje.poderBase() / 2
        }
    }

    method usarArtefacto(){
        usos += 1
    }
}

object libroDeHechizos {
    const poder = 0
    var usos = 0
    const hechizos = []

    method poder(personaje) {
        return if(hechizos.isEmpty()){
            poder
        } else {
            hechizos.first().poderDeHechizo(personaje)
        }
    }

    method usarArtefacto() {
        usos += 1
        hechizos.remove(hechizos.first())
    }
    
}

object bendicion {
    const poderHechizo = 4
    method poderDeHechizo(_) {
        return poderHechizo
    }
}

object invisibilidad {
    method poderDeHechizo(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {
    method poderDeHechizo(personaje) {
        return personaje.artefactosEnPosecion()
    }
}

object armaduraDeAceroValyrio {
    const poder = 6
    var usos = 0

    method poder(_) {
        return poder 
    }

    method usarArtefacto() {
        usos += 1
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

object caterina {
    const poder = 28

    method poder() {
        return poder
    }

    method morada() {
        return fortalezaDeAcero
    }
}

object archibaldo {
    const poder = 16

    method poder() {
        return poder
    }

    method morada() {
        return palacioDeMarmol
    }
}

object astra {
    const poder = 14

    method poder() {
        return poder
    }

    method morada() {
        return torreDeMarfil
    }
}

object fortalezaDeAcero {

}
object palacioDeMarmol {

}
object torreDeMarfil {

}