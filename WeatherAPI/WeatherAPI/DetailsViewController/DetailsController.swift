//
//  DetailsController.swift
//  WeatherAPI
//
//  Created by Victoria on 9.02.22.
//

import UIKit

class DetailsController: UIViewController {

    var weather: Weather?
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mainWeatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let city = weather?.city {
            cityLabel.text = "City: \(String(city))"
        }
        if let mainWeather = weather?.mainWeather {
            mainWeatherLabel.text = "Weather: \(String(mainWeather))"
        }
        if let humidity = weather?.humidity {
            humidityLabel.text = "Humidity: \(String(humidity))"
        }
        if let pressure = weather?.pressure {
            pressureLabel.text = "Pressure: \(String(pressure))"
        }
        if let temperature = weather?.tempCelsius {
            temperatureLabel.text = "\(String(format: "%.0f", temperature))℃"
        }
        if let country = weather?.country {
            countryLabel.text = String(country)
        }
    }

}
