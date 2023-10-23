//
//  ViewController.swift
//  yandex-counter
//
//  Created by Aleks on 10/23/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    private var counter: UInt = 0
    private var textCounter: String = "Значение счётчика:"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Counter Label config
        counterLabel.textAlignment = .center
        counterLabel.text! = "\(counter)"
        // Button Plus config
        buttonPlus.tintColor = .red
        // Button Zero config
        buttonZero.backgroundColor = .darkGray
        buttonZero.tintColor = .white
        // Text View config
        historyTextView.isEditable = false
        historyTextView.backgroundColor = .white
    }
    @IBAction func increaseCounter(_ sender: Any) {
        counter += 1
        counterLabel.text! = textCounter + "\(counter)"
        updateHistory(with: "значение изменено на +1")
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        if counter == 0 {
            updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
        } else {
            counter -= 1
            counterLabel.text! = textCounter + "\(counter)"
            updateHistory(with: "значение изменено на -1")
        }


    }
    @IBAction func counterToZero(_ sender: Any) {
        counter = 0
        counterLabel.text! = textCounter + "\(counter)"
        updateHistory(with: "значение сброшено")
    }
    
    func updateHistory(with text: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        
        // Get the existing attributed text
        let existingAttributedText = historyTextView.attributedText ?? NSAttributedString()
        
        // Create new attributed date string
        let attributedDateString = NSAttributedString(string: "\n\(dateString)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        
        // Create the new attributed info string without date
        let newLineAttributedText = NSAttributedString(string: ": \(text)", attributes: [.foregroundColor:UIColor.black])
        
        // Appends the new line to the existing attributed string
        let newAttributedText = NSMutableAttributedString(attributedString: existingAttributedText)
        newAttributedText.append(attributedDateString)
        newAttributedText.append(newLineAttributedText)
        
        // Set the new text for UITextView
        historyTextView.attributedText = newAttributedText
    }
    
    
}

