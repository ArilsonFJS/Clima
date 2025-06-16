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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Criar uma URL
        guard let url = URL(string: urlString) else { return }
        
        //2. Criar uma URLSession e dar uma tarefa(task) a sessao
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
            }
        }.resume()//3. Iniciar tarefa(task)
        
        
        
    }
}
