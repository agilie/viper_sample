//
//  APIService.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import PromiseKit

protocol APIService {
    
    func obtainCurrentWeather(for cityId: Int) -> Promise<CurrentWeather>
    
}
