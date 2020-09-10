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
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Can't turn value into a Double!") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        switch sender.currentTitle {
        case "+/-":
            displayValue *= -1
        case "AC":
            displayLabel.text = "0"
        case "%":
            displayValue /= 100
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
            if numValue == "." {
                
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + numValue
        }

    }

}

