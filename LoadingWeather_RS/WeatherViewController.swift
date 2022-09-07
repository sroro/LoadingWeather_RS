//
//  WeatherViewController.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 06/09/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var waitinMessage: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(getWeather), userInfo: nil, repeats: true)
        timerProgressView = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(setProgressView), userInfo: nil, repeats: true)
    }
    
    
    
    //MARK: - Properties
    
    
    var timer: Timer?
    var timerProgressView: Timer?
    var weather = WeatherService()
    var arrayCities = [Weather]()
    
    var indexCalled = 0
    var valueProgressView: Float = 0.0
   
    let cityArray = ["Nantes", "Paris", "Rennes", "Bordeaux", "Lyon"]
    
    private let messages = [
        "Downloading data...",
        "A few more seconds...",
        "Almost done..."
    ]
    
    
    //MARK: - Methods
    
    
    @objc func getWeather() {
        
        if indexCalled <= cityArray.count-1 {
            let cityRandom = cityArray[indexCalled]
            
            weather.getWeather(place: cityRandom) { result in
                DispatchQueue.main.async {
                    switch result {
                    case.failure(_):
                        print("error")
                    case.success(let data):
                        print(data.name)
                        self.arrayCities.append(data)
                        self.indexCalled += 1
                    }
                }
            }
           
        } else {
            timer?.invalidate()
            print(self.arrayCities)
        }
    }
    
    
    
    // return Back viewController
    @IBAction func returnBackButton(_ sender: Any) {
        self.dismiss(animated: true)
        timer?.invalidate()
        progressView.progress = 0.0
    }
    
    
    @objc func setProgressView() {
        
        valueProgressView = valueProgressView + 0.20
        progressView.setProgress(valueProgressView, animated: true)
        
        if valueProgressView >= 1 {
            timerProgressView?.invalidate()
        }

        print(valueProgressView)
    }
    
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as?  CityCellTableViewCell else { return UITableViewCell()}
        let arrayCity = arrayCities[indexPath.row]
        cell.cityInformations = arrayCity
        return cell
    }
    
    
    
    
    
    
    
}
