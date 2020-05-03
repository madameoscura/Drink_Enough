//
//  WaterCalcViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 5/2/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WaterCalcViewController: UIViewController {
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var waterOutputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //add observer to include "kg" in textfield after weight when numbers are inserted    
    @IBAction func weightInputEditingChanged(_ sender: UITextField) {
    if (!weightInput.text!.isEmpty && weightInput.text!.count >= 1)
        {
            if (weightInput.text?.suffix(2) == "kg") {
                weightInput.text = weightInput.text
            } else {
                weightInput.text = weightInput.text! + " kg"
            }
            let indexToSet = weightInput.text!.count - 3;
            let positionToSet = weightInput.position(from: weightInput.beginningOfDocument, offset: indexToSet)
            weightInput.selectedTextRange = weightInput.textRange(from: positionToSet!, to: positionToSet!)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        let mlToDrinkPerKg = 30
    
        if (!weightInput.text!.isEmpty && weightInput.text != (" kg")) {
            weightInput.resignFirstResponder()
            let calcWeightInKgText = weightInput.text?.dropLast(3);
            let calcWeightInKg = Int(calcWeightInKgText ?? "0")
            let calculatedAmount = String((calcWeightInKg ?? 0) * mlToDrinkPerKg)
            waterOutputLabel.text = calculatedAmount + " ml";
        }
        
        else if ((weightInput.text?.isEmpty) != nil) {
            let alert = UIAlertController(title: "Nothing to calculate", message: "Please insert your weight", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        /*
         func integer(from textField: UITextField) -> Int {
             guard let text = textField.text, let number = Int(text) else {
                 return 0
             }
             return number
         }
         */
    }
}
