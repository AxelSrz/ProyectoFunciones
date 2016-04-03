//
//  ViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 31/03/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nombres : [String: String] = ["variable1" : "var", "variable2" : "var2", "variable3" : "var3", "funcion" : "funcion", "varf1" : "f1", "varf2" : "f2"]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Ajustes"{
            let viewAjustes = segue.destinationViewController as! SettingsViewController
            viewAjustes.nombres = nombres
            viewAjustes.valores = valores
        }
    }
    
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
        lbTerceraAsignacionMain.text = "\(nombres["variable3"]!) = ;"
        lbLlamadaAFuncion.text = nombres["funcion"]!
        lbParametrosFuncion.text = "(\(nombres["variable1"]!), \(nombres["variable1"]!));"
    }


}

