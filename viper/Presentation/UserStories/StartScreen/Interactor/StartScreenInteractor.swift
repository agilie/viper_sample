//
//  StartScreenInteractor.swift
//  viper
//
//  Created by Sergii Avilov on 18/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation

class StartScreenInteractor {

    var weatherService: WeatherService!
    
}

/**
 * Presenter -> Interactor
 */
extension StartScreenInteractor: StartScreenInteractorInput {

    var cities: [City] {
        return weatherService.cities
    }

}
