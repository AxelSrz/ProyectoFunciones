//
//  ViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 31/03/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //arreglos para almacenar los nombres de las variables y los valores de las constantes
    var nombres : [String: String] = ["variable1" : "var", "variable2" : "var2", "variable3" : "var3", "funcion" : "function", "varf1" : "f1", "varf2" : "f2", "result" : "result"]
    var valores : [String: Int] = ["constante1" : 5, "constante2" : 5, "constante3" : 5, "constante4" : 5]
    var referencias = [false, false]

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
    @IBOutlet var lbReturnResult: UILabel!
    @IBOutlet var lbReturnResult2: UILabel!
    @IBOutlet var lbResultVar3: UILabel!
    @IBOutlet var lbTotalVar3: UILabel!
    @IBOutlet var lbTotalVar2: UILabel!
    @IBOutlet var lbResultVar2: UILabel!
    @IBOutlet var lbTotalVar1: UILabel!
    @IBOutlet var lbResultVar1: UILabel!
    @IBOutlet var lbTotalF1: UILabel!
    @IBOutlet var lbTotalF2: UILabel!
    @IBOutlet var lbTotalResult: UILabel!
    @IBOutlet var lbResultF1: UILabel!
    @IBOutlet var lbResultF2: UILabel!
    @IBOutlet var lbResultResult: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //si se va a ajustes se actualizan las variables
        if segue.identifier == "Ajustes"{
            let viewAjustes = segue.destinationViewController as! SettingsViewController
            viewAjustes.nombres = nombres
            viewAjustes.valores = valores
            viewAjustes.referencias = referencias
        }
        //si se va a la simulacion se actualizan las variables
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
            viewSimulacion.result = nombres["result"]!
            viewSimulacion.funcion = nombres["funcion"]!
            viewSimulacion.referencias = referencias
        }
        //si va a la practica actualiza las variables
        else if segue.identifier == "practica"{
            let viewPractica = segue.destinationViewController as! PracticaViewController
            viewPractica.c1 = valores["constante1"]!
            viewPractica.c2 = valores["constante2"]!
            viewPractica.cf1 = valores["constante3"]!
            viewPractica.cf2 = valores["constante4"]!
            viewPractica.f1 = nombres["varf1"]!
            viewPractica.f2 = nombres["varf2"]!
            viewPractica.v1 = nombres["variable1"]!
            viewPractica.v2 = nombres["variable2"]!
            viewPractica.v3 = nombres["variable3"]!
            viewPractica.result = nombres["result"]!
            viewPractica.funcion = nombres["funcion"]!
            viewPractica.referencias = referencias
            viewPractica.nombres = self.nombres
            viewPractica.valores = self.valores
            viewPractica.referencias = self.referencias
        }
    }
    
    //si se presiona el boton calcular
    @IBAction func btCalcular(sender: UIButton) {
        var resultado: Int = 0
        var f1 : Int = 0
        var f2 : Int = 0
        
        f1 = valores["constante1"]! + valores["constante3"]!
        f2 = valores["constante2"]! + valores["constante4"]!
        resultado = f1 + f2
        lbResultVar3.text = String(resultado)
        if(referencias[1]){
            lbResultVar2.text = String(f2)
        }
        else{
            lbResultVar2.text = String(valores["constante2"]!)
        }
        if(referencias[0]){
            lbResultVar1.text = String(f1)
        }
        else{
            lbResultVar1.text = String(valores["constante1"]!)
        }
        lbResultF1.text = String(f1)
        lbResultF2.text = String(f2)
        lbResultResult.text = String(resultado)
    }
    
    //la informacion que se recibe de los ajustes se actualiza
    @IBAction func unwindAjustes(sender: UIStoryboardSegue) {
        lbFuncion.text = nombres["funcion"]!
        if(referencias[0]){
            lbVarFunc1.text = "&" + nombres["varf1"]!
        }
        else{
            lbVarFunc1.text = nombres["varf1"]!
        }
        if(referencias[1]){
            lbVarFunc2.text = "&" + nombres["varf2"]!
        }
        else{
            lbVarFunc2.text = nombres["varf2"]!
        }
        lbPrimeraAsignacionFuncion.text = "\(nombres["varf1"]!) = \(nombres["varf1"]!) + \(valores["constante3"]!);"
        lbSegundaAsignacionFuncion.text = "\(nombres["varf2"]!) = \(nombres["varf2"]!) + \(valores["constante4"]!);"
        lbResultadoFuncion.text = nombres["result"]! + " = \(nombres["varf1"]!) + \(nombres["varf2"]!);"
        lbVar1.text = nombres["variable1"]!
        lbVar2.text = nombres["variable2"]!
        lbVar3.text = nombres["variable3"]!
        lbPrimeraAsignacionMain.text = "\(nombres["variable1"]!) = \(valores["constante1"]!);"
        lbSegundaAsignacionMain.text = "\(nombres["variable2"]!) = \(valores["constante2"]!);"
        lbTerceraAsignacionMain.text = "\(nombres["variable3"]!) = "
        lbLlamadaAFuncion.text = nombres["funcion"]!
        lbParametrosFuncion.text = "(\(nombres["variable1"]!), \(nombres["variable2"]!));"
        lbReturnResult.text = nombres["result"]! + ";"
        lbReturnResult2.text = nombres["result"]! + ";"
        lbTotalVar3.text = nombres["variable3"]! + ":"
        lbTotalVar2.text = nombres["variable2"]! + ":"
        lbTotalVar1.text = nombres["variable1"]! + ":"
        lbTotalF1.text = nombres["varf1"]! + ":"
        lbTotalF2.text = nombres["varf2"]! + ":"
        lbTotalResult.text = nombres["result"]! + ":"
        
    }
    
    @IBAction func unwindSimulacion(sender: UIStoryboardSegue) {
    }
    
    @IBAction func unwindPractica(sender: UIStoryboardSegue) {
    }
    @IBAction func unwindInfo(sender: UIStoryboardSegue) {
    }

}

