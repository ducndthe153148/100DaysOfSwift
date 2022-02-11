//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nguyễn Đình Trung Đức on 11/02/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmiValue: String?
    
    mutating func calculateBMI (weight: Float, height: Float) -> String {
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        return bmiValue ?? "Nil"
    }
    
}
