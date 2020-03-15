//
//  ViewController.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/14/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController {

    DBHelper dbHelper = new DBHelper();
     JsonHelper jsonHelper = new JsonHelper();
    // Dictionary<string, int> jsonDict;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dbHelper.createDB();

        /*  Drink olddrink = new Drink()
         {
             AmountDrank = 1400,
             DrinkingGoal = 3000,
             CreateDate = new DateTime(2020,3,5)
         };
         dbHelper.insertDrink(olddrink); */

         //Add observer to include "kg" behind numbers inserted
         NSNotificationCenter.DefaultCenter.AddObserver(
         UITextField.TextFieldTextDidChangeNotification, (notification) =>
         { if (!string.IsNullOrEmpty(WeightTxtInput.Text) && WeightTxtInput.Text.Length > 1)
             {
              if (WeightTxtInput.Text.Substring(WeightTxtInput.Text.Length - 2) == "kg")
              {
                  WeightTxtInput.Text = WeightTxtInput.Text;
              }
             }
             else
             {
             WeightTxtInput.Text = WeightTxtInput.Text + " kg";
             }
             var indexToSet = WeightTxtInput.Text.Length - 3;
             var positionToSet = WeightTxtInput.GetPosition(WeightTxtInput.BeginningOfDocument, indexToSet);
             WeightTxtInput.SelectedTextRange = WeightTxtInput.GetTextRange(positionToSet, positionToSet);
         
         });
    }
    
    //Give user weight to CalculateVC
    public override void prepareForSegue(UIStoryboardSegue segue, NSObject sender)
    {
        base.PrepareForSegue(segue, sender);

        var Controller = segue.DestinationViewController as CalculateViewController;

        if (Controller != null)
        {
            Controller.userWeightInKg = WeightTxtInput.Text.Remove(WeightTxtInput.Text.Length - 3, 3);

           
        }
    }


}

