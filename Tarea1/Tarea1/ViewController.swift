//
//  ViewController.swift
//  Tarea1
//
//  Created by Mauricio Rojas Vindas on 14/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valor1TextField: UITextField!
    @IBOutlet weak var valor2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSumar(_ sender: Any)
    {
        if ValidatedField(campo1: valor1TextField.text!, campo2: valor2TextField.text!)
        {
            let valor1: Double = Double(valor1TextField.text!)!
            let valor2: Double = Double(valor2TextField.text!)!
            
            let resultado: Double = valor1 + valor2
     
            DisplayResult(val1: valor1,val2: valor2, operador: "+",resultado: resultado)
        }
    }
    
    @IBAction func btnRestar(_ sender: Any) {
        if ValidatedField(campo1: valor1TextField.text!, campo2: valor2TextField.text!)
        {
            let valor1: Double = Double(valor1TextField.text!)!
            let valor2: Double = Double(valor2TextField.text!)!
                
            let resultado: Double = valor1 - valor2
                
            DisplayResult(val1: valor1,val2: valor2, operador: "-",resultado: resultado)
        }
    }
    @IBAction func btnMultiplicar(_ sender: Any) {
        if ValidatedField(campo1: valor1TextField.text!, campo2: valor2TextField.text!)
        {
            let valor1: Double = Double(valor1TextField.text!)!
            let valor2: Double = Double(valor2TextField.text!)!
            
            let resultado: Double = valor1 * valor2
            
            DisplayResult(val1: valor1,val2: valor2, operador: "x",resultado: resultado)
        }
    }
    @IBAction func btnDividir(_ sender: Any) {
        if ValidatedField(campo1: valor1TextField.text!, campo2: valor2TextField.text!)
        {
            let valor1: Double = Double(valor1TextField.text!)!
            let valor2: Double = Double(valor2TextField.text!)!
            
            if valor2 == 0
            {
                DisplayError(message: "No se puede dividir por cero")
            }
            else{
                let resultado: Double = valor1 / valor2
                DisplayResult(val1: valor1,val2: valor2, operador: "/",resultado: resultado)
            }
        }
    }

    //class func isOnlyNumbers(string: String) -> Bool {
    //    return NSPredicate(format: "SELF MATCHES %@", "\\d{10}").evaluateWithObject(string)
    //}
    
    func ValidatedField(campo1: String?, campo2: String?) -> Bool
    {
        guard let _ = campo1 else {
            DisplayError(message: "Valor 1 es nulo")
            return false
        }
        guard let _ = campo2 else {
            DisplayError(message: "Valor 2 es nulo")
            return false
        }
        if campo1!.isEmpty {
            DisplayError(message: "Valor 1 es vacio")
            return false
        }
        if campo2!.isEmpty {
            DisplayError(message: "Valor 2 es vacio")
            return false
        }
        guard let _ = Double(campo1!) else {
            DisplayError(message: "Valor 1 no es númerico")
            return false
        }
        guard let _ = Double(campo2!) else {
            DisplayError(message: "Valor 2 no es númerico")
            return false
        }
        return true
    }
    
    func DisplayError(message: String)
    {
        let alertController = UIAlertController(title: "Error", message: "\(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)

    }
    
    func DisplayResult(val1: Double, val2: Double, operador: String, resultado: Double)
    {
        let res = String(format: "%.2f", resultado)
        let alertController = UIAlertController(title: "Resultado", message: "\(val1) \(operador) \(val2) = \(res)", preferredStyle: .alert)
        //handler para llamar metodo cuando se da ok
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        //completion para llamar metodo cuando se presenta el alert
        present(alertController, animated: true, completion: nil)
    }
}

