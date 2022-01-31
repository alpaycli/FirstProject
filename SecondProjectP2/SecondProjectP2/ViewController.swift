//
//  ViewController.swift
//  SecondProjectP2
//
//  Created by parol-12345 on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var txtScore: UILabel!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany" , "ireland" , "italy", "monaco", "nigeria" ,"poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.blue.cgColor
        button3.layer.borderColor = UIColor.red.cgColor
        
        askQuestion()
        
    
    }
    
    func askQuestion(action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())   Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            questions += 1
        }
        else{
            title = "Wrong, that is the flag of \(countries[correctAnswer])"
            score -= 1
            questions += 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        if questions < 10 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        else{
            ac.addAction(UIAlertAction(title: "Game over, your score is \(score) out of \(questions)", style: .default, handler: nil))
            present(ac, animated: true)
        }
        
        
    }
    
}

