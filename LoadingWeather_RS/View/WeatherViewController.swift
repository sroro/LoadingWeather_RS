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
        
        tableView.isHidden = true
        tableView.reloadData()
        self.tableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cellCity")
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(getWeather), userInfo: nil, repeats: true)
        timerMessage = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(setWaitingMessage), userInfo: nil, repeats: true)
        timerProgressView = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setProgressView), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    //MARK: - Properties
    let viewModel = ViewModel()
    
    var timer: Timer?
    var timerMessage: Timer?
    var timerProgressView: Timer?
    
    var weather = WeatherService()
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
    
    
    //MARK: - Methods
    
    // Appel réseau API OpenWeather
    @objc func getWeather() {
        
        if indexCalled <= cityArray.count-1 {
            let cityRandom = cityArray[indexCalled]
            
            weather.getWeather(place: cityRandom) { result in
                DispatchQueue.main.async {
                    switch result {
                    case.failure(_):
                        print("error")
                        
                        self.alertError()
                        
                    case.success(let data):
                        print(data.name)
                        self.arrayCities.append(data)
                        self.indexCalled += 1
                    }
                }
               
            }
        } else {
            timer?.invalidate()
    
        }
    }
    
    
    
    // return Back viewController
    @IBAction func returnBackButton(_ sender: Any) {
        self.dismiss(animated: true)
        timer?.invalidate()
        progressView.progress = 0.0
    }
    
    
    @objc func setWaitingMessage() {
        
        if indexMessage <= messages.count-1 {
            waitinMessage.text = messages[indexMessage]
            indexMessage += 1
        } else {indexMessage = 0}
        
        DispatchQueue.main.asyncAfter(deadline: .now()+50) {
            self.timerMessage?.invalidate()
            self.waitinMessage.text = "FINITO"
        }
    }
    
    
    // Mise en place progressView
    @objc func setProgressView() {
        
        valueProgressView = valueProgressView + 0.02
        progressView.setProgress(valueProgressView, animated: true)
        
        if valueProgressView >= 1 {
            progressView.isHidden = true
            timerProgressView?.invalidate()
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityArray.count
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row > arrayCities.count-1){
        return UITableViewCell()
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellCity", for: indexPath) as?  CustomCellTableViewCell else { return UITableViewCell()}
        let arrayCity = arrayCities[indexPath.row]

        cell.cityInformations = arrayCity
        
       
        return cell
        
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
    
    
    
    
    
}
