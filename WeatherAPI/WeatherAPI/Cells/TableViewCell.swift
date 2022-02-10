//
//  TableViewCell.swift
//  WeatherAPI
//
//  Created by Victoria on 9.02.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(weather: Weather) {
        cityNameLabel.text = weather.city
        temperatureLabel.text = "\(String(format: "%.0f", weather.tempCelsius))℃"
    }
    
}
