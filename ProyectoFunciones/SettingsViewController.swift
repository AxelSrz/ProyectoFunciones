//
//  SettingsViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 02/04/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    var nombres : [String: String] = [:]
    var valores : [String: Int] = [:]

    @IBOutlet var fdVar1: UITextField!
    @IBOutlet var fdVar2: UITextField!
    @IBOutlet var fdVar3: UITextField!
    @IBOutlet var fdVarF1: UITextField!
    @IBOutlet var fdVarF2: UITextField!
    @IBOutlet var fdCons1: UITextField!
    @IBOutlet var fdCons2: UITextField!
    @IBOutlet var fdCons3: UITextField!
    @IBOutlet var fdCons4: UITextField!
    @IBOutlet var fdFuncion: UITextField!
    @IBOutlet var btGuardar: UIButton!
    @IBOutlet var btCancelar: UIButton!
    @IBOutlet weak var btValores: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fdVar1.text = nombres["variable1"]!
        fdVar2.text = nombres["variable2"]!
        fdVar3.text = nombres["variable3"]!
        fdVarF1.text = nombres["varf1"]!
        fdVarF2.text = nombres["varf2"]!
        fdFuncion.text = nombres["funcion"]!
        fdCons1.text = String(valores["constante1"]!)
        fdCons2.text = String(valores["constante2"]!)
        fdCons3.text = String(valores["constante3"]!)
        fdCons4.text = String(valores["constante4"]!)
        
        let tap = UITapGestureRecognizer(target: self, action: "quitaTeclado")
        view.addGestureRecognizer(tap)
        
        fdCons1.delegate = self
        fdCons1.keyboardType = .NumberPad
        fdCons2.delegate = self
        fdCons2.keyboardType = .NumberPad
        fdCons3.delegate = self
        fdCons3.keyboardType = .NumberPad
        fdCons4.delegate = self
        fdCons4.keyboardType = .NumberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //funcion que revisa que haya solo numeros en los text fields de las constantes
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    func quitaTeclado(){
        view.endEditing(true)
    }

    @IBAction func cambiarValores(sender: UIButton) {
        
        //asigna valores generados random del 0 al 20
        
        valores["constante1"] = Int(arc4random_uniform(21))
        valores["constante2"] = Int(arc4random_uniform(21))
        valores["constante3"] = Int(arc4random_uniform(21))
        valores["constante4"] = Int(arc4random_uniform(21))
        
        fdCons1.text = String(valores["constante1"]!)
        fdCons2.text = String(valores["constante2"]!)
        fdCons3.text = String(valores["constante3"]!)
        fdCons4.text = String(valores["constante4"]!)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as! UIButton == btGuardar{
            let viewInicial : ViewController = segue.destinationViewController as! ViewController
            
            nombres["variable1"] = fdVar1.text!
            nombres["variable2"] = fdVar2.text!
            nombres["variable3"] = fdVar3.text!
            nombres["varf1"] = fdVarF1.text!
            nombres["varf2"] = fdVarF2.text!
            nombres["funcion"] = fdFuncion.text!
            valores["constante1"] = Int(fdCons1.text!)
            valores["constante2"] = Int(fdCons2.text!)
            valores["constante3"] = Int(fdCons3.text!)
            valores["constante4"] = Int(fdCons4.text!)
            
            viewInicial.lbResultado.text = ""
            viewInicial.nombres = nombres
            viewInicial.valores = valores
        }
        
    }

}
