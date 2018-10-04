//Codigo realizado por Victor y Adrian
//Grupo 04 MPOO
//Proyecto de Carro de Compras
//Clase para el control y propiedades del boton de inicio

import UIKit

class Inicio: UIButton {

    override func awakeFromNib()
    {
    
    //Propiedad para que el boton cambie de tamaño
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.6
    pulse.fromValue = 0.95
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = 2
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    
    //Propiedad para que el boton desaparezca y aparezca
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.5
    flash.fromValue = 1.0
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 3
    
    layer.add(flash, forKey: nil)
    layer.add(pulse, forKey: nil)
    }
                        }

