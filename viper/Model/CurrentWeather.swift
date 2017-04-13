//
//  CurrentWhether.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentWeather: Mappable {
    
    var clouds: Float = 0
    var humidity: Float = 0
    var pressure: Float = 0
    var temperature: Float = 0
    var city: String = ""
    var windDegree: Float = 0
    var windSpeed: Float = 0
    var visibility: Float = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        clouds <- map["clouds.all"]
        humidity <- map["main.humidity"]
        pressure <- map["main.pressure"]
        temperature <- map["main.temp"]
        city <- map["name"]
        windDegree <- map["wind.deg"]
        windSpeed <- map["wind.speed"]
        visibility <- map["visibility"]
    }

    var cloudsString: String {
        return "Clouds: \(Int(clouds))%"
    }

    var humidityString: String {
        return "Humidity: \(Int(humidity))%"
    }
    
    var pressureString: String {
        return "Pressure: \(Int(pressure)) hPa"
    }
    
    var temperatureString: String {
        let celsius = (temperature - 273.15)
        return "\(Int(celsius))º"
    }
    
    var windString: String {
        return "Wind: direction \(Int(windDegree))º, speed \(Int(windSpeed))m/s"
    }

    var visibilityString: String {
        return "Visibility: \(Int(visibility)) meters"
    }
    
}
