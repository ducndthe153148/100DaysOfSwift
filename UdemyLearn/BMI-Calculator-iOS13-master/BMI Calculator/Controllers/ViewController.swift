//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightSlide: UISlider!
    @IBOutlet weak var heightSlide: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        print(String (format: "%.2f", sender.value))
        let height = String (format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        print(String (format: "%.0f", sender.value))
        let weight = String (format: "%.0f", sender.value)
        weightLabel.text = "\(weight) kg"
//        print(Int(sender.value))
    }
    
    @IBAction func calculatePress(_ sender: UIButton) {
        let height = heightSlide.value
        let weight = weightSlide.value
        
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
    
}

