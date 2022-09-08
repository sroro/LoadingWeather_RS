//
//  WeatherData.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 06/09/2022.
//

import Foundation


struct Weather: Decodable {
    let main: Main
    let weather: [Weathers]
    let name: String
}


// MARK: - Main
struct Main: Decodable {
    let temp : Double
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}

// MARK: - Weather
struct Weathers: Decodable {
    let main, weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case  main
        case weatherDescription = "description"
    }
}

