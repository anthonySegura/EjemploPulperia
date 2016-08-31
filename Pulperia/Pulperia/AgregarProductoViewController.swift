//
//  AgregarProductoViewController.swift
//  Pulperia
//
//  Created by Anthony on 8/17/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class AgregarProductoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var precioTextField: UITextField!
    
    @IBOutlet weak var cantidadTextField: UITextField!
  
    @IBOutlet weak var descripcionTextField: UITextField!
    
    weak var delegate : ListaProductosTableViewController?
    
    
    @IBAction func cerrarVista(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func guardarProducto(sender: AnyObject){
        if validarDatos(){
            let precio : Int! = Int(self.precioTextField.text!)
            let cantidad : Int! = Int(self.cantidadTextField.text!)
            let producto = Producto(nombre : self.nombreTextField.text! , precio: precio , descripcion:  self.descripcionTextField.text! ,  cantidadDisponible: cantidad)
            self.delegate?.agregarProducto(producto)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        else{
            //Se crea la alerta
            let alert = UIAlertController(title: "Alerta", message: "Todos los campos son requeridos", preferredStyle: .Alert)

            let action = UIAlertAction(title: "ok", style: .Default){(action)-> Void in print("hola")
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    
    }
    
    
    func validarDatos() -> Bool {
        if self.cantidadTextField.text == "" || self.nombreTextField.text == "" || self.precioTextField.text == "" || self.descripcionTextField.text == "" {
            
            return false
        }
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.precioTextField.keyboardType = UIKeyboardType.DecimalPad
        self.cantidadTextField.keyboardType = UIKeyboardType.DecimalPad
        self.descripcionTextField.keyboardType = UIKeyboardType.Alphabet
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
