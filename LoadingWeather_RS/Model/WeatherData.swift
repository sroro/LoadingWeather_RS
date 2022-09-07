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
    let timezone, id: Int
    let name: String
}


// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
       
    }
}

// MARK: - Weather
struct Weathers: Decodable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

