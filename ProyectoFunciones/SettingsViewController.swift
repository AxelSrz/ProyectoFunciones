//
//  SettingsViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 02/04/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    //arreglos para los nombres de las variables y los valores de las constantes
    var nombres : [String: String] = [:]
    var valores : [String: Int] = [:]
    
    //variable que checa cual textfield esta activo
    var activeField = UITextField()

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
    @IBOutlet var fdResult: UITextField!
    @IBOutlet var btGuardar: UIButton!
    @IBOutlet var btCancelar: UIButton!
    @IBOutlet weak var btValores: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // se asignan los valores/nombres a las labels
        fdVar1.text = nombres["variable1"]!
        fdVar2.text = nombres["variable2"]!
        fdVar3.text = nombres["variable3"]!
        fdVarF1.text = nombres["varf1"]!
        fdVarF2.text = nombres["varf2"]!
        fdFuncion.text = nombres["funcion"]!
        fdResult.text = nombres["result"]!
        fdCons1.text = String(valores["constante1"]!)
        fdCons2.text = String(valores["constante2"]!)
        fdCons3.text = String(valores["constante3"]!)
        fdCons4.text = String(valores["constante4"]!)
        
        //para quitar el teclado con un tap
        let tap = UITapGestureRecognizer(target: self, action: "quitaTeclado")
        view.addGestureRecognizer(tap)
        
        //las labels con constantes se les cambian el tipo de pad
        fdCons1.delegate = self
        fdCons1.keyboardType = .NumberPad
        fdCons2.delegate = self
        fdCons2.keyboardType = .NumberPad
        fdCons3.delegate = self
        fdCons3.keyboardType = .NumberPad
        fdCons4.delegate = self
        fdCons4.keyboardType = .NumberPad
        
        //se quita el autocorrect a los textfields de las variables
        fdVar1.autocorrectionType = .No
        fdVar1.autocapitalizationType = .None
        fdVar1.spellCheckingType = .No
        fdVar2.autocorrectionType = .No
        fdVar2.autocapitalizationType = .None
        fdVar2.spellCheckingType = .No
        fdVar3.autocorrectionType = .No
        fdVar3.autocapitalizationType = .None
        fdVar3.spellCheckingType = .No
        fdVarF1.autocorrectionType = .No
        fdVarF1.autocapitalizationType = .None
        fdVarF1.spellCheckingType = .No
        fdVarF2.autocorrectionType = .No
        fdVarF2.autocapitalizationType = .None
        fdVarF2.spellCheckingType = .No
        fdFuncion.autocorrectionType = .No
        fdFuncion.autocapitalizationType = .None
        fdFuncion.spellCheckingType = .No
        fdResult.autocorrectionType = .No
        fdResult.autocapitalizationType = .None
        fdResult.spellCheckingType = .No
        
        //para cuando el teclado aparezca y no quiero que tape el texto de var2 o var3
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingsViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingsViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
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
    
    //funcion para quitar el teclado
    func quitaTeclado(){
        view.endEditing(true)
    }

    //si se oprime generar valores
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
    
    //funcion que mueve el view arriba del teclado si var2 o var3 se estan modificando
    func keyboardWillShow(sender: NSNotification) {
        
        if(fdCons2.editing || fdFuncion.editing)
        {
            self.view.frame.origin.y = -150
        }
        
    }
    
    //funcion que regresa el view como estaba una vez que se quita el teclado
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //al presionar guardar se actualizan los nuevos valores/nombres en los arreglos y se asignan a las labels
        if sender as! UIButton == btGuardar{
            let viewInicial : ViewController = segue.destinationViewController as! ViewController
            
            nombres["variable1"] = fdVar1.text!
            nombres["variable2"] = fdVar2.text!
            nombres["variable3"] = fdVar3.text!
            nombres["varf1"] = fdVarF1.text!
            nombres["varf2"] = fdVarF2.text!
            nombres["funcion"] = fdFuncion.text!
            nombres["result"] = fdResult.text!
            valores["constante1"] = Int(fdCons1.text!)
            valores["constante2"] = Int(fdCons2.text!)
            valores["constante3"] = Int(fdCons3.text!)
            valores["constante4"] = Int(fdCons4.text!)
            
            viewInicial.lbResultVar3.text = ""
            viewInicial.lbResultVar2.text = ""
            viewInicial.lbResultVar1.text = ""
            viewInicial.lbResultF1.text = ""
            viewInicial.lbResultF2.text = ""
            viewInicial.lbResultResult.text = ""
            viewInicial.nombres = nombres
            viewInicial.valores = valores
        }
        
    }

}
