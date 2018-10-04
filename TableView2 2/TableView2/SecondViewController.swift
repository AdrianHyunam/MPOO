//Codigo realizado por Victor y Adrian
//Grupo 04 MPOO
//Proyecto de Carro de Compras
//Clase creada para la segunda vista. Para poder controlar las propiedades de la misma.

import UIKit

class SecondViewController: UIViewController {
    
    //Controladores para lo visual de la vista
    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    //El boton  regresa por el segue el valor de la estructura comprada y lo agrega a la propiedad de cantidad
    @IBAction func comprar(_ sender: UIButton)
    {
        fromFirstView.cantidad += 1
        print(fromFirstView.cantidad)
        viewDidLoad()
    }
    
    //Variable para recibir una estructura de la vista uno
    var fromFirstView : Producto!
    
    //Funciones principales
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Se muestra los valores de la estructura
        etiqueta.text = "\(fromFirstView.nombre)"
        precio.text = String("\(fromFirstView.precio)")
        descrip.text = "\(fromFirstView.desc)"
        imagen.image = UIImage(named: "\(fromFirstView.imagen)")
    }
}
