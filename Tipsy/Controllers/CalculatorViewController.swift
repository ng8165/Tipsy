//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billAmount: Float = 0.0
    var tipAmount: Float = 0.1
    var splitNumber = 2
    var payment: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipAmount = Float(sender.currentTitle!.dropLast())! / 100.0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        billAmount = Float(billTextField.text ?? "0")!
        
        payment = billAmount*(1+tipAmount)/Float(splitNumber)
        
        performSegue(withIdentifier: "seeResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = payment
            destinationVC.percent = Int(tipAmount*100)
            destinationVC.people = splitNumber
        }
    }
}
