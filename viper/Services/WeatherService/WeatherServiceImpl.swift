//
//  WheatherServiceImpl.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import PromiseKit

class WeatherServiceImpl {
    
    let apiService: APIService!
    lazy fileprivate var _cities: [City] = {
        return [
            City(title: "London", id: 2643743),
            City(title: "New York", id: 5128638),
            City(title: "Paris", id: 2968815),
            City(title: "Kyiv", id: 703447),
            City(title: "California", id: 5332921),
            City(title: "Madrid", id: 3117735),
            City(title: "Berlin", id: 2950159)
        ]
    }()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
}

extension WeatherServiceImpl: WeatherService {
    
    func obtainCurrentWeather(for cityId: Int) -> Promise<CurrentWeather> {
        return apiService.obtainCurrentWeather(for: cityId)
    }
    
    func city(with id: Int) -> City? {
        return _cities.first { (city) -> Bool in
            return city.id == id
        }
    }
    
    var cities: [City] {
        return _cities
    }
    
}
