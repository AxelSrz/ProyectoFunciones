//
//  ViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 31/03/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //declaracion de variables donde se van a almacenar los valores de las constantes y los strings de las variables
    
    var nombres : [String: String] = ["variable1" : "var", "variable2" : "var2", "variable3" : "var3", "funcion" : "function", "varf1" : "f1", "varf2" : "f2"]
    var valores : [String: Int] = ["constante1" : 5, "constante2" : 5, "constante3" : 5, "constante4" : 5]

    @IBOutlet var lbFuncion: UILabel!
    @IBOutlet var lbVarFunc1: UILabel!
    @IBOutlet var lbVarFunc2: UILabel!
    @IBOutlet var lbPrimeraAsignacionFuncion: UILabel!
    @IBOutlet var lbSegundaAsignacionFuncion: UILabel!
    @IBOutlet var lbResultadoFuncion: UILabel!
    @IBOutlet var lbVar1: UILabel!
    @IBOutlet var lbVar2: UILabel!
    @IBOutlet var lbVar3: UILabel!
    @IBOutlet var lbPrimeraAsignacionMain: UILabel!
    @IBOutlet var lbSegundaAsignacionMain: UILabel!
    @IBOutlet var lbTerceraAsignacionMain: UILabel!
    @IBOutlet var lbLlamadaAFuncion: UILabel!
    @IBOutlet var lbParametrosFuncion: UILabel!
    @IBOutlet weak var lbResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //si se va a ajustes mandamos los nombres y valores de las variables
        if segue.identifier == "Ajustes"{
            let viewAjustes = segue.destinationViewController as! SettingsViewController
            viewAjustes.nombres = nombres
            viewAjustes.valores = valores
        }
        //si se va a la simulacion mandamos los nombres y valores de las variables para que se aparezcan tambien en esa vista
        else if segue.identifier == "simulacion"{
            let viewSimulacion = segue.destinationViewController as! SimulacionViewController
            viewSimulacion.c1 = valores["constante1"]!
            viewSimulacion.c2 = valores["constante2"]!
            viewSimulacion.cf1 = valores["constante3"]!
            viewSimulacion.cf2 = valores["constante4"]!
            viewSimulacion.f1 = nombres["varf1"]!
            viewSimulacion.f2 = nombres["varf2"]!
            viewSimulacion.v1 = nombres["variable1"]!
            viewSimulacion.v2 = nombres["variable2"]!
            viewSimulacion.v3 = nombres["variable3"]!
            viewSimulacion.funcion = nombres["funcion"]!
        }
    }
    
    //si se oprime calcular
    @IBAction func btCalcular(sender: UIButton) {
        var resultado: Int = 0
        var f1 : Int = 0
        var f2 : Int = 0
        
        f1 = valores["constante1"]! + valores["constante3"]!
        f2 = valores["constante2"]! + valores["constante4"]!
        resultado = f1 + f2
        lbResultado.text = String(resultado)
    }
    
    //se reciben los nombres y valores de las variables si cambiaron y se asignan a sus labels correspondientes
    @IBAction func unwindAjustes(sender: UIStoryboardSegue) {
        lbFuncion.text = nombres["funcion"]!
        lbVarFunc1.text = nombres["varf1"]!
        lbVarFunc2.text = nombres["varf2"]!
        lbPrimeraAsignacionFuncion.text = "\(nombres["varf1"]!) = \(nombres["varf1"]!) + \(valores["constante3"]!);"
        lbSegundaAsignacionFuncion.text = "\(nombres["varf2"]!) = \(nombres["varf2"]!) + \(valores["constante4"]!);"
        lbResultadoFuncion.text = "result = \(nombres["varf1"]!) + \(nombres["varf2"]!);"
        lbVar1.text = nombres["variable1"]!
        lbVar2.text = nombres["variable2"]!
        lbVar3.text = nombres["variable3"]!
        lbPrimeraAsignacionMain.text = "\(nombres["variable1"]!) = \(valores["constante1"]!);"
        lbSegundaAsignacionMain.text = "\(nombres["variable2"]!) = \(valores["constante2"]!);"
        lbTerceraAsignacionMain.text = "\(nombres["variable3"]!) = "
        lbLlamadaAFuncion.text = nombres["funcion"]!
        lbParametrosFuncion.text = "(\(nombres["variable1"]!), \(nombres["variable2"]!));"
    }
    
    @IBAction func unwindSimulacion(sender: UIStoryboardSegue) {
    }


}

