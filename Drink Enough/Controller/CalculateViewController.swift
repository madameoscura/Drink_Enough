//
//  CalculateViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/14/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var waterTxtInput: UITextField!
    
    var userWeightInKg = ""
    let mlToDrinkPerKg = 30
    var finalAmountToDrink = 0
    var calculatedAmount = 0
    let defaults = UserDefaults.standard
  //  JsonHelper jsonHelper = new JsonHelper();
   // Dictionary<string, int> jsonDict = new Dictionary<string, int>();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatedAmount = (Int(userWeightInKg) ?? 1) * mlToDrinkPerKg;
        defaults.set(Int(userWeightInKg), forKey: "weight")
        waterTxtInput.text = "\(calculatedAmount)" +  " ml";
    }
    
    @IBAction func txtCalcEditingDidBegin(_ sender: UITextField) {
        let indexToSet = waterTxtInput.text!.count - 3;
        let positionToSet = waterTxtInput.position(from: waterTxtInput.beginningOfDocument, offset: indexToSet);
        waterTxtInput.selectedTextRange = waterTxtInput.textRange(from: positionToSet!, to: positionToSet!);
    }
    
    @IBAction func txtCalcEditingChanged(_ sender: UITextField) {
        if (!waterTxtInput.text!.isEmpty && waterTxtInput.text!.count >= 1)
        {
            if (waterTxtInput.text?.suffix(2) == "ml") {
                waterTxtInput.text = waterTxtInput.text
            } else {
                waterTxtInput.text = waterTxtInput.text! + " ml"
            }
            let indexToSet = waterTxtInput.text!.count - 3
            let positionToSet = waterTxtInput.position(from: waterTxtInput.beginningOfDocument, offset: indexToSet)
            waterTxtInput.selectedTextRange = waterTxtInput.textRange(from: positionToSet!, to: positionToSet!)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let amountToDrink = waterTxtInput.text
        finalAmountToDrink = Int(String(amountToDrink?.dropLast(3) ?? "no substring")) ?? 0
        defaults.set(finalAmountToDrink, forKey: "amount")
        print(defaults.integer(forKey: "amount"))
        
        print(amountToDrink ?? "no default value")
        print(finalAmountToDrink)
    }
    
    

    //What should happen when done Button is pressed
  /*  private void DoneButton_TouchUpInside(object sender, EventArgs e)
    {
        finalAmountToDrink = int.Parse(WaterTxtInput.Text.Remove(WaterTxtInput.Text.Length - 3, 3));
        jsonDict["amount"] = finalAmountToDrink;
        jsonDict["weight"] = int.Parse(userWeightInKg);
        jsonHelper.jsonWrite(jsonDict);
        Console.WriteLine(finalAmountToDrink);
    } */

}
