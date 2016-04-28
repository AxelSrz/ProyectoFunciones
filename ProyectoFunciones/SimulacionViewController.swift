//
//  SimulacionViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 12/04/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class SimulacionViewController: UIViewController {
    //variable que guia la simulacion
    var instruccion = 0
    
    //variables para ir siguiendo los datos de la funcion/main
    var c1 = 0, c2 = 0, cf1 = 0, cf2 = 0
    var f1 = "", f2 = "", v1 = "", v2 = "", v3 = "", funcion = "", result = ""
    var newHighlight: CGRect?

    @IBOutlet var lb01: UILabel!
    @IBOutlet var lb02: UILabel!
    @IBOutlet var lb1: UILabel!
    @IBOutlet var lb2: UILabel!
    @IBOutlet var lb31: UILabel!
    @IBOutlet var lb32: UILabel!
    @IBOutlet var lb41: UILabel!
    @IBOutlet var lb42: UILabel!
    @IBOutlet var lb5: UILabel!
    @IBOutlet var lb6: UILabel!
    @IBOutlet var lb7: UILabel!
    @IBOutlet var lb81: UILabel!
    @IBOutlet var lb82: UILabel!
    @IBOutlet var lb1101: UILabel!
    @IBOutlet var lb1102: UILabel!
    
    @IBOutlet var lbVar1Value: UILabel!
    @IBOutlet var lbVar2Value: UILabel!
    @IBOutlet var lbVar3Value: UILabel!
    @IBOutlet var lbF1Value: UILabel!
    @IBOutlet var lbF2Value: UILabel!
    @IBOutlet var lbResultValue: UILabel!
    @IBOutlet weak var lbNf1: UILabel!
    @IBOutlet weak var lbNf2: UILabel!
    
    @IBOutlet weak var lbNvar: UILabel!
    @IBOutlet weak var lbNvar2: UILabel!
    @IBOutlet weak var lbNvar3: UILabel!
    @IBOutlet weak var lbNfunc1: UILabel!
    @IBOutlet weak var lbNfunc2: UILabel!
    @IBOutlet weak var lbNresult: UILabel!
    @IBOutlet weak var lb91: UILabel!
    @IBOutlet weak var lb92: UILabel!
    @IBOutlet weak var lb93: UILabel!
    @IBOutlet weak var lb10: UILabel!
    @IBOutlet weak var lb101: UILabel!
    @IBOutlet var bgImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //se asignan los datos de las labels
        bgImg.image = UIImage(named: "color")
        lbNf1.text = f1
        lbNf2.text = f2
        lbNvar.text = v1
        lbNvar2.text = v2
        lbNvar3.text = v3
        lbNresult.text = result
        lb1.text = v1 + " = " + String(c1) + ";"
        lb2.text = v2 + " = " + String(c2) + ";"
        lb31.text = v3 + " = "
        lb32.text = " (" + v1 + ", " + v2 + ");"
        lb42.text = result + ";"
        lb5.text = f1 + " = " + f1 + " + " + String(cf1) + ";"
        lb6.text = f2 + " = " + f2 + " + " + String(cf2) + ";"
        lb7.text = result + " = " + f1 + " + " + f2 + ";"
        lb82.text = result + ";"
        lb91.text = v1
        lb92.text = v2
        lb93.text = v3
        lb10.text = f1
        lb101.text = f2
        lbNfunc1.text = funcion
        lbNfunc2.text = funcion
        
        //se ocultan las variables que no ha simulado
        lbNf1.hidden = true
        lbNf2.hidden = true
        lbNvar.hidden = true
        lbNvar2.hidden = true
        lbNvar3.hidden = true
        lbNresult.hidden = true
        lbF1Value.hidden = true
        lbF2Value.hidden = true
        lbVar1Value.hidden = true
        lbVar2Value.hidden = true
        lbVar3Value.hidden = true
        lbResultValue.hidden = true
        
        ejecutaInstruccion()
    }
    
    override func viewDidLayoutSubviews() {
        //se actualiza la imagen que sera el highlight
        if let highlight = newHighlight {
            bgImg.frame = highlight
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //si se presiona next la simulacion avanza una vez
    @IBAction func btSiguiente(sender: UIButton) {
        if instruccion < 10{
            instruccion += 1
        }
        ejecutaInstruccion()
    }
    
    //si se presiona back la simulacion se regresa una vez
    @IBAction func btAnterior(sender: UIButton) {
        if instruccion > 0{
            instruccion -= 1
        }
        ejecutaInstruccion()
    }
    
    //funcion que controla la simulacion y las variables que se van modificando en cada paso
    func ejecutaInstruccion() {
        switch instruccion {
            case 0:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)
                    }, completion: { finished in
                        self.lbNf1.hidden = true
                        self.lbNf2.hidden = true
                        self.lbNvar.hidden = true
                        self.lbNvar2.hidden = true
                        self.lbNvar3.hidden = true
                        self.lbNresult.hidden = true
                        self.lbF1Value.hidden = true
                        self.lbF2Value.hidden = true
                        self.lbVar1Value.hidden = true
                        self.lbVar2Value.hidden = true
                        self.lbVar3Value.hidden = true
                        self.lbResultValue.hidden = true
                        self.newHighlight = CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)
                        self.bgImg.frame = self.newHighlight!
                })
            case 1:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = /*CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)*/CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.hidden = false
                        self.lbVar2Value.hidden = false
                        self.lbVar3Value.hidden = false
                        self.lbNvar.hidden = false
                        self.lbNvar2.hidden = false
                        self.lbNvar3.hidden = false
                        self.lbNf1.hidden = true
                        self.lbNf2.hidden = true
                        self.lbNresult.hidden = true
                        self.lbF1Value.hidden = true
                        self.lbF2Value.hidden = true
                        self.lbResultValue.hidden = true

                        self.lbVar1Value.text = "-"
                        self.lbVar2Value.text = "-"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        //self.newHighlight = CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)
                        self.newHighlight = CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })

            case 2:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "-"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        //self.newHighlight = CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                        self.newHighlight = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 3:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)

                    }, completion: { finished in
                        self.lbResultValue.hidden = true
                        self.lbF1Value.hidden = true
                        self.lbF2Value.hidden = true
                        self.lbNf2.hidden = true
                        self.lbNf1.hidden = true
                        self.lbNresult.hidden = true
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        //self.newHighlight = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                        self.newHighlight = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 4:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)

                    }, completion: { finished in
                        self.lbResultValue.hidden = true
                        self.lbF1Value.hidden = false
                        self.lbF2Value.hidden = false
                        self.lbNf2.hidden = false
                        self.lbNf1.hidden = false
                        self.lbNresult.hidden = true
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = "\(self.c1)"
                        self.lbF2Value.text = "\(self.c2)"
                        self.lbResultValue.text = "-"
                        //self.newHighlight = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)
                        self.newHighlight = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 5:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)

                    }, completion: { finished in
                        self.lbResultValue.hidden = false
                        self.lbF1Value.hidden = false
                        self.lbF2Value.hidden = false
                        self.lbNf2.hidden = false
                        self.lbNf1.hidden = false
                        self.lbNresult.hidden = false
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = "\(self.c1)"
                        self.lbF2Value.text = "\(self.c2)"
                        self.lbResultValue.text = "-"
                        //self.newHighlight = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)
                        self.newHighlight = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 6:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)

                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2)"
                        self.lbResultValue.text = "-"
                        //self.newHighlight = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)
                        self.newHighlight = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 7:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)

                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "-"
                        //self.newHighlight = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)
                        self.newHighlight = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 8:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    //self.bgImg.frame = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)
                    self.bgImg.frame = CGRectMake(self.lb81.frame.origin.x,self.lb81.frame.origin.y,self.lb82.frame.origin.x + self.lb82.frame.width - self.lb81.frame.origin.x,self.lb81.frame.height)

                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "-"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        //self.newHighlight = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)
                        self.newHighlight = CGRectMake(self.lb81.frame.origin.x,self.lb81.frame.origin.y,self.lb82.frame.origin.x + self.lb82.frame.width - self.lb81.frame.origin.x,self.lb81.frame.height)

                        self.bgImg.frame = self.newHighlight!
                        })
            case 9:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb1101.frame.origin.x,self.lb1101.frame.origin.y,self.lb1102.frame.origin.x + self.lb1102.frame.width - self.lb1101.frame.origin.x,self.lb1101.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        self.newHighlight = CGRectMake(self.lb1101.frame.origin.x,self.lb1101.frame.origin.y,self.lb1102.frame.origin.x + self.lb1102.frame.width - self.lb1101.frame.origin.x,self.lb1101.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            
            default: break
        }
    }
    
    //funcion que cambia el tamaño del highlight al avanzar/retroceder
    func imageResize(image image:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
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
