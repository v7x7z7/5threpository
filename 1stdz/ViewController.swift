//
//  ViewController.swift
//  1stdz
//
//  Created by vv 77 on 10/09/24.
//
//some andvice clmcl
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func slojenieButton(_ sender: Any) {
        
            let alert = UIAlertController(title: "Сложение", message: "Введите два числа", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Число 1"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Число 2"
            }
            let calculateAction = UIAlertAction(title: "Посчитать", style: .default) { _ in
                if let number1Text = alert.textFields?[0].text,
                   let number2Text = alert.textFields?[1].text,
                   let number1 = Int(number1Text),
                   let number2 = Int(number2Text) {
                    let result = number1 + number2
                    let resultAlert = UIAlertController(title: "Результат", message: "Сумма: \(result)", preferredStyle: .alert)
                    resultAlert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(resultAlert, animated: true)
                }
            }
            alert.addAction(calculateAction)
            present(alert, animated: true)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        
            let randomNumber = Int.random(in: 1...100)
            var popitok = 0
            
            let alert = UIAlertController(title: "Угадай число", message: "Введите число от 1 до 100", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Набери рандомное число"
            }
            
            let guessAction = UIAlertAction(title: "Угадать", style: .default) { _ in
                popitok += 1
                if let guessText = alert.textFields?.first?.text,
                               let guess = Int(guessText) {
                                if guess < randomNumber {
                                    self.present(self.createFeedbackAlert(message: "Слишком маленькое число!"), animated: true)
                                } else if guess > randomNumber {
                                    self.present(self.createFeedbackAlert(message: "Слишком большое число!"), animated: true)
                                } else {
                                    self.present(self.createFeedbackAlert(message: "Вы угадали число за \(popitok) попыток!"), animated: true)
                                }
                            }
                        }
                        
                        alert.addAction(guessAction)
                        present(alert, animated: true)
    }
    
    func createFeedbackAlert(message: String) -> UIAlertController {
        let feedbackAlert = UIAlertController(title: "Результат", message: message, preferredStyle: .alert)
        feedbackAlert.addAction(UIAlertAction(title: "OK", style: .default))
        return feedbackAlert
    }
    
}

