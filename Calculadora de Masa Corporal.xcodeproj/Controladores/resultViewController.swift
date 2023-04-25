//
//  resultViewController.swift
//  Calculadora de Masa Corporal
//
//  Created by Jose  Manuel Pineda Duran on 8/04/23.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?  // se crea esta variable que indica el resultado de calculo en la primera pantalla
    
    var advice: String?
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      BMILabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color

        
        
    }
    

    @IBAction func recalculatedPressed(_ sender: UIButton) {
        
        // para retroceder a la pantalla principal y reiniciar la app
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
