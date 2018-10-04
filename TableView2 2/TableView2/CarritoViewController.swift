//Codigo realizado por Victor y Adrian
//Grupo 04 MPOO
//Proyecto de Carro de Compras

import UIKit

class CarritoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var no: UITextView!
    @IBOutlet weak var tablaDeCompras: UITableView!
    
    var comprado = [Producto]()
    var totalDeCosto: Double = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if comprado.isEmpty
        {
         no.alpha = 1
        }
        else
        {
            no.alpha = 0
        for i in 0...comprado.count-1
        {
           totalDeCosto += comprado[i].precio
        }
        total.text = "Total: $ \(totalDeCosto)"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comprado.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "comprado", for: indexPath)
        
        
        if indexPath.row % 2 == 0{
            cel.backgroundColor = UIColor(red: 2.0, green: 2.3, blue: 0.5, alpha: 0.8)
        }
        else
        {
            cel.backgroundColor = UIColor(red: 2.0, green: 2.3, blue: 0.5, alpha: 0.5)
        }
        
        cel.textLabel?.text = "\(comprado[indexPath.row].nombre)"
        cel.detailTextLabel?.text = "\(comprado[indexPath.row].precio)"
        
        return cel
        
    }
    
}
