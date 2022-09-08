//
//  Alert+ext.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 08/09/2022.
//

import Foundation
import UIKit

extension WeatherViewController {

    func alertError(){
        
        let alert = UIAlertController(title: "No Data", message: "Oups...La météo ne répond pas", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }

}
