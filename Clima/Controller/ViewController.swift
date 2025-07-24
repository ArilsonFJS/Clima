//
//  ViewController.swift
//  Clima
//
//  Created by Arilson Silva on 03/04/25.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let climaView = ClimaView()
    var service = Service()
    let locationManager = CLLocationManager()
    
    
    override func loadView() {
        self.view = climaView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        service.delegate = self
        climaView.searchTextField.delegate = self
        callbackButton()
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

//MARK: - ClimaServiceDelegate
extension ViewController: ClimaServiceDelegate {
    
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

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
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
}

//MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        service.fetchWeather(latitude: lat, longitude: lon)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}

