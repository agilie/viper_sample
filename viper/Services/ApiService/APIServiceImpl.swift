//
//  APIServiceImpl.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import PromiseKit

class APIServiceImpl {
    
    fileprivate let executor: RequestExecutor
    fileprivate let builder: RequestBuilder
    
    init() {
        builder = RequestBuilder()
        executor = RequestExecutor(requestBuilder: builder)        
    }
    
}

extension APIServiceImpl: APIService {
    
    func obtainCurrentWeather(for cityId: Int) -> Promise<CurrentWeather> {
        return executor.promiseQuery(request: builder.weather(for: cityId))
    }
    
}
