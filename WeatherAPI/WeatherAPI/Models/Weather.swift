//
//  Weather.swift
//  WeatherAPI
//
//  Created by Victoria on 9.02.22.
//

import Foundation

struct Weather {
    
    let city: String
    let country: String
    let longitude: Double
    let latitude: Double
    
    let mainWeather: String
    
    private let temp: Double
    var tempCelsius: Double {
        return temp - 273.15
    }
    
    let humidity: Int
    let pressure: Int
    
    init(weatherData: [String: AnyObject]) {
     
        city = weatherData["name"] as! String
        
        let coordDictionary = weatherData["coord"] as! [String: AnyObject]
        longitude = coordDictionary["lon"] as! Double
        latitude = coordDictionary["lat"] as! Double
        
        let weatherDictionary = weatherData["weather"]![0] as! [String: AnyObject]
        mainWeather = weatherDictionary["main"] as! String
        
        let mainDictionary = weatherData["main"] as! [String: AnyObject]
        temp = mainDictionary["temp"] as! Double
        humidity = mainDictionary["humidity"] as! Int
        pressure = mainDictionary["pressure"] as! Int
         
        let sysDictionary = weatherData["sys"] as! [String: AnyObject]
        country = sysDictionary["country"] as! String
      }

}
