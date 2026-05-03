object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const ingredientes = []

  method ingredientes() = ingredientes 
  
  method agregarIngredientes(unaIngrediente) = ingredientes.add(unaIngrediente)

  method rendimientoQueOtorga(dosisConsumida) = self.sumaDeNutrientes() * dosisConsumida
  
  method sumaDeNutrientes() = ingredientes.sum({i => i.nutrientes() }) 
}  

object aguaSaborizada { 
  const bebidaUtilizada = [] 

  method bebidaUtilizada() = bebidaUtilizada
  method rendimientoDelAgua() = 1  


  method rendimientoQueOtorga(dosisConsumida) = self.rendimientoDelAgua() +  self.rendimientoDeBebida(dosisConsumida)

  method rendimientoDeBebida(dosisConsumida) {
    return bebidaUtilizada.sum({bebida => bebida.rendimientoQueOtorga( dosisConsumida* 0.25) })
  }
} 

object coctel {

  const bebidas = [] 

  method bebidas() = bebidas 
  method agregarBebidas(unaBebida) = bebidas.add(unaBebida) 

  method rendimientoQueOtorga(dosisConsumida) = self.productoDeRendimientos(dosisConsumida) 

  method productoDeRendimientos(dosisConsumida) { 
    return bebidas.fold(1, {rendimiento, bebida => rendimiento * bebida.rendimientoQueOtorga(dosisConsumida)})
  }  

}