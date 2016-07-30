//
//  ViewController.swift
//  Tip
//
//  Created by Hans Kumar on 7/29/16.
//  Copyright © 2016 Yash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BillAmount: UITextField!
    @IBOutlet weak var TipSelector: UISegmentedControl!
    @IBOutlet weak var TipAmount: UITextField!
    @IBOutlet weak var Total: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CalculateTip(sender: AnyObject) {
        guard let billAmount = Double(BillAmount.text!) else {
            //show error
            BillAmount.text = ""
            TipAmount.text = ""
            Total.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch TipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!BillAmount.editing) {
            BillAmount.text = String(format: "%.2f", roundedBillAmount)
        }
        TipAmount.text = String(format: "%.2f", roundedTipAmount)
        Total.text = String(format: "%.2f", totalAmount)
    
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    



}

