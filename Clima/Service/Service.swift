//
//  Service.swift
//  Clima
//
//  Created by Arilson Silva on 15/04/25.
//

import Foundation

class Service {
    
    func fetchWeather(cityName: String) {
        let urlString = "\(APIConstants.baseUrl)\(cityName)&appid=\(APIConstants.apiKey)"
        
        guard let url = URL(string: urlString) else { return }
    }
}
