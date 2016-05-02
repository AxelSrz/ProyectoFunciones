//
//  PracticaViewController.swift
//  ProyectoFunciones
//
//  Created by Cesar de la Barreda on 5/2/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class PracticaViewController: UIViewController, UITextFieldDelegate {

    //arreglos para almacenar los nombres de las variables y los valores de las constantes
    var c1 = 0, c2 = 0, cf1 = 0, cf2 = 0
    var f1 = "", f2 = "", v1 = "", v2 = "", v3 = "", funcion = "", result = ""
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
    @IBOutlet var lbTotalVar3: UILabel!
    @IBOutlet var lbTotalVar2: UILabel!
    @IBOutlet var lbTotalVar1: UILabel!
    @IBOutlet var lbTotalF1: UILabel!
    @IBOutlet var lbTotalF2: UILabel!
    @IBOutlet var lbTotalResult: UILabel!
    
    @IBOutlet weak var tfF1: UITextField!
    @IBOutlet weak var tfF2: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var tfVar3: UITextField!
    @IBOutlet weak var tfVar2: UITextField!
    @IBOutlet weak var tfVar1: UITextField!
    
    @IBOutlet weak var lbResF1: UILabel!
    @IBOutlet weak var lbResF2: UILabel!
    @IBOutlet weak var lbResResult: UILabel!
    @IBOutlet weak var lbResVar3: UILabel!
    @IBOutlet weak var lbResVar2: UILabel!
    @IBOutlet weak var lbResVar1: UILabel!
    
    @IBOutlet weak var btSimulacion: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //se asignan los datos de las labels
        lbTotalF1.text = f1
        lbTotalF2.text = f2
        lbTotalVar1.text = v1
        lbTotalVar2.text = v2
        lbTotalVar3.text = v3
        lbTotalResult.text = result
        lbPrimeraAsignacionMain.text = v1 + " = " + String(c1) + ";"
        lbSegundaAsignacionMain.text = v2 + " = " + String(c2) + ";"
        lbTerceraAsignacionMain.text = v3 + " = "
        lbParametrosFuncion.text = " (" + v1 + ", " + v2 + ");"
        lbReturnResult2.text = result + ";"
        lbPrimeraAsignacionFuncion.text = f1 + " = " + f1 + " + " + String(cf1) + ";"
        lbSegundaAsignacionFuncion.text = f2 + " = " + f2 + " + " + String(cf2) + ";"
        lbResultadoFuncion.text = result + " = " + f1 + " + " + f2 + ";"
        lbReturnResult.text = result + ";"
        lbVar1.text = v1
        lbVar2.text = v2
        lbVar3.text = v3
        if(referencias[0]){
            lbVarFunc1.text = "&" + f1
        }
        else{
            lbVarFunc1.text = f1
        }
        
        if(referencias[1]){
            lbVarFunc2.text = "&" + f2
        }
        else{
            lbVarFunc2.text = f2
        }
        lbFuncion.text = funcion
        lbLlamadaAFuncion.text = funcion
        
        btSimulacion.hidden = true
        
        //las labels con constantes se les cambian el tipo de pad
        tfF1.delegate = self
        tfF1.keyboardType = .NumberPad
        tfF2.delegate = self
        tfF2.keyboardType = .NumberPad
        tfResult.delegate = self
        tfResult.keyboardType = .NumberPad
        tfVar3.delegate = self
        tfVar3.keyboardType = .NumberPad
        tfVar2.delegate = self
        tfVar2.keyboardType = .NumberPad
        tfVar1.delegate = self
        tfVar1.keyboardType = .NumberPad

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            //si se va a la simulacion se actualizan las variables
        if segue.identifier == "simulacion"{
            btSimulacion.hidden = true
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
    }
    
    //funcion que revisa que haya solo numeros en los text fields de las constantes
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    //si se presiona el boton calcular
    @IBAction func btChecar(sender: UIButton) {
        btSimulacion.hidden = false
        var resultado: Int = 0
        var f1 : Int = 0
        var f2 : Int = 0
        
        f1 = valores["constante1"]! + valores["constante3"]!
        f2 = valores["constante2"]! + valores["constante4"]!
        resultado = f1 + f2
        if(tfVar3.text == String(resultado)){
            lbResVar3.text = "Correcto"
            lbResVar3.textColor = UIColor.greenColor()
        }
        else {
            lbResVar3.text = "Incorrecto"
            lbResVar3.textColor = UIColor.redColor()
        }
        if(referencias[1]){
            if(tfVar2.text == String(f2)){
                lbResVar2.text = "Correcto"
                lbResVar2.textColor = UIColor.greenColor()
            }
            else {
                lbResVar2.text = "Incorrecto"
                lbResVar2.textColor = UIColor.redColor()
            }
        }
        else{
            if(tfVar2.text == String(valores["constante2"]!)){
                lbResVar2.text = "Correcto"
                lbResVar2.textColor = UIColor.greenColor()
            }
            else {
                lbResVar2.text = "Incorrecto"
                lbResVar2.textColor = UIColor.redColor()
            }
        }
        if(referencias[0]){
            if(tfVar1.text == String(f1)){
                lbResVar1.text = "Correcto"
                lbResVar1.textColor = UIColor.greenColor()
            }
            else {
                lbResVar1.text = "Incorrecto"
                lbResVar1.textColor = UIColor.redColor()
            }
        }
        else{
            if(tfVar1.text == String(valores["constante1"]!)){
                lbResVar1.text = "Correcto"
                lbResVar1.textColor = UIColor.greenColor()
            }
            else {
                lbResVar1.text = "Incorrecto"
                lbResVar1.textColor = UIColor.redColor()
            }
        }
        if(tfF1.text == String(f1)){
            lbResF1.text = "Correcto"
            lbResF1.textColor = UIColor.greenColor()
        }
        else {
            lbResF1.text = "Incorrecto"
            lbResF1.textColor = UIColor.redColor()
        }
        if(tfF2.text == String(f2)){
            lbResF2.text = "Correcto"
            lbResF2.textColor = UIColor.greenColor()
        }
        else {
            lbResF2.text = "Incorrecto"
            lbResF2.textColor = UIColor.redColor()
        }
        if(tfResult.text == String(resultado)){
            lbResResult.text = "Correcto"
            lbResResult.textColor = UIColor.greenColor()
        }
        else {
            lbResResult.text = "Incorrecto"
            lbResResult.textColor = UIColor.redColor()
        }
    }


    @IBAction func unwindSimulacion(sender: UIStoryboardSegue) {
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
