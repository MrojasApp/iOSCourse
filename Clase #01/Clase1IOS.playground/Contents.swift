//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Declarar variable sin inicializar
var var1: String?

var1 = "Hello"

//Declarar variable con inicializacion
var var2 = "Montaña"

//Declarar una constante
let cons1 = "Pipo"

//Manera insegura
//print(var1)
//print(var1!)
//print(var1!.characters.count)

//Manera correcta de hacer un unwrap
if let var3 = var1{
    print("La variable tiene \(var3.characters.count) caracteres")
}

//print("La variable tiene \(var1.characters.count) caracteres")


//Explicación de un guard, para validar campos
func explicacionDeUnGuard(value: String?)-> Bool{
    //_ para no usar la variable o de retorno
    guard let _ = value else
    {   return false }
    return true
}

enum CampoFaltante: Int {
    case primero = 1, segundo
}

func ValidarCampos(campo1: String?, campo2: String?) -> CampoFaltante?{
    guard let _ = campo1 else {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else {
        return CampoFaltante.segundo
    }
    return nil
}

ValidarCampos(campo1: nil, campo2: "Lleno")
ValidarCampos(campo1: "Lleno", campo2: nil)
ValidarCampos(campo1: nil, campo2: nil)
ValidarCampos(campo1: "Lleno", campo2: "Lleno")


