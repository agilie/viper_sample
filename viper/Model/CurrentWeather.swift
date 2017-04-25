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
    
    var clouds: Float?
    var humidity: Float?
    var pressure: Float?
    var temperature: Float?
    var city: String?
    var windDegree: Float?
    var windSpeed: Float?
    var visibility: Float?
    
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
        let valueString = stringValue(for: clouds)
        return "Clouds: \(valueString)%"
    }

    var humidityString: String {
        let valueString = stringValue(for: humidity)
        return "Humidity: \(valueString)%"
    }
    
    var pressureString: String {
        let valueString = stringValue(for: pressure)
        return "Pressure: \(valueString) hPa"
    }
    
    var temperatureString: String {
        var valueString = "-"
        if let temp = temperature {
            valueString = "\(temp - 273.15)"
        }
        return "\(valueString)º"
    }
    
    var windString: String {
        let valueStringDegree = stringValue(for: windDegree)
        let valueStringSpeed = stringValue(for: windSpeed)
        return "Wind: direction \(valueStringDegree)º, speed \(valueStringSpeed)m/s"
    }

    var visibilityString: String {
        let valueString = stringValue(for: visibility)
        return "Visibility: \(valueString) meters"
    }
    
}

extension CurrentWeather {
    
    func stringValue(for value: Any?) -> String {
        return value != nil ? "\(value!)" : "-"
    }
    
}
