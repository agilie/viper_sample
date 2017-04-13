//
//  RequestBuilder.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import Alamofire

class RequestBuilder {
    
    // MARK:
    let endpoint: String = "http://api.openweathermap.org"
    let appId: String = "9d03bbae3f696b721505542d741588b9" //whether api key
    
    // MARK:
    func requestUrl(path: String) -> URLConvertible {
        return endpoint + path
    }
    
    // MARK: Requests
    func weather(for cityId: Int) -> URLRequest? {
        let url = requestUrl(path: "/data/2.5/weather")
        let parameters: [String: Any] = ["id" : cityId, "appid": appId]
        return try? URLEncoding.default.encode(URLRequest(url: url, method: .get), with: parameters)
    }

}
