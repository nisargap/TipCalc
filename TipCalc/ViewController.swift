//
//  ViewController.swift
//  TipCalc
//
//  Created by Nisarga Patel on 1/5/17.
//  Copyright © 2017 Nisarga Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function calculates a user's tip by taking into
    // account the amount they put in their Bill text field
    // and the amount the select on the segmented control
    // the segmented control will run this function on a
    // valueChanged event which was connected to this
    // by right clicking the segmented control and selecting
    // the valueChanged event
    @IBAction func calculateTip(_ sender: Any) {
        
        // There must be an array of values for the tip increments
        let tipPossibles = [0.18, 0.2, 0.25]
        
        // The string value of the billField must be converted
        // into a numerical double
        let billInitialValue = Double(billField.text!) ?? 0
        
        // Based upon the selected control segment a tip value needs to be chosen
        let selectedTip = tipPossibles[segmentedControl.selectedSegmentIndex]
        
        // The tip value must be calculated
        let tipValue = billInitialValue * selectedTip
        
        // Calculate the total value as the tipValue + billInitialValue
        let totalValue = billInitialValue + tipValue
        
        // Set the text values for the textFields with the correct String formatting i.e. a decimal with 2 decimal places
        tipLabel.text = String(format: "$%.2f", tipValue)
        totalLabel.text = String(format: "$%.2f", totalValue)
        
    }
    
    // This is the value changed function for the segmented value control
    // When the user changes the value the calculateTip function is automatically run
    @IBAction func runValueChanged(_ sender: Any) {
        
        self.calculateTip(Any.self)
        
    }
    
    // To get this to show I did Option + Click on the tap gesture recognizer
    // I then made this an Action with the name
    // onTap
    @IBAction func onTap(_ sender: Any) {
        
        // This will make the keyboard go away
        view.endEditing(true)
        
    }


}

