//
//  ViewModel.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 20/11/2022.
//

import Foundation
class weatherViewModel {
    let network = WeatherService()
   
    
    var updateWeather: ((_ updateWeather: Weather?) -> Void)?
    
    func getWeather(place: String) {
        network.getWeather(place: place) { [weak self] resultat in
            switch resultat {
            case.failure(_):
                print("no Data")
                
            case.success(let data):
                self?.updateWeather?(data)
            }
        }
    }
}
