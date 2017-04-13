//
//  ServicesAssemblyImpl.swift
//  viper
//
//  Created by Sergii Avilov on 1/17/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ServicesAssemblyImpl: ServicesAssemblyProtocol {
    
    let application: UIApplication
    //All Available Services should be here like
    let apiService: APIService
    let weatherService: WeatherService

    init(application: UIApplication) {
        self.application = application
        apiService = APIServiceImpl()
        weatherService = WeatherServiceImpl(apiService: apiService)
    }
    
}
