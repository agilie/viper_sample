//
//  DetailsScreenInteractorInput.swift
//  viper
//
//  Created by Sergii Avilov on 19/01/2017.
//  Copyright © 2017 Agilie. All rights reserved.
//

import Foundation
import PromiseKit

/**
 * Presenter -> Interactor
 */
protocol DetailsScreenInteractorInput {

    func city(with id: Int) -> City?
    func obtainCurrentWeather(for cityId: Int) -> Promise<CurrentWeather>

}
