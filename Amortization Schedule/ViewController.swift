//
//  ViewController.swift
//  Amortization Schedule
//
//  Created by Jeffrey Manassa on 8/10/18.
//  Copyright © 2018 Jeffrey Manassa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yearInput: UITextField!
    
    @IBOutlet weak var loanInput: UITextField!
    
    @IBOutlet weak var interestInput: UITextField!
    
    @IBOutlet weak var monthlyPayment: UILabel!
    
    @IBOutlet weak var totalInterest: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.yearInput.delegate = self
        self.loanInput.delegate = self
        self.interestInput.delegate = self
    
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide keyboard when user touched outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        yearInput.resignFirstResponder()
        loanInput.resignFirstResponder()
        interestInput.resignFirstResponder()
        return(true)
    }
    
    
    
    @IBAction func tappedCalculate(_ sender: Any) {
        
        let interest = Double(interestInput.text!)
        let years = Double(yearInput.text!)
        var loan = Double(loanInput.text!)
        let c: Double = (interest!/1200)
        let n: Double = (years!*12)
        let fixed: Double = loan!*(c*pow(1+c, n))/(pow(1+c, n) - 1)
        
        
        var i: Double = 0
        var principal: Double = 0
        var iTot: Double = 0
        var y:Double = 1
        var month = 1
        while(y != (years!+1))
        {
            // print("Year \(y)\n")
            while month != 13
            {
                if loan != 0
                {
                    i = loan!*interest!/1200 // money paid in interest
                    iTot += i
                    principal = fixed - i // money paid in principal
                    loan! -= principal
                }
                
                // print("Month \(month)\n")
                // print("Principal $\(principal) << setw(20) << "Interest $" << interest << endl;
                
                month += 1
            }
            
            
            if month == 13
            { // cycle through years
                y += 1
                //print("\n")
                month -= 12
            }
        }
        
        // print("Total interest paid is $\(iTot).\n")
        
        monthlyPayment.text = String(format: "%.2f", fixed)
        
        totalInterest.text = String(format: "%.2f", iTot)
    }
    
}

