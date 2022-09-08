//
//  WeatherViewModel.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 08/09/2022.
//

import Foundation
import UIKit

class ViewModel {
    
    let weatherService = WeatherService()
    
    var arrayCities = [Weather]()

    
    var indexCalled = 0
    var indexMessage = 0
    var valueProgressView: Float = 0.0
    
    let cityArray = ["Nantes", "Paris", "Rennes", "Bordeaux", "Lyon"]
    
    private let messages = [
        "Nous téléchargeons les données…",
        "C’est presque fini…",
        " Plus que quelques secondes avant d’avoir le résultat…"
    ]
    
    
}
