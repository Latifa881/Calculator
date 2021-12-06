//
//  ViewController.swift
//  Calculator
//
//  Created by administrator on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var number1:String=""
    var operation:String=""
    var number2:String=""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        resultLabel.text = ""
        number1=""
        operation=""
        number2=""
    }
    @IBAction func operationsButtons(_ sender: UIButton) {
       
        if !number1.isEmpty && operation.isEmpty {
            if sender.tag == 1 {
                operation = "/"
            } else if sender.tag == 2 {
                operation = "*"
            }else if sender.tag == 3 {
                operation = "-"
            }else{
                operation = "+"
            }
          
            
        }
        
    }
    
    @IBAction func numbersButton(_ sender: UIButton) {
        guard let buttonTitle=sender.titleLabel?.text else{return}
        
        if operation.isEmpty{
            number1 += buttonTitle
            resultLabel.text = number1
            
        }else{
            number2 += buttonTitle
            resultLabel.text = number2
        }
        
    }
    @IBAction func calculateResultButton(_ sender: UIButton) {
        if !number1.isEmpty && !operation.isEmpty && !number2.isEmpty{
            
            guard let num1 = Double(number1),let  num2 = Double(number2)else {return}
            
            switch operation{
            case "+":
                resultLabel.text = "\(num1 + num2)"
            case "-":
                resultLabel.text = "\(num1 - num2)"
            case "*":
                resultLabel.text = "\(num1 * num2)"
            case "/":
                if num2 != 0{
                    resultLabel.text = "\(num1 / num2)"}
                else{
                    resultLabel.text = ""}
                
            default:
                resultLabel.text = ""
            }
            if let result = resultLabel.text{
                number1 = result
            }
          
            number2 = ""
            operation = ""
            
        }
    }
}

