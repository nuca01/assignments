//
//  ViewController.swift
//  assignment 11
//
//  Created by nuca on 02.04.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueToCalculate: UILabel!
    @IBOutlet weak var firstValue: UITextField!
    @IBOutlet weak var secondValue: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeValueToCalculate() {
        switch valueToCalculate.text {
        case "უდიდესი საერთო გამყოფი":
            valueToCalculate.text = "უმცირესი საერთო ჯერადი"
        case "უმცირესი საერთო ჯერადი":
            valueToCalculate.text = "უდიდესი საერთო გამყოფი"
        default:
            break
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        // თუ წინაზე შეცვლილი იყო ფერი დავაბრუნოთ
        firstValue.textColor = UIColor.black
        secondValue.textColor = UIColor.black
        
        //თუ პირველი ვერ გადავიდა ინტში გავაწითლოთ პირველის ტექსტი
        if Int(firstValue.text!) == nil {
            firstValue.textColor = UIColor.red
            //შევამოწმოთ მეორეც რომ მხოლოდ ერთი არ გაწითლდეს
            if Int(secondValue.text!) == nil {
                secondValue.textColor = UIColor.red
            }
            return
        }
        
        //თუ პირველი გადავიდა ინტში შევეცადოთ გადავიყვანოთ მეორე
        if Int(secondValue.text!) == nil {
            secondValue.textColor = UIColor.red
            return
        }
        
        var firstNumber: Int = Int(firstValue.text!)!
        var secondNumber: Int = Int(secondValue.text!)!
        
        if (firstNumber == 0 || secondNumber == 0) {
            result.text = "პასუხი: 0-ისთვის \(valueToCalculate.text!) არ არსებობს"
            return
        }
        
        //სანამ მნიშნელობებს შევცვლით შევინახოთ ნამრავლი უსჯს გამოთვლისთვის
        let multipleOfFirstAndSecond = firstNumber * secondNumber
        
        //ვიპოვოთ უსგ რადგან უსჯ მისგან გამომდინარეობს
        var resultNumber: Int = 1
        let smallNumber: Int = firstNumber < secondNumber ? firstNumber : secondNumber
        for number in stride(from: 2, to: smallNumber + 1, by: 1) {
            while firstNumber % number == 0
                    && secondNumber % number == 0 {
                resultNumber = resultNumber * number
                firstNumber = firstNumber / number
                secondNumber = secondNumber / number
            }
        }
        
        switch valueToCalculate.text {
        case "უდიდესი საერთო გამყოფი":
            result.text = "პასუხი: \(resultNumber)"
        case "უმცირესი საერთო ჯერადი":
            result.text = "პასუხი: \((multipleOfFirstAndSecond) / resultNumber))"
        default:
            break
        }
    }
}
