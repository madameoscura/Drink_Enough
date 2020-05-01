//
//  WaterIntakeViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/26/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WaterIntakeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var goalReachedOutputLabel: UILabel!
    @IBOutlet weak var drinkTxtInput: UITextField!
    @IBOutlet weak var waterOutputLabel: UILabel!
    @IBOutlet weak var waterView: UIView!
    
    var selectedAmount: Int?
    let amountList : [(name: String, value: Int)] = [("50 ml", 50), ("100 ml", 100), ("150 ml", 150), ("200 ml (glass)", 200), ("250 ml (cup)", 250), ("300 ml", 300), ("350 ml", 350), ("400 ml", 400), ("450 ml", 450), ("500 ml (small bottle)", 500), ("600 ml", 600), ("700 ml", 700), ("800 ml", 800), ("900 ml", 900), ("1000 ml (bottle)", 1000), ("1100 ml", 1100), ("1200 ml", 1200), ("1300 ml", 1300), ("1400 ml", 1400), ("1500 ml (big bottle)", 1500)]
    let defaults = UserDefaults.standard
    private var amountDrank: Int = 0;
    private var amountToDrink: Int = 0;
    //  Drink drink = new Drink();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountToDrink = defaults.integer(forKey: "amount")
        waterOutputLabel.text = String(amountToDrink)
        createPickerView()
        dismissPickerView()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return amountList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return amountList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAmount = amountList[row].value
        print(selectedAmount ?? "no default amount")
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        drinkTxtInput.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        drinkTxtInput.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
        amountDrank += selectedAmount ?? 0
        if (defaults.integer(forKey: "amount") >= amountDrank)
        {
            amountToDrink = defaults.integer(forKey: "amount") - amountDrank;
        }
        else
        {
            amountToDrink = 0;
        }
        drinkTxtInput.resignFirstResponder()
        waterView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: CGFloat(Int((view.bounds.height - navBar.bounds.height))*amountToDrink / defaults.integer(forKey: "amount"))).isActive = true
        
        if (amountToDrink <= 0)
        {
        goalReachedOutputLabel.text = "I reached my goal of \(defaults.integer(forKey: "amount")) ml! Total amount I drank today:"
        waterOutputLabel.text = String(amountDrank) + " ml"
            let alert = UIAlertController(title: "Congratulations", message: "You reached your daily drinking goal!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "I am a champion", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
        goalReachedOutputLabel.text = "Today I still have to drink:"
        waterOutputLabel.text = String(amountToDrink) + " ml"
        }
    }
    //Changes for HistoryVC
 /*   drink.AmountDrank = amountDrank;
    DBHelper.updateDrink(drink);
    
    Console.WriteLine(amountDrank.ToString());
    Console.WriteLine(amountToDrink.ToString());
    Console.WriteLine(((View.Bounds.Height - NavBar.Bounds.Height) * amountToDrink / jsonDict["amount"]).ToString());
    
    DrinkTxtInput.ResignFirstResponder();
    waterView.TopAnchor.ConstraintEqualTo(NavBar.BottomAnchor, (View.Bounds.Height - NavBar.Bounds.Height)
    * amountToDrink / jsonDict["amount"]).Active = true;
    
    if (amountToDrink <= 0)
    {
    GoalReachedOutputLabel.Text = $"I reached my goal of {jsonDict["amount"]} ml! Total amount I drank today:";
    WaterOutputLabel.Text = (amountDrank).ToString() + " ml";
    var alert = UIAlertController.Create("Congratulations", "You reached your daily drinking goal!", UIAlertControllerStyle.Alert);
    alert.AddAction(UIAlertAction.Create("I am a champion", UIAlertActionStyle.Default, null));
    PresentViewController(alert, true, null);
    }
    else
    {
    GoalReachedOutputLabel.Text = "Today I still have to drink:";
    WaterOutputLabel.Text = Convert.ToString(amountToDrink) + " ml";
    }
    
    */
}
