//Codigo realizado por Victor y Adrian
//Grupo 04 MPOO
//Proyecto de Carro de Compras
//Vista del catálogo

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var Productos = [Producto]() //Creamos una variable que recibe un arreglo conteniendo a la estructura producto
    var Compras = [Producto]() //Creamos una variable que recibe un arreglo conteniendo a la estructura producto
    @IBOutlet weak var tablita: UITableView! //Permite la vista de la tabla al ser un Outlet
    @IBAction func compras(_ sender: UIButton){ } //Lleva a cabo la acción para mandar el arreglo
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
        //Agregamos los productos basados en una estructura que nosotros creamos.
    Productos.append(Producto(nombre: "Manzana", precio: 56, desc: " Buen sabor ", imagen: "manzana", cantidad: 0))
    Productos.append(Producto(nombre: "iPod", precio: 409.5, desc: "Buen Producto", imagen: "ipod", cantidad: 0))
    Productos.append(Producto(nombre: "Patineta", precio: 89.5, desc: "Buena Lija", imagen: "patineta", cantidad: 0))
    Productos.append(Producto(nombre: "Carro de juguete", precio: 69.5, desc: "Buen Producto", imagen: "carro", cantidad: 0))
    Productos.append(Producto(nombre: "Lego", precio: 39.5, desc: "Buen Producto", imagen: "lego", cantidad: 0))
    Productos.append(Producto(nombre: "Avion lego", precio: 29.5, desc: "Buen Producto", imagen: "avion", cantidad: 0))
    Productos.append(Producto(nombre: "Cereal Zucaritas", precio: 49.5, desc: "Buen Sabor", imagen: "cerealz", cantidad: 0))
    Productos.append(Producto(nombre: "Cereal FruitLoops", precio: 49.5, desc: "Buen Sabor", imagen: "cerealf", cantidad: 0))
    Productos.append(Producto(nombre: "iPhone XS", precio: 4567.5, desc: "Buen Producto Caro pero Bueno", imagen: "iphone", cantidad: 0))
    }
    
    //Pintamos las celdas de acuerdo a los productos que ingresamos.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Productos.count
    }
    
    //Le damos formato y propiedades a la celda.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Constante creada para darle formato a la celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        //Condicional para pintar los renglones(celdas)
        if indexPath.row % 2 == 0
        {
        cell.backgroundColor = UIColor(red: 2.0, green: 2.3, blue: 0.5, alpha: 0.8)
        }
        else
        {
        cell.backgroundColor = UIColor(red: 2.0, green: 2.3, blue: 0.5, alpha: 0.5)
        }
        
        //Ponemos en nombre del producto en el renglon(celda)
        cell.textLabel?.text = "\(Productos[indexPath.row].nombre)"
        
        //Finalmente regresamos la celda personalizada.
        return cell
    }

    //Le damos la acción de eliminar un objeto del catálogo
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")
        {(action, sourceview, completion) in
            
            self.Productos.remove(at: indexPath.row)
            self.tablita.deleteRows(at: [indexPath], with: .fade )
            completion(true)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
   // Unwind Segues
    //Obtenemos los datos de la segunda 
    @IBAction func unwind(_ segue: UIStoryboardSegue)
    {
        if let origin = segue.source as? SecondViewController
        {
            let data = origin.fromFirstView
            //Recibimos datos tipo Producto
            Compras.append(data!)
            //Agregamos datos a un nuevo arreglo
            print(Compras)
            self.tablita.reloadData()
        }
    }
    
    //Preparamos la vista de cada producto a travez del segue, se le manda la informacion de la celda tocada
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView"
        {
            
            let indexPath = tablita.indexPathForSelectedRow
            let destination = segue.destination as! SecondViewController
            destination.fromFirstView = Productos[(indexPath?.row)!]
            //Primero Enviamos datos tipo Producto
        }
        
        //Se prepara el carrito a travez de los valores seleccionados que anteriormente fueron agregados a una variable que guarda los productos comprados
        if segue.identifier == "carrito"
        {
            let destin = segue.destination as! CarritoViewController
            destin.comprado = Compras
            print(destin.comprado)
            //Enviamos el arreglo a la vista del carrito
        }
    }
    
    //Funcion que sirve solo para salir
    @IBAction func unwindRegresa(_ segue: UIStoryboardSegue){}
   
}




