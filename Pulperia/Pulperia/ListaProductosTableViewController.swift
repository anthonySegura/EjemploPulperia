//
//  ListaProductosTableViewController.swift
//  Pulperia
//
//  Created by Anthony on 8/17/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class ListaProductosTableViewController: UITableViewController {
    
    var listaProductos = [Producto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Productos"
        
        let producto1 = Producto(nombre: "Café", precio: 500, descripcion: "Café grano entero", cantidadDisponible: 8)
        let producto2 = Producto(nombre: "Azúcar", precio: 240, descripcion: "Azúcar morena", cantidadDisponible: 5)
        let producto3 = Producto(nombre: "Arroz", precio: 700, descripcion: "90% grano entero", cantidadDisponible: 11)
        let producto4 = Producto(nombre: "Frijoles", precio: 550, descripcion: "Frijoles rojos", cantidadDisponible: 2)
        let producto5 = Producto(nombre: "Leche", precio: 825, descripcion: "Leche semidescremada", cantidadDisponible: 17)
        
        listaProductos.append(producto1)
        listaProductos.append(producto2)
        listaProductos.append(producto3)
        listaProductos.append(producto4)
        listaProductos.append(producto5)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "agregarProductoSegue" {
            //Se captura la vista siguiente al presionar el boton de + y se le asigna esta vista al delegate de la siguiente.
            let vistaDestino = segue.destinationViewController as! AgregarProductoViewController
            vistaDestino.delegate = self
        }
    }
    
    //MARK: - Manejo de datos
    
    func agregarProducto(nuevoProducto : Producto){
        listaProductos.append(nuevoProducto)
        //Se usa el self porque esta clase esta asociada con el tableView
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listaProductos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productoCell", forIndexPath: indexPath)
        
        let producto = listaProductos[indexPath.row]
        
        cell.textLabel?.text = producto.nombre
        cell.detailTextLabel?.text = String(producto.precio)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Referencia al storyboard
        let storyboard = UIStoryboard(name: "Main", bundle : nil)
        //Referencia a la vista a la que se va a acceder
        let vista = storyboard.instantiateViewControllerWithIdentifier("MostrarProductoViewController") as! MostrarProductoViewController
        vista.producto = self.listaProductos[indexPath.row]
        //Se muestra la vista
        self.navigationController?.pushViewController(vista, animated: true)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
