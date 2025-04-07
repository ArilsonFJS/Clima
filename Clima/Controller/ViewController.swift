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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        climaView.searchTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaView.searchTextField.text = ""
    }
    
    private func callbackButton(){
        climaView.actionButton = { [ weak self ] in
            self?.handleCustomButton()
        }
    }
    
    private func handleCustomButton() {
        climaView.searchTextField.resignFirstResponder()
        climaView.searchTextField.text = ""
    }
}

