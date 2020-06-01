//
//  WaterSettingsViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 5/3/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WaterSettingsViewController: UIViewController {
    
    @IBOutlet weak var dailyWaterInput: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyWaterInput.text = String(defaults.integer(forKey: "amount")) + " ml"
    }
    
    @IBAction func dailyWaterEditingDidBegin(_ sender: UITextField) {
        let indexToSet = dailyWaterInput.text!.count - 3;
        let positionToSet = dailyWaterInput.position(from: dailyWaterInput.beginningOfDocument, offset: indexToSet);
        dailyWaterInput.selectedTextRange = dailyWaterInput.textRange(from: positionToSet!, to: positionToSet!);
    }
    @IBAction func dailyWaterEditingChanged(_ sender: UITextField) {
        if (!dailyWaterInput.text!.isEmpty && dailyWaterInput.text!.count >= 1)
        {
            if (dailyWaterInput.text?.suffix(2) == "ml") {
                dailyWaterInput.text = dailyWaterInput.text
            } else {
                dailyWaterInput.text = dailyWaterInput.text! + " ml"
            }
            let indexToSet = dailyWaterInput.text!.count - 3
            let positionToSet = dailyWaterInput.position(from: dailyWaterInput.beginningOfDocument, offset: indexToSet)
            dailyWaterInput.selectedTextRange = dailyWaterInput.textRange(from: positionToSet!, to: positionToSet!)
            
            let amountToDrink = dailyWaterInput.text
            let finalAmountToDrink = Int(String(amountToDrink?.dropLast(3) ?? "no substring")) ?? 0
            defaults.set(finalAmountToDrink, forKey: "amount")
        }
    }
    
}
