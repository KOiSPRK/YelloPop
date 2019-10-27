//
//  ViewController.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/26/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit
import Logic
import APIService

class ViewController: UIViewController {

    let viewModel = ViewModel()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    func configure() {
        self.resultButton.isHidden = true
        self.resultButton.round()
        self.updateSubmitButtonState(with: false)
    }
    
    // MARK: Private
    
    fileprivate func updateResultButtonState(with isPrime: Bool) {
        DispatchQueue.main.async {
            self.resultButton.isHidden = false
            
            if isPrime {
                self.resultButton.layer.backgroundColor = UIColor.systemRed.cgColor
                self.resultButton.setTitle("Prime", for: .normal)
                
            } else {
                self.resultButton.layer.backgroundColor = UIColor.systemBlue.cgColor
                self.resultButton.setTitle("Not Prime", for: .normal)
            }
        }
    }
   
    fileprivate func updateSubmitButtonState(with isEnable: Bool) {
        self.submitButton.isEnabled = isEnable
        self.submitButton.layer.backgroundColor = isEnable ? UIColor.systemBlue.cgColor : UIColor.systemGray.cgColor
   }
    
    // MARK: Actions
    
    @IBAction func didTapSubmitButton(_ sender: UIButton) {
        guard let value = self.textField.text, let uintValue = UInt(value),
            let isPrime = PrimeLogic.isPrime(with: uintValue) else {
                self.resultButton.isHidden = true
                print("Invalid value")
            return
        }
        self.viewModel.append(with: uintValue, isPrime: isPrime)
        self.updateResultButtonState(with: isPrime)
    }
    
    @IBAction func didTapResultButton(_ sender: UIButton) {
        guard let last = self.viewModel.history.last, let value = last.number else {
            print("Invalid")
            return
        }
        APIService.getNumberInfo(with: value) { (number, error) in
            guard let found = number.found else {
                return
            }
            print("\n\(number.text ?? "---")")
            self.updateResultButtonState(with: found)
        }
        
    }
    
    // MARK: TextField
    
    @IBAction func didChange(_ sender: UITextField) {
        guard let value = self.textField.text else {
            return
        }
        self.resultButton.isHidden = true
        self.updateSubmitButtonState(with: !value.isEmpty)
    }
    
}

