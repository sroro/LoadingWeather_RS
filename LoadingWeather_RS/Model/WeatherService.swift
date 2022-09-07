//
//  WeatherService.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 06/09/2022.
//

import Foundation

final class WeatherService {
    
    enum NetworkError: Error {
        case noData, noResponse, undecodable
    }

    // MARK: - properties
    
    private let session : URLSession
    private var task: URLSessionDataTask?
    
    // MARK: - initializer
    
    init(session:URLSession = URLSession(configuration: .default)){
        self.session = session
    }
    
    // MARK: - Methods
    
    ///Récupère conditions météorologique
 func getWeather(place: String, callback: @escaping (Result<Weather, Error> ) -> Void) {
        guard let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=0e5238f1666629ac73df15b0c333ae97&units=metric&lang=fr&q=\(place)") else {return}
        
        task?.cancel()
        task = session.dataTask(with: weatherUrl, completionHandler: { (data, response, error) in
                
                guard let data = data, error == nil else {
                    callback(.failure(NetworkError.noData))
                    return
                }
            
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NetworkError.noResponse))
                    return
                }
                guard let responseJSON = try? JSONDecoder().decode(Weather.self, from: data) else {
                    callback(.failure(NetworkError.undecodable))
                    return
                }
                callback(.success(responseJSON))
        })
        task?.resume()
    }
}

