//
//  calculatedBrain.swift
//  Calculadora de Masa Corporal
//
//  Created by Jose  Manuel Pineda Duran on 8/04/23.
//

import UIKit

struct CalculatorBrain{

    var bmi: BMI?

    

    func getBMIValue() -> String {

        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "" )
            return bmiTo1DecimalPlace

    }

    func getAdvice() -> String? {
        return bmi?.advice ?? "not Advice"
    }

    func getColor() -> UIColor? {
        return bmi?.color
    }

    mutating func calculateBMI (heigth: Float, weigth: Float){

        let bmiValue = weigth / (heigth * 2)
        // se puede hacer asi tambien pow(heigth, 2

        let color = (underweigth : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), normalWeigth : #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), overWeigth : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) , obese: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) , morvid: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), nodata: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) )// para el cuadro de color se uso #colorLiteral(  los rangos de clor son under 0-18.5,azul / normal 18.5-24.5,verde / sobrepeso 25.5-29.5,amarillo / obeso 19.5-39.5,naranja / morvido mayor a 39.5,rojo
       //let bmiRange: Float bmiRange = 18.5...25.0

// arregAL LOS VALORES PARA LOS LIMITES
        if  bmiValue < 18.5 { // MENORES A 17.9
            bmi = BMI(value: bmiValue, advice: "Tiene mas carne un zancudo en la rodilla", color: color.underweigth)
        }else if  bmiValue > 18.5 && bmiValue < 24.9 { // ENTRE 18.5 a 24.5
            bmi = BMI(value: bmiValue, advice: "Estas en la jugada te veo firme", color: color.normalWeigth)
        }else if bmiValue > 25.0 && bmiValue < 29.9 { // entre a 25.0 a 29.9
            bmi = BMI(value: bmiValue, advice: "Bajale un toque a la cuchara", color: color.overWeigth)
        }else if bmiValue > 30.0 && bmiValue < 39.9 { // entre a 30.0 a 39.9
            bmi = BMI(value: bmiValue, advice: "Joa, te toca comenzar a dejar el pan", color: color.obese)
        }else if bmiValue > 40.0  { // mas de 40
            bmi = BMI(value: bmiValue, advice: "Ponte pilas que la vaina esta maluca", color: color.morvid)
        }else{
            bmi = BMI(value: bmiValue, advice: "No se puede calcular, ingresa datos validos", color: color.nodata)

        }

    }
}
