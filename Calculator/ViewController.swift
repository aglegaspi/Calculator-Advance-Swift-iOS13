//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTyping = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        guard let number = Double(displayLabel.text!) else { fatalError("Can't turn value into a Double!") }
        
        switch sender.currentTitle {
        case "+/-":
            displayLabel.text = String(number * -1)
        case "AC":
            displayLabel.text = "0"
        case "%":
            displayLabel.text = String(number/100)
        default:
            print("")
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { fatalError() }
        
        if isFinishedTyping {
            displayLabel.text = numValue
            isFinishedTyping = false
        } else {
            displayLabel.text = displayLabel.text! + numValue
        }
        
        
        
    
    }

}

