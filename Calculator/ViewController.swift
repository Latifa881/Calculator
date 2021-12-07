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
    var number1Sign:String=""
    var number2Sign:String=""
    var number1Decimal:String=""
    var number2Decimal:String=""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        resultLabel.text = ""
        number1=""
        number2=""
        // * - / + %
        operation=""
        // - +
        number1Sign=""
        number2Sign=""
        // .
        number1Decimal=""
        number2Decimal=""
    
    }
    @IBAction func operationsButtons(_ sender: UIButton) {
       
        if !number1.isEmpty && operation.isEmpty {
            if sender.tag == 1 {
                operation = "/"
            } else if sender.tag == 2 {
                operation = "*"
            }else if sender.tag == 3 {
                operation = "-"
            }else if sender.tag == 4{
                operation = "+"
            }
            else if sender.tag == 5 {
                operation = "%"
            }
          
            
        }
        
    }
    
    @IBAction func signButton(_ sender: UIButton) {
        //tag 1 ==> +
        //tag 2 ==> -
        if operation.isEmpty {
            if sender.tag == 1{
                number1Sign="-"
                sender.tag = 2
            }else{
                number1Sign=""
                sender.tag = 1
            }
            resultLabel.text = number1Sign + number1
        }else {
            if sender.tag == 1{
                number2Sign="-"
                sender.tag = 2
            }else{
                number2Sign=""
                sender.tag = 1
            }
            resultLabel.text = number2Sign + number2
        }
        
    }
    @IBAction func decimalButton(_ sender: UIButton) {
        
        if operation.isEmpty && number1Decimal.isEmpty{
            number1Decimal="."
            number1 += number1Decimal
            resultLabel.text = number1
            
        } else if !operation.isEmpty && number2Decimal.isEmpty{
            number2Decimal="."
            number2 += number2Decimal
            resultLabel.text = number2
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
            
            number1 = number1Sign+number1
            number2 = number2Sign+number2
            
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
            case "%":
                resultLabel.text = "\(Int(num1) % Int(num2))"
                
            default:
                resultLabel.text = ""
            }
            if let result = resultLabel.text{
                number1 = result
            }
          
            number2 = ""
            operation = ""
            number2Sign=""
            
        }
    }
}

