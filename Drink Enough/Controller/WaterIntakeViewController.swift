//
//  WaterIntakeViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/26/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WaterIntakeViewController: UIViewController {
    
    @IBOutlet weak var goalReachedOutputLabel: UILabel!
    @IBOutlet weak var drinkTxtInput: UITextField!
    @IBOutlet weak var waterOutputLabel: UILabel!
    
    let defaults = UserDefaults.standard
    private var amountDrank: Int = 0;
    private var amountToDrink: Int = 0;
    //  Drink drink = new Drink();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterOutputLabel.text = defaults.string(forKey: "amount")
        
    }
    
    
    
}
