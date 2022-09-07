//
//  CityCellTableViewCell.swift
//  LoadingWeather_RS
//
//  Created by Rodolphe Schnetzer on 07/09/2022.
//

import UIKit

class CityCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var imageCondition: UIImageView!
    @IBOutlet weak var temperatureCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cityInformations: Weather? {
        didSet {
            nameCity.text = cityInformations?.name
            temperatureCity.text = ("\(String(describing: cityInformations?.main.temp)) °C")
            
            if cityInformations?.weather[0].weatherDescription == "nuageux" {
                imageCondition.image = UIImage(named: "soleilNuageux")
            }
            
        }
    }

}
