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
   
    
    @IBAction func calculate(_ sender: UIButton) {
        if(amountTextField.text != "" && numberPeople.text != ""){
            let percentLabel = Float(String(Substring(percentageLabel.text ?? "0").dropLast()))
                let  actualBill = amountTextField.text!
            calculateTip(percentLabel: percentLabel ?? 0.0, actualBill: actualBill ?? "0")
        }else{
         var dialogMessage = UIAlertController(title: "Mandatory Fields", message: "Please complete all the fields", preferredStyle: .alert)
         
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
          })
         
         dialogMessage.addAction(ok)

         self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    func calculateTip(percentLabel: Float, actualBill:String){
         let tip = Float(Double(actualBill)!) * Float(percentLabel)/100
        tipOutlet.text = String(tip)
        calculateTotalCost(tip: tip, actualBill: actualBill)
      }
    
    
    func calculateTotalCost(tip:Float, actualBill:String){
        totalCostOutlet.text = String(Float(Double(tip)) + Float(actualBill)!)
        let total = Float(Double(tip)) + Float(actualBill)!
        calculateCostPerson(total:actualBill)
    }
    
    func calculateCostPerson(total : String){
        let number = numberPeople.text!
        print(total, number)
        costPerPersonOutlet.text = String(Float(Double(total)!) / Float(number)!)
    }
    
}
