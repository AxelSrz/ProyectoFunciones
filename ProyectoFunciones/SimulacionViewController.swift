//
//  SimulacionViewController.swift
//  ProyectoFunciones
//
//  Created by Axel Suarez on 12/04/16.
//  Copyright © 2016 Axel Suarez. All rights reserved.
//

import UIKit

class SimulacionViewController: UIViewController {
    var instruccion = 0
    var c1 = 0, c2 = 0, cf1 = 0, cf2 = 0
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
    
    @IBOutlet var lbVar1Value: UILabel!
    @IBOutlet var lbVar2Value: UILabel!
    @IBOutlet var lbVar3Value: UILabel!
    @IBOutlet var lbF1Value: UILabel!
    @IBOutlet var lbF2Value: UILabel!
    @IBOutlet var lbResultValue: UILabel!
    
    @IBOutlet var bgImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bgImg.image = UIImage(named: "color")
    }
    
    override func viewDidLayoutSubviews() {
        if let highlight = newHighlight {
            bgImg.frame = highlight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btSiguiente(sender: UIButton) {
        if instruccion < 8{
            instruccion += 1
        }
        ejecutaInstruccion()
    }
    @IBAction func btAnterior(sender: UIButton) {
        if instruccion > 0{
            instruccion -= 1
        }
        ejecutaInstruccion()
    }
    func ejecutaInstruccion() {
        switch instruccion {
            case 0:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "nil"
                        self.lbVar2Value.text = "nil"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        self.newHighlight = CGRectMake(self.lb01.frame.origin.x,self.lb01.frame.origin.y,self.lb02.frame.origin.x + self.lb02.frame.width - self.lb01.frame.origin.x,self.lb01.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })

            case 1:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "nil"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        self.newHighlight = CGRectMake(self.lb1.frame.origin.x,self.lb1.frame.origin.y,self.lb1.frame.width,self.lb1.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 2:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        self.newHighlight = CGRectMake(self.lb2.frame.origin.x,self.lb2.frame.origin.y,self.lb2.frame.width,self.lb2.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 3:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = ""
                        self.lbF2Value.text = ""
                        self.lbResultValue.text = ""
                        self.newHighlight = CGRectMake(self.lb31.frame.origin.x,self.lb31.frame.origin.y,self.lb32.frame.origin.x + self.lb32.frame.width - self.lb31.frame.origin.x,self.lb31.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 4:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = "\(self.c1)"
                        self.lbF2Value.text = "\(self.c2)"
                        self.lbResultValue.text = "nil"
                        self.newHighlight = CGRectMake(self.lb41.frame.origin.x,self.lb41.frame.origin.y,self.lb42.frame.origin.x + self.lb42.frame.width - self.lb41.frame.origin.x,self.lb41.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 5:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2)"
                        self.lbResultValue.text = "nil"
                        self.newHighlight = CGRectMake(self.lb5.frame.origin.x,self.lb5.frame.origin.y,self.lb5.frame.width,self.lb5.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 6:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "nil"
                        self.newHighlight = CGRectMake(self.lb6.frame.origin.x,self.lb6.frame.origin.y,self.lb6.frame.width,self.lb6.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 7:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "nil"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        self.newHighlight = CGRectMake(self.lb7.frame.origin.x,self.lb7.frame.origin.y,self.lb7.frame.width,self.lb7.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            case 8:
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveLinear, animations: {
                    self.bgImg.frame = CGRectMake(self.lb81.frame.origin.x,self.lb81.frame.origin.y,self.lb82.frame.origin.x + self.lb82.frame.width - self.lb81.frame.origin.x,self.lb81.frame.height)
                    }, completion: { finished in
                        self.lbVar1Value.text = "\(self.c1)"
                        self.lbVar2Value.text = "\(self.c2)"
                        self.lbVar3Value.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        self.lbF1Value.text = "\(self.c1 + self.cf1)"
                        self.lbF2Value.text = "\(self.c2 + self.cf2)"
                        self.lbResultValue.text = "\(self.c1 + self.cf1 + self.c2 + self.cf2)"
                        self.newHighlight = CGRectMake(self.lb81.frame.origin.x,self.lb81.frame.origin.y,self.lb82.frame.origin.x + self.lb82.frame.width - self.lb81.frame.origin.x,self.lb81.frame.height)
                        self.bgImg.frame = self.newHighlight!
                        })
            
            default: break
        }
    }
    
    
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