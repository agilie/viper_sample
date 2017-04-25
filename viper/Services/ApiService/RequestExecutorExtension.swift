//
//  RequestExecutorExtension.swift
//  viper
//
//  Created by Sergii Avilov on 4/11/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper

extension RequestExecutor {
    
    func promiseQuery<ResultType: Mappable>(request: URLRequest?) -> Promise<ResultType> {
        return Promise<ResultType> { (fullfit, reject) in
            guard let request = request else {
                reject(APIError(message: "Invalid request"))
                return
            }
            self.runRequest(request: request) { (json, err) in
                if let err = err {
                    reject(err)
                } else {
                    if let obj = Mapper<ResultType>(context: nil).map(JSONObject: json) {
                        fullfit(obj)
                    } else {
                        reject(APIError(message: "Parsing error"))
                    }
                }
            }
            
        }
    }
    
}
