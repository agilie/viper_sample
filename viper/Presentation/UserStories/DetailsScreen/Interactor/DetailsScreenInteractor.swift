//
//  DetailsScreenInteractor.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation
import PromiseKit

class DetailsScreenInteractor {

    var weatherService: WeatherService!

}

/**
 * Presenter -> Interactor
 */
extension DetailsScreenInteractor: DetailsScreenInteractorInput {
	
    func city(with id: Int) -> City? {
        return weatherService.city(with: id)
    }
    
    func obtainCurrentWeather(for cityId: Int) -> Promise<CurrentWeather> {
        return weatherService.obtainCurrentWeather(for: cityId)
    }

}
