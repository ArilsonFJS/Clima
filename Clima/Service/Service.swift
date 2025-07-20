//
//  Service.swift
//  Clima
//
//  Created by Arilson Silva on 15/04/25.
//

import Foundation

protocol ClimaServiceDelegate {
    func didUpdateWeather(_ serviceClima: Service, weather: ClimaModel)
    func didFailWithError(error: Error)
}

class Service {
    
    var delegate: ClimaServiceDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(APIConstants.baseUrl)\(cityName)&appid=\(APIConstants.apiKey)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if error != nil {
                self?.delegate?.didFailWithError(error: error!)
                print(error!.localizedDescription)
                return
            }
            
            if let safeData = data {
                if let weather = self?.parseJson(safeData) {
                    self?.delegate?.didUpdateWeather(self ?? Service(), weather: weather)
                }
            }
        }.resume()
    }
    
    private func parseJson(_ weatherData: Data) -> ClimaModel? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodeData = try jsonDecoder.decode(ClimaData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            
            let weather = ClimaModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch{
            print(error.localizedDescription)
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
