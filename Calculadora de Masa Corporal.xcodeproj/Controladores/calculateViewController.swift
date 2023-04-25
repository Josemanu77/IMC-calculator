//
//  ViewController.swift
//  Calculadora de Masa Corporal
//
//  Created by Jose  Manuel Pineda Duran on 8/04/23.
//

import UIKit

class calculateViewController: UIViewController {
    
    
    @IBOutlet weak var heigthSlider: UISlider!
    @IBOutlet weak var weigthSlider: UISlider!
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    @IBOutlet weak var calculatedButton: UIButton!
    
    // var bmiResult = "0.0"
    var calculatorBrain = CalculatorBrain()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func heigthSliderChanged(_ sender: UISlider) {
        
        let heigthIn = String (format: "%.2f", sender.value)
        heigthLabel.text = " \(heigthIn) Mts."
    }
    
    
    @IBAction func weigthSliderChanged(_ sender: UISlider) {
        
        let weigthIn = String (format: "%.0f", sender.value)
        weigthLabel.text = "\(weigthIn) Kg."
    }
    

    
    @IBAction func calculatedActionButton(_ sender: UIButton) {
        
        let heigth = heigthSlider.value
        let weigth = weigthSlider.value

        calculatorBrain.calculateBMI (heigth: heigth, weigth: weigth)

    // con este en ennlaza la vista del resultViewControler ( el Segue)

        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    // con esto se enlaza los datos en el result ViewControler

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! resultViewController
               destinationVC.bmiValue = calculatorBrain.getBMIValue()
               destinationVC.advice = calculatorBrain.getAdvice()
               destinationVC.color = calculatorBrain.getColor()
           }
       }
}

