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

class ViewController: BaseViewController {

    let viewModel = ViewModel()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configure() {
        self.resultButton.isHidden = true
        self.resultButton.round()
        self.updateSubmitButtonState(with: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func didEnterBackground(notification : NSNotification) {
        self.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HistoryViewController {
            let vc = segue.destination as? HistoryViewController
            vc?.viewModel = self.viewModel
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.resetView()
    }
    
    // MARK: Private
    
    fileprivate func resetView() {
        self.textField.text = ""
        self.textField.resignFirstResponder()
        self.resultButton.isHidden = true
    }
     
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
        guard let value = self.textField.text, let intValue = Int(value),
            !value.isEmpty && value.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil,
            let isPrime = PrimeLogic.isPrime(with: intValue) else {
                self.resultButton.isHidden = true
                self.showError(title: "Invalid Input", error: "Please enter a valid number")
            return
        }
        guard intValue > 1 else {
            self.showError(title: "Invalid Input", error: "Prime Number must be greater than 1")
            return
        }
            
        self.textField.resignFirstResponder()
        self.viewModel.append(with: intValue, isPrime: isPrime)
        self.updateResultButtonState(with: isPrime)
    }
    
    @IBAction func didTapResultButton(_ sender: UIButton) {
        guard let last = self.viewModel.history.last, let value = last.number else {
            self.showError(error: "Cound't find any history")
            return
        }
        self.showLoading()
        self.viewModel.getNumberInfo(with: value) { (number, error) in
            self.hideLoading()
            guard error == nil else {
                self.showError(error: error?.message)
                return
            }
            guard let number = number, let message = number.text, !message.isEmpty, let value = number.number else {
                self.showError(error: "Invalid Data")
                return
            }
            print(message)
            self.showDialog(title: "The importance of \(value)", message: message)
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
