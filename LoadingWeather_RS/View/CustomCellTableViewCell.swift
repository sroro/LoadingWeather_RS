//
//  CustomCellTableViewCell.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 08/09/2022.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var temperatureCity: UILabel!
    @IBOutlet weak var imageCondition: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cityInformations: Weather? {
        didSet {
            nameCity.text = cityInformations?.name
            temperatureCity.text = "\(cityInformations?.main.temp ?? 0) °C "
            
            if (cityInformations?.weather[0].weatherDescription == "nuageux") {
                imageCondition.image = UIImage(named: "soleilNuageux")
            } else if (cityInformations?.weather[0].weatherDescription == "pluvieux") {
                imageCondition.image = UIImage(named: "pluie")
            } else if (cityInformations?.weather[0].weatherDescription == "soleil") {
                imageCondition.image = UIImage(named: "soleil")
            } else if (cityInformations?.weather[0].weatherDescription == "nuageux") {
                imageCondition.image = UIImage(named: "nuage")
            }  else if (cityInformations?.weather[0].weatherDescription == "ciel dégagé") {
                imageCondition.image = UIImage(named: "soleil")
            } else if (cityInformations?.weather[0].weatherDescription == "couvert") {
                imageCondition.image = UIImage(named: "nuage")
            }
            
        }
    }
    
}
