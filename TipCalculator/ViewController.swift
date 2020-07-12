//
//  ViewController.swift
//  TipCalculator
//
//  Created by Irene Sarigu on 08/07/2020.
//  Copyright © 2020 Irene Sarigu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var numberPeople: UITextField!
    
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    
    @IBOutlet weak var totalCotLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var costPerPersonLabell: UILabel!
    
    @IBOutlet weak var tipOutlet: UILabel!
    @IBOutlet weak var totalCostOutlet: UILabel!
    @IBOutlet weak var costPerPersonOutlet: UILabel!

    
    @IBAction func percentSlider(_ sender: UISlider) {
        sender.maximumValue = 100
        sender.minimumValue = 0
        percentageLabel.text = String(Int(round(sender.value))) + "%"
    }
    
    
    @IBAction func percentButtonTapper(_ sender: UIButton){
        percentageSlider.maximumValue = 100
        percentageSlider.minimumValue = 0
        percentageLabel.text = sender.titleLabel!.text
        percentageSlider.value = Float(String(Substring(sender.titleLabel!.text!).dropLast())) ?? 0.0
    }
    
    func calculate(){
       
        
    }
   
    
    @IBAction func calculate(_ sender: UIButton) {
        var percentLabel = Float(String(Substring(percentageLabel.text!).dropLast()))!
        var actualBill = amountTextField.text!
        if(actualBill != nil){
            tipOutlet.text = String(Float(Double(actualBill)!) * Float(percentLabel))
        }else{
            UIAlertAction()
        }
    }
    
}
