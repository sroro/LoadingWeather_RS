//
//  WeatherViewController.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 06/09/2022.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var waitingMessageLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var RennesCity: UILabel!
    @IBOutlet weak var ParisCity: UILabel!
    @IBOutlet weak var NantesCity: UILabel!
    @IBOutlet weak var BordeauxCity: UILabel!
    @IBOutlet weak var LyonCity: UILabel!
    
    @IBOutlet weak var RennesTemperature: UILabel!
    @IBOutlet weak var ParisTemperature: UILabel!
    @IBOutlet weak var NantesTemperature: UILabel!
    @IBOutlet weak var BordeauxTemperature: UILabel!
    @IBOutlet weak var LyonTemperature: UILabel!
    
    
    @IBOutlet weak var RennesImages: UIImageView!
    @IBOutlet weak var ParisImage: UIImageView!
    @IBOutlet weak var NantesImage: UIImageView!
    @IBOutlet weak var BordeauxImage: UIImageView!
    @IBOutlet weak var LyonImage: UIImageView!
    
    @IBOutlet weak var returnBackButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    //MARK: - Properties
    

   
    

}
