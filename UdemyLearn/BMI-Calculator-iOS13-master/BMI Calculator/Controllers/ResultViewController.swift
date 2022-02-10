//
//  SecondViewControlller.swift
//  BMI Calculator
//
//  Created by Nguyễn Đình Trung Đức on 10/02/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var reCalculate: UIButton!
    
    var bmiValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
    }
    
    @IBAction func reCalculatePress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
