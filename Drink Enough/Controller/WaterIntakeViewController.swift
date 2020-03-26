//
//  WaterIntakeViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/26/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WaterIntakeViewController: UIViewController {

    let defaults = UserDefaults.standard
    private var amountDrank: Int = 0;
    private var amountToDrink: Int = 0;
  //  Drink drink = new Drink();
    @IBOutlet weak var waterOutputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterOutputLabel.text = defaults.string(forKey: "amount")
        // Do any additional setup after loading the view.
    }
    


}
