//
//  ViewController.swift
//  Day19-Project2
//
//  Created by Nguyễn Đình Trung Đức on 19/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreNow: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsk = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Add border color of button
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1, green: 0.6, blue: 0.6, alpha: 1).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        //button1.layer.cornerRadius = 15
        scoreNow.text = "Score now: \(score)"
        askQuestion()

    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        scoreNow.text = "Score now: \(score)"
        view.layoutIfNeeded()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String = ""
        if questionAsk == 0 {
            title = "Finish. This game over"
        } else {
            questionAsk -= 1;
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
                message = "Your score is: \(score)"
            } else {
                title = "Wrong"
                message = #"That’s the flag of \#(countries[sender.tag]) \#nYour score is: \#(score)"#
                score -= 1
            }
        }
        
        // Alert controller
        let ac = UIAlertController(title: title, message: message , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac,animated: true)
        
    }
    
}

