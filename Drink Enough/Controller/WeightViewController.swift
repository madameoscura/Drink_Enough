//
//  ViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/14/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var weightTxtInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Add observer to include "kg" behind numbers inserted
    @IBAction func txtEditingChanged(_ sender: UITextField) {
        if (!weightTxtInput.text!.isEmpty && weightTxtInput.text!.count >= 1)
        {
            if (weightTxtInput.text?.suffix(2) == "kg") {
                weightTxtInput.text = weightTxtInput.text
            } else {
                weightTxtInput.text = weightTxtInput.text! + " kg"
            }
            let indexToSet = weightTxtInput.text!.count - 3
            let positionToSet = weightTxtInput.position(from: weightTxtInput.beginningOfDocument, offset: indexToSet)
            weightTxtInput.selectedTextRange = weightTxtInput.textRange(from: positionToSet!, to: positionToSet!)
        }
    }
    
    //Give user weight to CalculateVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculateVC" {
            let destionationVC = segue.destination as? CalculateViewController
            //remove last 3 characters " kg" 
            let weightInput = String(weightTxtInput.text!.dropLast(3))
            destionationVC?.userWeightInKg = weightInput
        }
    }
    
    @IBAction func weightIntakeButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCalculateVC", sender: self)
    } 
}

