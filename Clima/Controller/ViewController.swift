//
//  ViewController.swift
//  Clima
//
//  Created by Arilson Silva on 03/04/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let climaView = ClimaView()
    
    override func loadView() {
        self.view = climaView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        climaView.searchTextField.delegate = self
        callbackButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        climaView.searchTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaView.searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if climaView.searchTextField.text != "" {
            return true
        } else {
            climaView.searchTextField.placeholder = "Type something"
            return false
        }
    }
    
    private func callbackButton(){
        climaView.actionButton = { [ weak self ] in
            self?.handleCustomButton()
        }
    }
    
    private func handleCustomButton() {
        climaView.searchTextField.endEditing(true)
        
    }
}

