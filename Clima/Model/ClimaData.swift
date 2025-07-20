//
//  Clima.swift
//  Clima
//
//  Created by Arilson Silva on 07/04/25.
//

import Foundation

struct ClimaData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
