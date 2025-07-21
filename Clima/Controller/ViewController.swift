//
//  ViewController.swift
//  Clima
//
//  Created by Arilson Silva on 03/04/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaServiceDelegate {
    
    private let climaView = ClimaView()
    var service = Service()
    
    override func loadView() {
        self.view = climaView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        climaView.searchTextField.delegate = self
        callbackButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        climaView.searchTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = climaView.searchTextField.text {
            service.fetchWeather(cityName: city)
        }
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
    
    func didUpdateWeather(_ serviceClima: Service, weather: ClimaModel) {
        
        DispatchQueue.main.async {
            self.climaView.temperatureLabel.text = weather.temperatureString
            self.climaView.cityLabel.text = weather.cityName
            self.climaView.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
}

